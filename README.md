# 🃏 PokéDecks API

API RESTful para gerenciamento de coleções de cartas Pokémon TCG, desenvolvida em **Java 21 puro** sem frameworks como Spring Boot.

## 🎯 Características

- ✅ **Zero Frameworks** - Java puro, sem Spring Boot
- ✅ **Mínimas Dependências** - Apenas 4 bibliotecas externas essenciais
- ✅ **Autenticação JWT** - Validação HMAC-SHA256 segura com JJWT
- ✅ **Arquitetura em Camadas** - Separação clara: Server → Controllers → Services → DAOs
- ✅ **Type Safe** - Records do Java 21 para DTOs
- ✅ **Startup Rápido** - Sem overhead de framework, inicia em milissegundos
- ✅ **Security** - BCrypt para hashing de senhas

## 🛠️ Stack Tecnológica

- **Java 21** - Recursos modernos (Records, Pattern Matching)
- **PostgreSQL** - Banco de dados relacional via JDBC puro
- **JJWT** - Geração e validação de tokens JWT
- **Gson** - Serialização/deserialização JSON
- **BCrypt** - Hashing seguro de senhas
- **Native HttpServer** - `com.sun.net.httpserver` do JDK

## 🚀 Quick Start

### 1. Pré-requisitos

- Java 21+
- PostgreSQL 14+
- Maven 3.8+

### 2. Configuração

```bash
# Configurar variáveis de ambiente
export JWT_SECRET="sua-chave-secreta-minimo-32-caracteres"
export DB_URL="jdbc:postgresql://localhost:5432/pokedecks"
export DB_USER="postgres"
export DB_PASSWORD="postgres"
```

### 3. Executar

```bash
# Compilar
mvn clean compile

# Executar
mvn exec:java -Dexec.mainClass="com.davsilvam.pokedecks.PokeDecksApplication"

# Servidor disponível em http://localhost:8080
```

## 📡 Endpoints da API

### 🌍 Públicos (sem autenticação)

#### Cards
```bash
# Listar todas as cartas
GET /api/cards

# Buscar carta por ID
GET /api/cards/{id}

# Buscar cartas por nome
GET /api/cards/search?name=pikachu
```

#### Sets
```bash
# Listar todos os sets
GET /api/sets

# Buscar set por ID
GET /api/sets/{id}

# Listar cartas de um set
GET /api/sets/{id}/cards
```

#### Series
```bash
# Listar todas as séries
GET /api/series

# Buscar série por ID
GET /api/series/{id}

# Listar sets de uma série
GET /api/series/{id}/sets
```

#### Users (parcialmente público)
```bash
# Listar usuários
GET /api/users

# Buscar usuário por ID
GET /api/users/{id}

# Listar pedidos de um usuário
GET /api/users/{id}/orders
```

### 🔒 Protegidos (requer JWT válido)

```bash
# Obter perfil do usuário autenticado
GET /api/users/me
Headers: Authorization: Bearer <token>

# Editar perfil próprio
PUT /api/users/{id}
Headers: Authorization: Bearer <token>
Body: { "name": "Novo Nome", "username": "novo_username" }

# Deletar conta própria
DELETE /api/users/{id}
Headers: Authorization: Bearer <token>

# Criar pedido
POST /api/orders
Headers: Authorization: Bearer <token>
Body: { "items": [{"cardId": "uuid", "quantity": 2}] }

# Buscar pedido
GET /api/orders/{id}
Headers: Authorization: Bearer <token>
```

### 👑 Restritos (requer role ADMIN)

```bash
# Deletar carta
DELETE /api/cards/{id}
Headers: Authorization: Bearer <admin-token>

# Deletar set
DELETE /api/sets/{id}
Headers: Authorization: Bearer <admin-token>

# Deletar série
DELETE /api/series/{id}
Headers: Authorization: Bearer <admin-token>

# Listar todos os pedidos
GET /api/orders
Headers: Authorization: Bearer <admin-token>

# Deletar pedido
DELETE /api/orders/{id}
Headers: Authorization: Bearer <admin-token>
```

