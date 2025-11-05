# AGENTS.md - PokéDecks API

## 📋 Visão Geral do Projeto

**PokéDecks** é uma API RESTful desenvolvida em **Java 21 puro**, sem frameworks como Spring Boot. O projeto foi construído com o objetivo de ter o **mínimo de dependências externas** possível, utilizando implementações nativas do Java e apenas bibliotecas essenciais.

### 🎯 Objetivo
Reescrita de uma API Spring Boot existente para uma abordagem **minimalista e agnóstica**, mantendo apenas:
- PostgreSQL Driver (JDBC)
- JJWT (validação JWT segura)
- Gson (JSON parsing)

---

## 🏗️ Arquitetura em Camadas

```
┌─────────────────────────────────────────┐
│         HTTP Server Layer               │
│   (SimpleHttpServer, AuthFilter,        │
│    ServletAdapter, Request, Response)   │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│        Controllers Layer                │
│  (UserController, CardController, etc)  │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│         Services Layer                  │
│   (UserService, CardService, etc)       │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│          DAO Layer                      │
│     (UserDAO, CardDAO, etc)             │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│         Database Layer                  │
│      (PostgreSQL via JDBC)              │
└─────────────────────────────────────────┘
```

---

## 🚀 Fluxo de Requisição Completo

```
Cliente HTTP
   ↓
SimpleHttpServer (porta 8080)
   ↓
AuthFilter (valida JWT e seta email/role)
   ↓
ServletAdapter (adapta HttpExchange → Request/Response)
   ↓
Controller (routing, validação auth/authz)
   ↓
Service (lógica de negócio)
   ↓
DAO (acesso ao banco)
   ↓
PostgreSQL
```

---

## 🔧 Componentes Principais

### 1. Server Layer (`com.davsilvam.pokedecks.server`)

#### SimpleHttpServer
Servidor HTTP customizado sobre `com.sun.net.httpserver.HttpServer`.

**Método Principal:**
```java
public void register(String path, SimpleServlet servlet) {
    ServletAdapter adapter = new ServletAdapter(servlet);
    AuthFilter authFilter = new AuthFilter(adapter);
    server.createContext(path, authFilter);
}
```

#### AuthFilter
Middleware que intercepta todas as requisições para validar JWT.

**Responsabilidades:**
- Extrai token do header `Authorization: Bearer <token>`
- Valida assinatura HMAC-SHA256 e expiração
- Seta `authenticatedEmail` e `authenticatedRole` no HttpExchange
- Retorna 401 para tokens inválidos
- Permite requisições sem token (rotas públicas)

#### ServletAdapter
Padrão Adapter que converte `HttpExchange` → `Request/Response`.

**Responsabilidades:**
- Roteia para doGet/doPost/doPut/doDelete baseado no método HTTP
- Trata exceções globalmente:
  - `ResourceNotFoundException` → 404
  - `ResourceConflictException` → 409
  - `DatabaseException` → 500
  - `SecurityException` → 401
- Garante que resposta seja enviada e exchange fechado

#### SimpleServlet (Classe Abstrata)
```java
public abstract class SimpleServlet {
    public void doGet(Request req, Response res) throws IOException {
        res.error(405, "Method not allowed");
    }
    // doPost, doPut, doDelete...
}
```

Controllers estendem e sobrescrevem apenas os métodos necessários.

#### Request
Wrapper customizado que facilita acesso aos dados da requisição:
- `body()` - corpo da requisição
- `path()` - caminho da URL
- `query(String)` - query parameters
- `header(String)` - headers
- `authenticatedEmail()` - email do usuário autenticado
- `authenticatedRole()` - role do usuário

#### Response
Wrapper que facilita envio de respostas:
- `json(Object)` - envia JSON com status 200
- `json(int code, Map)` - JSON com código customizado
- `error(int code, String message)` - resposta de erro

---

### 2. Controllers Layer (`com.davsilvam.pokedecks.controllers`)

**Padrão de Implementação:**
```java
public class UserController extends SimpleServlet {
    private final UserService userService;
    
    @Override
    public void doGet(Request req, Response res) throws IOException {
        String path = req.path();
        
        if (path.equals("/api/users/me")) {
            String email = req.authenticatedEmail();
            if (email == null) {
                res.error(401, "Unauthorized");
                return;
            }
            UserResponseDTO user = userService.findByEmail(email);
            res.json(user);
        }
    }
}
```

