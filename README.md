# 🃏 PokéDecks API

API RESTful para gerenciamento de coleções de cartas Pokémon TCG, desenvolvida em **Java 21 puro** sem frameworks.

## 🎯 Características

- ✅ **Zero Frameworks** - Java puro, sem Spring Boot
- ✅ **Mínimas Dependências** - Apenas 3 bibliotecas externas
- ✅ **Autenticação JWT** - Validação HMAC-SHA256 segura
- ✅ **Arquitetura em Camadas** - Clean Architecture
- ✅ **Type Safe** - Records do Java 21
- ✅ **Startup Rápido** - Sem overhead de framework

## 🛠️ Stack Tecnológica

- **Java 21**
- **PostgreSQL** (JDBC)
- **JJWT** (autenticação)
- **Gson** (JSON parsing)
- **Native HttpServer** (com.sun.net.httpserver)

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

## 📡 Endpoints Principais

### Públicos (sem autenticação)
```bash
# Listar cartas
GET /api/cards

# Buscar carta por nome
GET /api/cards/search?name=pikachu

# Listar sets
GET /api/sets

# Listar séries
GET /api/series
```

### Protegidos (requer JWT)
```bash
# Obter perfil
GET /api/users/me
Headers: Authorization: Bearer <token>

# Criar pedido
POST /api/orders
Headers: Authorization: Bearer <token>
```

### Restritos (requer role ADMIN)
```bash
# Deletar carta
DELETE /api/cards/{id}
Headers: Authorization: Bearer <admin-token>
```

## 🏗️ Arquitetura

```
Cliente HTTP
    ↓
SimpleHttpServer (porta 8080)
    ↓
AuthFilter (valida JWT)
    ↓
ServletAdapter (adapta HttpExchange)
    ↓
Controller (routing + validação)
    ↓
Service (lógica de negócio)
    ↓
DAO (acesso ao banco)
    ↓
PostgreSQL
```

## 📚 Documentação

- **AGENTS.md** - Documentação completa da arquitetura
- **pom.xml** - Configuração do Maven

## 👨‍💻 Desenvolvimento

### Estrutura de Pacotes

```
com.davsilvam.pokedecks
├── server/           # HTTP Server, AuthFilter, ServletAdapter
├── controllers/      # UserController, CardController, etc
├── services/         # Lógica de negócio
├── models/          
│   ├── daos/        # Data Access Objects
│   └── entities/    # User, Card, Set, etc
├── config/
│   ├── auth/        # JwtUtil, AuthFilter
│   ├── database/    # DatabaseConnection
│   └── errors/      # Exceptions customizadas
└── util/            # JsonUtil, PropertiesConfig
```

### Próximos Passos

1. ⚡ **Testar a aplicação** (configure JWT_SECRET e execute)
2. 🔄 **Refatorar services restantes** (CardService, SetService, SerieService)
3. 🔐 **Implementar AuthController** (endpoints de login/register)
4. ✅ **Adicionar validação de DTOs**
5. 🌐 **Configurar CORS**

## 📄 Licença

Este projeto é de código aberto para fins educacionais.

## ✨ Autor

**David Menezes** ([@davsilvam](https://github.com/davsilvam))

---

**Versão:** 1.0.0  
**Última atualização:** 04/11/2025