### 📋 Tabela Resumida

| Rota | Método | Auth | Role | Descrição |
|------|--------|------|------|-----------|
| `/api/cards` | GET | ❌ | - | Lista cartas |
| `/api/cards/search?name=x` | GET | ❌ | - | Busca por nome |
| `/api/cards/{id}` | GET | ❌ | - | Busca carta |
| `/api/cards/{id}` | DELETE | ✅ | ADMIN | Deleta carta |
| `/api/sets` | GET | ❌ | - | Lista sets |
| `/api/sets/{id}` | GET | ❌ | - | Busca set |
| `/api/sets/{id}/cards` | GET | ❌ | - | Cartas do set |
| `/api/sets/{id}` | DELETE | ✅ | ADMIN | Deleta set |
| `/api/series` | GET | ❌ | - | Lista séries |
| `/api/series/{id}` | GET | ❌ | - | Busca série |
| `/api/series/{id}/sets` | GET | ❌ | - | Sets da série |
| `/api/series/{id}` | DELETE | ✅ | ADMIN | Deleta série |
| `/api/users` | GET | ❌ | - | Lista usuários |
| `/api/users/me` | GET | ✅ | USER | Perfil próprio |
| `/api/users/{id}` | GET | ❌ | - | Busca usuário |
| `/api/users/{id}` | PUT | ✅ | Owner | Edita perfil |
| `/api/users/{id}` | DELETE | ✅ | Owner | Deleta conta |
| `/api/users/{id}/orders` | GET | ❌ | - | Pedidos do usuário |
| `/api/orders` | GET | ✅ | ADMIN | Lista pedidos |
| `/api/orders` | POST | ✅ | USER | Cria pedido |
| `/api/orders/{id}` | GET | ✅ | USER | Busca pedido |
| `/api/orders/{id}` | DELETE | ✅ | ADMIN | Deleta pedido |

## 🔧 Componentes Principais

### 1. Server Layer
- **SimpleHttpServer**: Servidor HTTP sobre `com.sun.net.httpserver.HttpServer`
- **AuthFilter**: Middleware que valida JWT em todas as requisições
- **ServletAdapter**: Adapta `HttpExchange` para `Request/Response`
- **Request**: Wrapper que facilita acesso a body, headers, query params, auth data
- **Response**: Wrapper para envio de JSON e tratamento de erros

### 2. Security
- **JwtUtil**: Geração e validação de tokens JWT com HMAC-SHA256
  - Valida assinatura e expiração automaticamente
  - Extrai email e role do payload
- **AuthFilter**: Intercepta requisições e valida tokens
  - Seta `authenticatedEmail` e `authenticatedRole` no contexto
  - Retorna 401 para tokens inválidos
  - Permite rotas públicas (sem token)

### 3. Controllers
Implementam `SimpleServlet` e gerenciam roteamento:
- Parsing de parâmetros da URL
- Validação de autenticação/autorização
- Delegação para services
- Formatação de respostas JSON

### 4. Services
- Lógica de negócio
- Orquestração entre DAOs
- Conversão Entity → DTO (usando Mappers)
- Wrapping de `SQLException` em `DatabaseException`

### 5. DAOs (Data Access Objects)
- Acesso direto ao PostgreSQL via JDBC
- PreparedStatements para prevenir SQL injection
- Conversão manual de `ResultSet` para entidades
- Try-with-resources para gerenciamento de conexões

### 6. DTOs e Mappers
- **DTOs**: Records do Java 21 para transferência de dados
- **Mappers**: Classes utilitárias para conversão Entity ↔ DTO
- Separação clara entre camadas (entities no DAO, DTOs nos controllers)

## 🏗️ Arquitetura em Camadas

### Visão Geral
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

### Fluxo de Requisição
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

## 📚 Documentação

- **[AGENTS.md](AGENTS.md)** - Documentação técnica completa da arquitetura
  - Detalhamento de cada camada (Server, Controllers, Services, DAOs)
  - Componentes principais (AuthFilter, ServletAdapter, Request/Response)
  - Padrões de código e convenções
  - Fluxo detalhado de requisições
  - Exemplos de implementação