**Controllers disponíveis:**
- `UserController` - `/api/users`
- `CardController` - `/api/cards`
- `SetController` - `/api/sets`
- `SerieController` - `/api/series`
- `OrderController` - `/api/orders`

**Padrões de Roteamento:**
- `path.equals()` para rotas exatas
- `path.matches()` para rotas com parâmetros
- Ordem: específico → geral

---

### 3. Services Layer (`com.davsilvam.pokedecks.services`)

**Responsabilidades:**
- Lógica de negócio
- Orquestração entre DAOs
- Transformação Entity → DTO
- **Wrapping de SQLException em DatabaseException**

**Exemplo:**
```java
public class UserService {
    public UserResponseDTO findById(UUID id) {
        try {
            User user = userDAO.findById(id);
            if (user == null) {
                throw new ResourceNotFoundException("Usuário com ID " + id);
            }
            return UserMapper.toDTO(user);
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao buscar usuário", e);
        }
    }
}
```

---

### 4. DAO Layer (`com.davsilvam.pokedecks.models.daos`)

**Interface base:**
```java
public interface DAO<E, ID> {
    E save(E entity) throws SQLException;
    E findById(ID id) throws SQLException;
    List<E> findAll() throws SQLException;
    void deleteById(ID id) throws SQLException;
}
```

**Implementações:**
- UserDAO, CardDAO, SetDAO, SerieDAO, OrderDAO
- PokemonDAO, EnergyDAO, TrainerDAO (especializações de cartas)

---

### 5. Security (`com.davsilvam.pokedecks.config.auth`)

#### JwtUtil
Utiliza biblioteca **JJWT** para validação segura:

```java
public static String validateAndExtractEmail(String token) {
    Claims claims = PARSER.parseSignedClaims(token).getPayload();
    
    // Valida expiração
    Date expiration = claims.getExpiration();
    if (expiration != null && expiration.before(new Date())) {
        throw new SecurityException("Token expired");
    }
    
    return claims.get("email", String.class);
}

public static String generateToken(String email, String role) {
    return Jwts.builder()
            .subject(email)
            .claim("email", email)
            .claim("role", role)
            .issuedAt(new Date())
            .expiration(new Date(System.currentTimeMillis() + 86400000)) // 24h
            .signWith(KEY)
            .compact();
}
```

**Configuração:**
- Secret key via env var `JWT_SECRET` (mínimo 32 caracteres)
- Validação de assinatura HMAC-SHA256
- Validação de expiração automática

---

### 6. Exceptions (`com.davsilvam.pokedecks.config.errors.exceptions`)

**Hierarquia:**
- `ResourceNotFoundException` - 404 (recurso não encontrado)
- `ResourceConflictException` - 409 (conflito)
- `DatabaseException` - 500 (erro de banco de dados)
- `SecurityException` (Java nativo) - 401 (autenticação falhou)

Todas estendem `RuntimeException` e são tratadas globalmente pelo `ServletAdapter`.

---

### 7. DTOs e Mappers

**DTOs (Records do Java 21):**
```java
public record UserResponseDTO(
    UUID id,
    String username,
    String email,
    String name,
    UserRole role
) {}
```

**Mappers:**
```java
public class UserMapper {
    public static UserResponseDTO toDTO(User user) {
        return new UserResponseDTO(
            user.getId(),
            user.getUsername(),
            user.getEmail(),
            user.getName(),
            user.getRole()
        );
    }
}
```

---

## 📦 Dependências (pom.xml)

```xml
<!-- Database -->
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <version>42.7.8</version>
</dependency>

<!-- JWT Seguro -->
<dependency>
    <groupId>io.jsonwebtoken</groupId>
    <artifactId>jjwt-api</artifactId>
    <version>0.12.5</version>
</dependency>

<!-- JSON Parsing -->
<dependency>
    <groupId>com.google.code.gson</groupId>
    <artifactId>gson</artifactId>
    <version>2.10.1</version>
</dependency>
```

**Total: 3 bibliotecas externas** (mínimo absoluto)

---

## 🎯 Endpoints da API

