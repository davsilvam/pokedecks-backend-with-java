# 🎴 PokéDecks-SE

API RESTful desenvolvida em **Java 21 puro** (zero frameworks) para gerenciamento de coleções de cartas Pokémon TCG. Sistema completo de autenticação JWT, catálogo de produtos e controle de pedidos.

## 📋 Sobre o Projeto

PokéDecks-SE é uma aplicação backend que simula uma loja online de cartas Pokémon TCG (Trading Card Game). O projeto oferece funcionalidades de autenticação JWT, catálogo de produtos organizados por séries e sets, além de um sistema completo de pedidos com controle de estoque.

**Este projeto é uma reescrita minimalista da [versão original com Spring Boot](https://github.com/davsilvam/pokedecks-backend-with-spring)**, demonstrando que é possível construir uma API RESTful completa e robusta usando apenas Java puro e o mínimo de dependências externas. As APIs são **100% idênticas** em comportamento e endpoints, permitindo comparação justa de desempenho.

### Características Técnicas

- ✅ **Zero Frameworks** - Java 21 puro, sem Spring Boot ou qualquer framework
- ✅ **Mínimas Dependências** - Apenas 3 bibliotecas externas essenciais
- ✅ **RESTful API** - Seguindo boas práticas e padrões REST
- ✅ **Autenticação JWT** - Validação HMAC-SHA256 segura com JJWT
- ✅ **Servidor HTTP Nativo** - `com.sun.net.httpserver` do JDK
- ✅ **JDBC Puro** - Acesso direto ao banco sem ORM
- ✅ **Arquitetura em Camadas** - Separação clara de responsabilidades
- ✅ **Type Safe** - Records do Java 21 para DTOs imutáveis
- ✅ **Startup Ultra-Rápido** - Inicia em milissegundos (sem overhead de framework)

### Principais Funcionalidades

- 🔐 **Autenticação e Autorização**: Sistema de JWT com controle de acesso baseado em roles (USER/ADMIN)
- 👤 **Gerenciamento de Usuários**: Cadastro, edição de perfil e administração de contas
- 🎯 **Catálogo de Cartas**: Navegação e busca por cartas Pokémon, Energias e Treinadores com controle de estoque
- 📚 **Séries e Sets**: Organização hierárquica das cartas por séries e coleções
- 🛒 **Sistema de Pedidos**: Criação e gerenciamento completo de pedidos de compra
- 🔒 **Segurança**: BCrypt para hashing de senhas e PreparedStatements para prevenir SQL injection

## 🛠️ Tecnologias Utilizadas

### Backend
- **Java 21** - Linguagem com recursos modernos (Records, Pattern Matching, Text Blocks, Virtual Threads)
- **Native HttpServer** - `com.sun.net.httpserver.HttpServer` (API nativa do JDK)
- **JDBC Puro** - `java.sql.*` para acesso direto ao banco de dados

### Banco de Dados
- **PostgreSQL 16** - Banco de dados relacional

### Ferramentas e Bibliotecas
- **JJWT 0.12.5** - Geração e validação segura de tokens JWT
- **Gson 2.10.1** - Serialização/deserialização JSON
- **PostgreSQL JDBC Driver 42.7.8** - Conectividade com PostgreSQL
- **Maven** - Gerenciamento de dependências e build
- **Docker & Docker Compose** - Containerização

**Total: 3 dependências externas** (mínimo absoluto para funcionalidade completa)

## 🏗️ Arquitetura

O projeto segue uma arquitetura em camadas:

```
src/main/java/com/davsilvam/pokedecks/
├── config/              # Configurações da aplicação
│   ├── auth/           # Autenticação JWT e AuthFilter
│   ├── database/       # Conexão com PostgreSQL (JDBC)
│   ├── errors/         # Tratamento global de erros
│   └── AppCompositionRoot.java  # Dependency Injection manual
├── controllers/        # Endpoints da API REST
│   ├── AuthController
│   ├── UserController
│   ├── CardController
│   ├── SerieController
│   ├── SetController
│   └── OrderController
├── models/             # Entidades do domínio
│   ├── entities/              # Entidades JPA-like
│   │   ├── Card.java          # Carta base (abstrata)
│   │   ├── Pokemon.java       # Especialização: Pokémon
│   │   ├── Energy.java        # Especialização: Energia
│   │   ├── Trainer.java       # Especialização: Treinador
│   │   ├── Serie.java
│   │   ├── Set.java
│   │   ├── Order.java
│   │   ├── OrderItem.java
│   │   └── User.java
│   ├── daos/                  # Data Access Objects (JDBC puro)
│   │   ├── UserDAO.java
│   │   ├── CardDAO.java
│   │   └── ...
│   └── enums/                 # Enumerações (CardCategory, UserRole)
├── server/            # HTTP Server customizado
│   ├── SimpleHttpServer.java  # Servidor HTTP nativo
│   ├── ServletAdapter.java    # Adaptador HttpExchange → Request/Response
│   ├── SimpleServlet.java     # Interface base para Controllers
│   ├── Request.java           # Wrapper de requisição HTTP
│   └── Response.java          # Wrapper de resposta HTTP
├── services/          # Lógica de negócio
│   ├── AuthService
│   ├── UserService
│   ├── CardService
│   ├── SerieService
│   ├── SetService
│   ├── OrderService
│   ├── dtos/                 # Data Transfer Objects (Records)
│   └── mappers/              # Conversores entity → DTO
├── util/              # Utilitários
│   ├── JsonUtil.java
│   └── PropertiesConfig.java
└── PokeDecksApplication.java
```

### Principais Entidades

- **User**: Usuários do sistema com roles (USER/ADMIN)
- **Card**: Cartas base com informações comuns (id, nome, imagem, raridade, preço, estoque)
- **Pokemon**: Especialização de cartas Pokémon (HP, tipos, estágio, level, descrição, número da Pokédex)
- **Energy**: Cartas de energia
- **Trainer**: Cartas de treinador
- **Serie**: Séries de cartas (coleções principais)
- **Set**: Conjuntos/expansões dentro de séries
- **Order**: Pedidos de compra dos usuários
- **OrderItem**: Itens individuais de um pedido

### Relacionamentos

- **Card ↔ Set**: Muitos-para-um
- **Set ↔ Serie**: Muitos-para-um
- **Pokemon/Energy/Trainer ↔ Card**: Um-para-um (herança de tabela)
- **Order ↔ User**: Muitos-para-um
- **OrderItem ↔ Order**: Muitos-para-um
- **OrderItem ↔ Card**: Muitos-para-um

## 🚀 Como Executar

### Pré-requisitos

- Java 21 ou superior
- Maven 3.9+
- Docker e Docker Compose (recomendado)

### Opção 1: Executar com Docker Compose (Recomendado)

```bash
# Clone o repositório
git clone https://github.com/davsilvam/pokedecks-se.git
cd pokedecks-se

# Inicie os containers (PostgreSQL + Aplicação)
docker-compose up -d

# A aplicação estará disponível em http://localhost:8081
```

O Docker Compose irá:
- Iniciar o PostgreSQL 16 com healthcheck
- Construir a aplicação
- Executar a aplicação na porta 8081
- Compartilhar o mesmo banco com versão Spring Boot (se necessário)

### Opção 2: Executar Localmente

```bash
# 1. Inicie o PostgreSQL (via Docker)
docker-compose up postgres -d

# 2. Configure as variáveis de ambiente
export JWT_SECRET="sua-chave-secreta-minimo-32-caracteres"
export DB_URL="jdbc:postgresql://localhost:5432/pokedecks"
export DB_USER="docker"
export DB_PASSWORD="docker"

# No Windows use:
# set JWT_SECRET=sua-chave-secreta-minimo-32-caracteres
# set DB_URL=jdbc:postgresql://localhost:5432/pokedecks
# set DB_USER=docker
# set DB_PASSWORD=docker

# 3. Execute a aplicação com Maven
mvn exec:java -Dexec.mainClass="com.davsilvam.pokedecks.PokeDecksApplication"

# Ou compile e execute o JAR
mvn clean package
java -jar target/pokedecks-se-1.0-SNAPSHOT.jar
```

## 🗄️ Configuração

### Desenvolvimento (application.properties ou variáveis de ambiente)

```properties
# application.properties
db.url=jdbc:postgresql://localhost:5432/pokedecks
db.user=docker
db.password=docker
jwt.secret=sua-chave-secreta-minimo-32-caracteres

# Variáveis de ambiente (recomendado)
DB_URL=jdbc:postgresql://localhost:5432/pokedecks
DB_USER=docker
DB_PASSWORD=docker
JWT_SECRET=sua-chave-secreta-minimo-32-caracteres
```

### Produção

Use variáveis de ambiente para maior segurança:

```bash
# Obrigatórias
JWT_SECRET=sua-chave-secreta-minimo-32-caracteres
DB_URL=jdbc:postgresql://host:port/database
DB_USER=seu_usuario
DB_PASSWORD=sua_senha

# Opcionais
PORT=8081
JAVA_OPTS=-Xmx512m -Xms256m
```

### Schema do Banco de Dados

PokéDecks-SE utiliza o mesmo schema da versão Spring Boot. Para popular o banco de dados, execute as migrations da versão Spring Boot ou use o script SQL de seed incluído.

## 📚 Documentação da API

PokéDecks-SE implementa **100% dos endpoints** da versão Spring Boot. As APIs são idênticas.

### Principais Endpoints

#### Autenticação (`/api/auth`)
- `POST /api/auth/register` - Registrar novo usuário
- `POST /api/auth/authenticate` - Autenticar e obter JWT token

#### Usuários (`/api/users`)
- `GET /api/users` - Listar usuários (requer ADMIN)
- `GET /api/users/{id}` - Buscar usuário por ID (requer autenticação)
- `PUT /api/users/{id}` - Atualizar perfil (requer autenticação)
- `DELETE /api/users/{id}` - Deletar usuário (requer ADMIN)

#### Cartas (`/api/cards`)
- `GET /api/cards` - Listar cartas (requer autenticação)
- `GET /api/cards/{id}` - Buscar carta por ID (requer autenticação)
- `GET /api/cards/search?name={nome}` - Buscar por nome (requer autenticação)
- `POST /api/cards` - Criar carta (requer ADMIN)
- `PUT /api/cards/{id}` - Atualizar carta (requer ADMIN)
- `DELETE /api/cards/{id}` - Deletar carta (requer ADMIN)

#### Séries (`/api/series`)
- `GET /api/series` - Listar séries (requer autenticação)
- `GET /api/series/{id}` - Buscar série por ID (requer autenticação)
- `GET /api/series/{id}/sets` - Listar sets de uma série (requer autenticação)
- `POST /api/series` - Criar série (requer ADMIN)
- `PUT /api/series/{id}` - Atualizar série (requer ADMIN)
- `DELETE /api/series/{id}` - Deletar série (requer ADMIN)

#### Sets (`/api/sets`)
- `GET /api/sets` - Listar sets (requer autenticação)
- `GET /api/sets/{id}` - Buscar set por ID (requer autenticação)
- `GET /api/sets/{id}/cards` - Buscar set com cartas (requer autenticação)
- `POST /api/sets` - Criar set (requer ADMIN)
- `PUT /api/sets/{id}` - Atualizar set (requer ADMIN)
- `DELETE /api/sets/{id}` - Deletar set (requer ADMIN)

#### Pedidos (`/api/orders`)
- `GET /api/orders` - Listar pedidos (requer ADMIN)
- `GET /api/orders/{id}` - Buscar pedido por ID (requer autenticação)
- `POST /api/orders` - Criar pedido (requer autenticação)
- `DELETE /api/orders/{id}` - Deletar pedido (requer ADMIN)

## 🔐 Autenticação

A API utiliza JWT (JSON Web Tokens) com HMAC-SHA256 para autenticação.

### Fluxo de Autenticação

1. **Registro**: Usuário se registra (`POST /api/auth/register`)
2. **Login**: Usuário faz autenticação (`POST /api/auth/authenticate`)
3. **Token**: Servidor retorna JWT assinado com chave secreta HMAC
4. **Autorização**: Cliente inclui token no header `Authorization: Bearer {token}`
5. **Validação**: Servidor valida token em cada requisição protegida (via AuthFilter)

### Controle de Acesso

O sistema possui dois níveis de acesso:
- **USER**: Usuário comum (pode criar pedidos, visualizar cartas, editar próprio perfil)
- **ADMIN**: Administrador (pode gerenciar cartas, séries, sets e acessar todos os pedidos)

### Chave JWT

A chave secreta JWT deve ser configurada via variável de ambiente:

```bash
# Mínimo 32 caracteres para segurança adequada
export JWT_SECRET="sua-chave-secreta-minimo-32-caracteres"

# Windows
set JWT_SECRET=sua-chave-secreta-minimo-32-caracteres
```

**⚠️ Importante**: 
- Nunca commitar chaves secretas no código-fonte
- Em produção, use um sistema de secrets management
- Rotacione chaves periodicamente

## 🧪 Testes

```bash
# Build do projeto
mvn clean package -DskipTests

# Build completo (quando testes forem implementados)
mvn clean package

# O JAR será gerado em: target/pokedecks-se-1.0-SNAPSHOT.jar
```

## 🐛 Troubleshooting

### Erro de conexão com o banco de dados

```bash
# Verifique se o PostgreSQL está rodando
docker ps

# Verifique os logs
docker logs pokedecks-postgres-1

# Reinicie o container
docker-compose restart postgres
```

### Porta 8081 já em uso

```bash
# Windows
netstat -ano | findstr :8081

# Linux/Mac
lsof -i :8081

# Ou mude a porta via variável de ambiente
export PORT=8082
```

### Erro JWT_SECRET não configurado

```bash
# Configure a variável de ambiente obrigatória
export JWT_SECRET="sua-chave-secreta-minimo-32-caracteres"

# Windows:
set JWT_SECRET=sua-chave-secreta-minimo-32-caracteres
```

## 📝 Licença

Este projeto é de código aberto e está disponível para fins educacionais.

## 👨‍💻 Autor

Desenvolvido por [davsilvam](https://github.com/davsilvam)

---

⭐ Se este projeto foi útil para você, considere dar uma estrela no GitHub!

---

## 💡 Por que sem frameworks?

Este projeto demonstra que é possível construir uma API RESTful completa e robusta usando apenas Java puro, sem depender de frameworks pesados.

### Vantagens da Abordagem

- ✅ **Startup Ultra-Rápido** - Inicia em milissegundos vs segundos do Spring Boot
- ✅ **Footprint Reduzido** - Menor uso de memória RAM e espaço em disco
- ✅ **Controle Total** - Entendimento completo de cada componente
- ✅ **Mínimas Dependências** - Apenas 3 bibliotecas externas
- ✅ **Código Explícito** - Sem "mágica" ou reflection excessiva
- ✅ **Aprendizado Profundo** - Compreensão real de HTTP, JDBC, JWT
- ✅ **Debugging Simples** - Stack traces limpos
- ✅ **Deploy Leve** - JARs menores, imagens Docker compactas

### Trade-offs

- ❌ **Mais Boilerplate** - Código manual para features que frameworks abstraem
- ❌ **Menos Produtividade Inicial** - Implementação manual de DI, routing, validação
- ❌ **Ferramentas Limitadas** - Sem Spring DevTools, hot reload, etc.

### Casos de Uso Ideais

- 📚 **Fins Educacionais** - Aprender como frameworks funcionam "por baixo dos panos"
- 🚀 **Microserviços Leves** - Quando startup time e footprint são críticos
- 🔧 **Controle Máximo** - Aplicações com requisitos muito específicos
- 🎯 **APIs Simples** - Quando Spring Boot seria overkill

### Comparação de Desempenho

Para comparar o desempenho entre Spring Boot e PokéDecks-SE, veja o projeto complementar [pokedecks-loadtest](../pokedecks-loadtest) que utiliza JMeter para testes de carga comparativos.

---

## 🛡️ Segurança

### Implementações de Segurança

1. **Autenticação JWT**
   - Tokens assinados com HMAC-SHA256 via biblioteca JJWT
   - Validação de assinatura e expiração automática
   - Claims customizados: `email`, `role`
   - Stateless (sem session/cookies)

2. **Autorização**
   - Controle de acesso baseado em roles (RBAC)
   - Middleware AuthFilter valida JWT em todas as requisições protegidas
   - Controllers verificam roles quando necessário
   - Usuários só podem editar/deletar próprios dados

3. **Prevenção de SQL Injection**
   - Uso **exclusivo** de PreparedStatements em todos os DAOs
   - Zero concatenação de SQL dinâmico
   - Parâmetros sempre sanitizados pelo JDBC Driver

4. **Password Hashing**
   - BCrypt para hash de senhas com salt automático
   - Senhas nunca armazenadas em texto plano

### Boas Práticas

- ✅ Secrets via variáveis de ambiente (nunca hardcoded)
- ✅ Validação de inputs nos Services
- ✅ Exception handling sem vazar informações sensíveis
- ✅ HTTPS/TLS recomendado em produção (configurar no load balancer/proxy)