- **[pom.xml](pom.xml)** - Configuração do Maven e dependências

## 👨‍💻 Desenvolvimento

### Estrutura de Pacotes

```
com.davsilvam.pokedecks
├── server/              # HTTP Server customizado
│   ├── SimpleHttpServer.java
│   ├── ServletAdapter.java
│   ├── SimpleServlet.java
│   ├── Request.java
│   └── Response.java
├── controllers/         # Endpoints REST
│   ├── UserController.java
│   ├── CardController.java
│   ├── SetController.java
│   ├── SerieController.java
│   └── OrderController.java
├── services/            # Lógica de negócio
│   ├── UserService.java
│   ├── CardService.java
│   ├── dtos/           # Data Transfer Objects (Records)
│   └── mappers/        # Entity ↔ DTO conversions
├── models/
│   ├── daos/           # Data Access Objects (JDBC)
│   │   ├── UserDAO.java
│   │   ├── CardDAO.java
│   │   └── ...
│   └── entities/       # Domain Entities
│       ├── User.java
│       ├── Card.java (abstrata)
│       ├── Pokemon.java
│       ├── Energy.java
│       ├── Trainer.java
│       ├── Set.java
│       ├── Serie.java
│       └── Order.java
├── config/
│   ├── auth/           # JWT e AuthFilter
│   │   ├── JwtUtil.java
│   │   └── AuthFilter.java
│   ├── database/       # Conexão JDBC
│   │   └── DatabaseConnection.java
│   ├── errors/         # Exception handlers
│   │   └── exceptions/
│   └── AppCompositionRoot.java  # DI manual
└── util/               # Utilitários
    ├── JsonUtil.java
    └── PropertiesConfig.java
```

### Próximos Passos

1. 📋 **Implementar endpoints de autenticação** (AuthController com login/register)
2. ✅ **Adicionar validação de DTOs** (validações de campos obrigatórios e formatos)
3. 🧪 **Criar testes automatizados** (unit tests para services e DAOs)
4. 🌐 **Configurar CORS** (permitir requisições de frontend)
5. 📊 **Logging estruturado** (logs de requisições e erros)
6. 🔄 **Connection pooling** (otimizar performance do banco)
7. 📖 **Documentação Swagger/OpenAPI** (documentar API automaticamente)

## 📄 Licença

Este projeto é de código aberto para fins educacionais.

## ✨ Autor

**David Menezes** ([@davsilvam](https://github.com/davsilvam))

---

**Versão:** 1.0.0  
**Última atualização:** 18/11/2025

---

## 💡 Por que sem frameworks?

### Vantagens
- ✅ **Startup ultra-rápido** - Inicia em milissegundos vs segundos do Spring
- ✅ **Footprint reduzido** - Menor uso de memória e disco
- ✅ **Controle total** - Entendimento completo de cada linha de código
- ✅ **Zero dependências transitivas** - Apenas 4 bibliotecas essenciais
- ✅ **Código explícito** - Sem "mágica" ou reflection excessiva
- ✅ **Aprendizado profundo** - Compreensão de HTTP, JDBC, JWT internamente

### Trade-offs
- ❌ **Mais boilerplate** - Código manual para features comuns
- ❌ **Menos produtividade inicial** - Implementação manual de DI, routing, etc
- ❌ **Ferramentas limitadas** - Sem Spring DevTools, anotações mágicas
- ❌ **Manutenção manual** - DI e configurações feitas à mão

---

## 🛡️ Segurança

1. **Autenticação JWT**
   - Tokens assinados com HMAC-SHA256
   - Validação de assinatura e expiração automática
   - Claims: `email`, `role`
   - Sem session/cookies (stateless)

2. **Autorização**
   - Controllers verificam role quando necessário
   - Usuários só podem editar/deletar próprios dados
   - Rotas ADMIN bloqueadas para não-admins

3. **SQL Injection**
   - Uso exclusivo de PreparedStatements
   - Zero concatenação de SQL dinâmico

4. **Password Hashing**
   - BCrypt para hash de senhas
   - Salt automático por senha