| Rota | Método | Auth | Descrição |
|------|--------|------|-----------|
| `/api/users` | GET | Não | Lista usuários |
| `/api/users/me` | GET | Sim | Perfil do usuário |
| `/api/users/{id}` | GET | Não | Busca usuário |
| `/api/users/{id}` | PUT | Owner | Edita perfil |
| `/api/users/{id}` | DELETE | Owner | Deleta conta |
| `/api/users/{id}/orders` | GET | Não | Pedidos do usuário |
| `/api/cards` | GET | Não | Lista cartas |
| `/api/cards/search?name=x` | GET | Não | Busca por nome |
| `/api/cards/{id}` | GET | Não | Busca carta |
| `/api/cards/{id}` | DELETE | ADMIN | Deleta carta |
| `/api/sets` | GET | Não | Lista sets |
| `/api/sets/{id}` | GET | Não | Busca set |
| `/api/sets/{id}/cards` | GET | Não | Cartas do set |
| `/api/sets/{id}` | DELETE | ADMIN | Deleta set |
| `/api/series` | GET | Não | Lista séries |
| `/api/series/{id}` | GET | Não | Busca série |
| `/api/series/{id}/sets` | GET | Não | Sets da série |
| `/api/series/{id}` | DELETE | ADMIN | Deleta série |
| `/api/orders` | GET | ADMIN | Lista pedidos |
| `/api/orders` | POST | Sim | Cria pedido |
| `/api/orders/{id}` | GET | Não | Busca pedido |
| `/api/orders/{id}` | DELETE | ADMIN | Deleta pedido |

---

## ⚙️ Configuração

**Variáveis de Ambiente:**
```bash
# Obrigatórias
JWT_SECRET=sua-chave-secreta-minimo-32-caracteres
DB_URL=jdbc:postgresql://localhost:5432/pokedecks
DB_USER=postgres
DB_PASSWORD=postgres
```

**application.properties:**
```properties
db.url=jdbc:postgresql://localhost:5432/pokedecks
db.user=postgres
db.password=postgres
```

---

## 🚀 Como Executar

```bash
# 1. Configurar variáveis de ambiente
export JWT_SECRET="sua-chave-secreta-32-chars-min"

# 2. Compilar
mvn clean compile

# 3. Executar
mvn exec:java -Dexec.mainClass="com.davsilvam.pokedecks.PokeDecksApplication"

# Servidor inicia em http://localhost:8080
```

---

## ✅ Pontos Fortes

1. **Zero Framework** - Java puro, controle total
2. **Mínimas Dependências** - Apenas 3 bibliotecas
3. **Startup Instantâneo** - Sem overhead de framework
4. **Type Safe** - Erros em compile time
5. **Arquitetura Limpa** - Separação clara de camadas
6. **Segurança** - JWT com validação HMAC-SHA256
7. **Exceções Consistentes** - Tratamento global
8. **Código Explícito** - Sem magia ou reflection

---

**Autor:** @davsilvam  
**Versão:** 1.0.0  
**Java:** 21  
**Data:** 2025-11-04

## 🔧 Componentes Principais

### 1. Server Layer (`com.davsilvam.pokedecks.server`)

#### SimpleHttpServer
Servidor HTTP customizado construído sobre `com.sun.net.httpserver.HttpServer` (API nativa do JDK).

**Responsabilidades:**
- Gerenciar rotas e mapeamento de endpoints
- Delegar requisições para os controllers apropriados
- Tratamento global de exceções
- Adaptação de HttpExchange para Request/Response customizados

**Principais métodos:**
- `register(String path, SimpleServlet servlet)`: Registra um controller para uma rota
- `start()`: Inicia o servidor HTTP

#### SimpleServlet (Interface)
Interface que define o contrato para todos os controllers.

**Métodos:**
- `doGet(Request, Response)`: Requisições GET
- `doPost(Request, Response)`: Requisições POST
- `doPut(Request, Response)`: Requisições PUT
- `doDelete(Request, Response)`: Requisições DELETE

#### Request
Wrapper customizado para HttpExchange que facilita o acesso aos dados da requisição.

**Principais métodos:**
- `body()`: Retorna o corpo da requisição como String
- `path()`: Retorna o caminho da URL
- `param(String)`: Extrai parâmetros da URL
- `query(String)`: Retorna parâmetros de query string
- `header(String)`: Retorna headers
- `authenticatedEmail()`: Email do usuário autenticado (após AuthFilter)
- `authenticatedRole()`: Role do usuário autenticado

#### Response
Wrapper customizado para HttpExchange que facilita o envio de respostas.

**Principais métodos:**
- `json(Object)`: Envia resposta JSON com status 200
- `json(int code, Map<String, Object>)`: Envia resposta JSON com código customizado
- `error(int code, String message)`: Envia resposta de erro
- `status(int code, String body)`: Envia resposta com status e corpo customizados

### 2. Controllers Layer (`com.davsilvam.pokedecks.controllers`)

Controllers implementam `SimpleServlet` e são responsáveis por:
- Roteamento fino (path matching com regex)
- Validação de autenticação/autorização
- Parsing de parâmetros
- Delegação para services
- Formatação de respostas

**Controllers disponíveis:**
- `UserController`: `/api/users`
- `CardController`: `/api/cards`
- `SetController`: `/api/sets`
- `SerieController`: `/api/series`
- `OrderController`: `/api/orders`

**Exemplo de roteamento:**
```java
// UserController.doGet()
if (path.equals("/api/users/me")) { ... }
if (path.matches("^/api/users/[a-fA-F0-9\\-]+$")) { ... }
if (path.matches("^/api/users/[a-fA-F0-9\\-]+/orders$")) { ... }
```

### 3. Services Layer (`com.davsilvam.pokedecks.services`)

Camada de lógica de negócio que:
- Orquestra operações entre múltiplos DAOs
- Aplica regras de negócio
- Realiza validações
- Transforma entidades em DTOs (usando Mappers)

**Services disponíveis:**
- `UserService`
- `CardService`
- `SetService`
- `SerieService`
- `OrderService`

**Padrão de uso:**
```java
public class UserService {
    private final UserDAO userDAO;
    
    public UserResponseDTO findById(UUID id) throws SQLException {
        User user = userDAO.findById(id);
        if (user == null) {
            throw new ResourceNotFoundException("Usuário com ID " + id);
        }
        return UserMapper.toDTO(user);
    }
}
```

### 4. DAO Layer (`com.davsilvam.pokedecks.models.daos`)

Implementa o padrão DAO (Data Access Object) para acesso ao banco de dados.

**Interface base (`DAO<E, ID>`):**
```java
E save(E entity) throws SQLException;
E findById(ID id) throws SQLException;
List<E> findAll() throws SQLException;
boolean existsById(ID id) throws SQLException;
int count() throws SQLException;
void deleteById(ID id) throws SQLException;
```

**DAOs disponíveis:**
- `UserDAO`
- `CardDAO`
- `PokemonDAO`
- `EnergyDAO`
- `TrainerDAO`
- `SetDAO`
- `SerieDAO`
- `OrderDAO`
- `OrderItemDAO`

**Características:**
- Uso direto de JDBC (PreparedStatement, ResultSet)
- Conversão manual de ResultSet para entidades
- Gerenciamento manual de conexões (try-with-resources)
- SQL nativo

### 5. Models (`com.davsilvam.pokedecks.models`)

Entidades de domínio que representam as tabelas do banco:
- `User`
- `Card` (classe abstrata)
  - `Pokemon` (extends Card)
  - `Energy` (extends Card)
  - `Trainer` (extends Card)
- `Set`
- `Serie`
- `Order`
- `OrderItem`

**Enums:**
- `UserRole`: ADMIN, USER
- `CardCategory`: POKEMON, ENERGY, TRAINER

### 6. Configuration (`com.davsilvam.pokedecks.config`)

#### AppCompositionRoot
Implementa o padrão Composition Root para Dependency Injection manual.

**Responsabilidades:**
- Instanciar todas as dependências da aplicação
- Conectar as camadas (DAOs → Services → Controllers)
- Garantir single instance (singleton manual)

**Estrutura:**
```java
public final class AppCompositionRoot {
    // DAOs
    public final UserDAO userDAO;
    // Services
    public final UserService userService;
    // Controllers
    public final UserController userController;
    
    public AppCompositionRoot() {
        DatabaseConnection db = new DatabaseConnection();
        this.userDAO = new UserDAO(db);
        this.userService = new UserService(userDAO);
        this.userController = new UserController(userService, orderService);
    }
}
```

#### DatabaseConnection
Gerencia conexões com PostgreSQL usando configuração de `application.properties` ou variáveis de ambiente.

**Configurações:**
- `db.url` / `DB_URL`
- `db.user` / `DB_USER`
- `db.password` / `DB_PASSWORD`

#### Auth (Security)

**AuthFilter:**
- Middleware HTTP que intercepta TODAS as requisições
- Extrai e valida token JWT do header `Authorization: Bearer <token>`
- Se token VÁLIDO: adiciona atributos `authenticatedEmail` e `authenticatedRole` ao HttpExchange
- Se token INVÁLIDO: retorna 401 Unauthorized imediatamente
- Se SEM token: continua sem autenticação (permite rotas públicas)
- Integrado automaticamente em `SimpleHttpServer.register()`

**Fluxo:**
```
Cliente → SimpleHttpServer → AuthFilter → ServletHandler → Controller
                                  ↓
                           (valida token)
                                  ↓
                    ┌─────────────┴──────────────┐
                    ↓                            ↓
              Token Válido                 Token Inválido
                    ↓                            ↓
         Seta email/role                   Retorna 401
                    ↓
              Controller decide
              se precisa auth
```

**JwtUtil:**
- `validateAndExtractEmail(token)`: Valida token e retorna email
- `extractRole(token)`: Extrai role do token
- Verifica assinatura e expiração

### 7. Utilities (`com.davsilvam.pokedecks.util`)

#### JsonUtil
Utilitário para serialização/deserialização JSON usando javax.json-api.

**Métodos principais:**
- `String toJson(Object)`: Serializa objetos/maps/listas para JSON
- `Map<String, Object> fromJson(String)`: Deserializa JSON para Map
- `<T> T fromJson(String json, Class<T> entity)`: Deserializa JSON para objeto usando reflection
- `String message(String key, String value)`: Cria mensagem JSON simples

**Características:**
- Usa reflection para mapeamento de campos
- Suporta tipos primitivos e Strings
- Conversão manual (sem bibliotecas como Jackson ou Gson)

#### PropertiesConfig
Carregamento de configurações de `application.properties`.

## 📦 DTOs e Mappers

### DTOs (`com.davsilvam.pokedecks.services.dtos`)
Records Java para transferência de dados:

**Request DTOs:**
- `CreateUserRequestDTO`
- `LoginUserRequestDTO`
- `EditUserProfileRequestDTO`
- `CreateOrderRequestDTO`

**Response DTOs:**
- `UserResponseDTO`
- `CardResponseDTO`
- `CardBriefResponseDTO`
- `SetResponseDTO`
- `SetWithCardsResponseDTO`
- `SerieResponseDTO`
- `OrderResponseDTO`
- `OrderItemResponseDTO`
- `AuthenticateResponseDTO`

### Mappers (`com.davsilvam.pokedecks.services.mappers`)
Classes utilitárias para conversão Entity ↔ DTO:
- `UserMapper`
- `CardMapper`
- `SetMapper`
- `SerieMapper`
- `OrderMapper`
- `OrderItemMapper`

## 🚀 Fluxo de uma Requisição

```
1. Cliente HTTP
   ↓
2. SimpleHttpServer (porta 8080)
   ↓
3. AuthFilter (valida JWT e seta atributos)
   ↓ (se token inválido, retorna 401)
4. ServletHandler (adapta HttpExchange)
   ↓
5. Controller (doGet/doPost/doPut/doDelete)
   ↓ (verifica autenticação/autorização)
6. Service (lógica de negócio)
   ↓
7. DAO (acesso ao banco)
   ↓
8. PostgreSQL
   ↓
9. DAO retorna Entity
   ↓
10. Service converte para DTO
    ↓
11. Controller envia Response.json()
    ↓
12. Cliente recebe JSON
```

## 🛠️ Tecnologias e Decisões Técnicas

### Por que sem frameworks?

1. **Controle total**: Entender cada linha de código e comportamento
2. **Performance**: Menor overhead, startup mais rápido
3. **Aprendizado**: Compreensão profunda de HTTP, JDBC, JSON
4. **Simplicidade**: Menos "mágica", mais previsibilidade
5. **Minimalismo**: Apenas o necessário, sem bloat

### Trade-offs

**Vantagens:**
- ✅ Startup ultra-rápido
- ✅ Footprint de memória reduzido
- ✅ Total controle sobre comportamento
- ✅ Sem dependências transitivas
- ✅ Código mais explícito

**Desvantagens:**
- ❌ Mais código boilerplate
- ❌ Implementação manual de features comuns
- ❌ Menos ferramentas de produtividade
- ❌ Manutenção manual de DI
- ❌ Testing menos conveniente

## 📝 Convenções e Padrões

### Nomenclatura
- Controllers: `*Controller`
- Services: `*Service`
- DAOs: `*DAO`
- DTOs: `*RequestDTO` / `*ResponseDTO`
- Mappers: `*Mapper`

### Estrutura de Pacotes
```
com.davsilvam.pokedecks
├── config/           # Configurações (DB, Auth, DI)
├── controllers/      # HTTP Controllers
├── core/             # Interfaces e abstrações base
├── models/           # Entidades de domínio
│   ├── daos/         # Data Access Objects
│   └── enums/        # Enumerações
├── server/           # Camada HTTP customizada
├── services/         # Lógica de negócio
│   ├── dtos/         # Data Transfer Objects
│   └── mappers/      # Conversores Entity ↔ DTO
└── util/             # Utilitários (JSON, Properties)
```

### Tratamento de Erros
- Exceptions customizadas: `ResourceNotFoundException`, `ResourceConflictException`
- Global exception handling em `ServletHandler`
- Respostas JSON padronizadas para erros

### Database
- JDBC puro (java.sql.*)
- PreparedStatements para prevenir SQL injection
- Try-with-resources para gerenciamento de recursos
- Conversão manual ResultSet → Entity

## 🔐 Segurança

1. **Autenticação JWT**
   - Tokens validados no AuthFilter
   - Claims: email, role
   - Sem session/cookies

2. **Autorização**
   - Controllers verificam role quando necessário
   - Usuários só podem editar/deletar próprios dados

3. **SQL Injection**
   - Uso exclusivo de PreparedStatements
   - Nenhuma concatenação de SQL

## 🎯 Endpoints Principais

### Users
- `GET /api/users` - Listar todos
- `GET /api/users/me` - Usuário autenticado
- `GET /api/users/{id}` - Buscar por ID
- `GET /api/users/{id}/orders` - Pedidos do usuário
- `PUT /api/users/{id}` - Editar perfil
- `DELETE /api/users/{id}` - Deletar conta

### Cards
- `GET /api/cards`
- `GET /api/cards/{id}`

### Sets
- `GET /api/sets`
- `GET /api/sets/{id}`

### Series
- `GET /api/series`
- `GET /api/series/{id}`

### Orders
- `GET /api/orders`
- `POST /api/orders`

## 🧪 Como Contribuir

### Setup Local
1. Java 21+
2. PostgreSQL
3. Configurar `src/main/resources/application.properties`:
   ```properties
   db.url=jdbc:postgresql://localhost:5432/pokedecks
   db.user=seu_usuario
   db.password=sua_senha
   ```

### Build e Run
```bash
mvn clean package
java -jar target/pokedecks-se-1.0-SNAPSHOT.jar
```

### Adicionando Novos Endpoints
1. Criar DTO em `services/dtos/`
2. Criar Mapper em `services/mappers/`
3. Adicionar método no Service apropriado
4. Adicionar rota no Controller
5. Registrar controller no `PokeDecksApplication` se necessário

### Padrão de Código
- Usar records para DTOs
- Usar try-with-resources para recursos JDBC
- Validar inputs nos Services
- Retornar DTOs, não Entities
- Documentar métodos públicos complexos

## 📚 Referências Técnicas

- [JDK HttpServer](https://docs.oracle.com/en/java/javase/21/docs/api/jdk.httpserver/com/sun/net/httpserver/package-summary.html)
- [JDBC Tutorial](https://docs.oracle.com/javase/tutorial/jdbc/)
- [JSON-P (javax.json)](https://javaee.github.io/jsonp/)
- [PostgreSQL JDBC Driver](https://jdbc.postgresql.org/documentation/)

---

**Mantido por:** @davsilvam  
**Versão:** 1.0-SNAPSHOT  
**Java:** 21  
**Build Tool:** Maven
