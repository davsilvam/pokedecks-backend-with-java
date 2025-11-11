# 🚀 PRÓXIMOS PASSOS - PokéDecks SE

## 📊 Status Atual do Projeto

✅ **Implementado (95%):**
- Infraestrutura HTTP (SimpleHttpServer, AuthFilter, ServletAdapter)
- Todos os DAOs (com bugs corrigidos)
- Todos os Services
- Todos os Controllers (incluindo AuthController)
- Autenticação completa (registro + login com Basic Auth)
- Validação JWT
- Password hashing (BCrypt)
- Migrations (V1 e V2)

---

## 🎯 PRÓXIMOS PASSOS

### 1️⃣ SETUP DO BANCO DE DADOS (CRÍTICO)

#### 1.1 Criar Database PostgreSQL
```bash
# Conectar ao PostgreSQL
psql -U postgres

# Criar database
CREATE DATABASE pokedecks;

# Conectar ao database
\c pokedecks
```

#### 1.2 Executar Migrations
```bash
# Opção 1: Via psql (manual)
psql -U postgres -d pokedecks -f src/main/resources/migrations/V1__create_project_entities.sql
psql -U postgres -d pokedecks -f src/main/resources/migrations/V2__seed_initial_data.sql

# Opção 2: Copiar conteúdo e executar direto no psql
\i src/main/resources/migrations/V1__create_project_entities.sql
\i src/main/resources/migrations/V2__seed_initial_data.sql
```

#### 1.3 Verificar Tabelas Criadas
```sql
-- Listar todas as tabelas
\dt

-- Deve mostrar:
-- cards, pokemons, energies, trainers, sets, series, users, orders, order_items

-- Verificar dados seed
SELECT COUNT(*) FROM cards;
SELECT COUNT(*) FROM pokemons;
SELECT COUNT(*) FROM sets;
SELECT COUNT(*) FROM series;
```

---

### 2️⃣ CONFIGURAR VARIÁVEIS DE AMBIENTE

#### 2.1 Configurar application.properties
**Arquivo:** `src/main/resources/application.properties`

```properties
# Database
db.url=jdbc:postgresql://localhost:5432/pokedecks
db.user=postgres
db.password=SUA_SENHA_AQUI

# JWT (mínimo 32 caracteres)
jwt.secret=sua-chave-secreta-super-segura-com-minimo-32-caracteres
```

#### 2.2 Ou usar Variáveis de Ambiente (Recomendado)
```bash
# Windows (PowerShell)
$env:DB_URL="jdbc:postgresql://localhost:5432/pokedecks"
$env:DB_USER="postgres"
$env:DB_PASSWORD="sua_senha"
$env:JWT_SECRET="sua-chave-secreta-super-segura-com-minimo-32-caracteres"

# Linux/Mac
export DB_URL="jdbc:postgresql://localhost:5432/pokedecks"
export DB_USER="postgres"
export DB_PASSWORD="sua_senha"
export JWT_SECRET="sua-chave-secreta-super-segura-com-minimo-32-caracteres"
```

---

### 3️⃣ COMPILAR E EXECUTAR A APLICAÇÃO

#### 3.1 Compilar
```bash
cd C:\Users\david\Workspace\sigaa\pokedecks-se

# Se tiver Maven instalado
mvn clean compile

# Se tiver Maven wrapper
.\mvnw clean compile
```

#### 3.2 Executar
```bash
# Com Maven
mvn exec:java -Dexec.mainClass="com.davsilvam.pokedecks.PokeDecksApplication"

# Com Maven wrapper
.\mvnw exec:java -Dexec.mainClass="com.davsilvam.pokedecks.PokeDecksApplication"

# Ou compilar JAR e executar
mvn clean package
java -jar target/pokedecks-se-1.0-SNAPSHOT.jar
```

#### 3.3 Verificar Startup
Você deve ver:
```
┌─────────────────────────────────────────┐
│        PokéDecks API - v1.0.0          │
│      Java 21 - Sem Frameworks          │
└─────────────────────────────────────────┘

[INFO] Inicializando Composition Root...
[DEBUG] Instanciando DAOs...
[DEBUG] Instanciando Services...
[DEBUG] Instanciando Controllers...
[INFO] Composition Root inicializado com sucesso
[INFO] Servidor HTTP iniciado na porta 8080
[INFO] Aplicação iniciada com sucesso! ✅
[INFO] Health check disponível em: http://localhost:8080/health
```

---

### 4️⃣ TESTAR A API

#### 4.1 Health Check
```bash
curl http://localhost:8080/health
```
**Esperado:**
```json
{
  "status": "UP",
  "timestamp": "2025-11-11T19:45:00Z"
}
```

#### 4.2 Registrar Usuário
```bash
curl -X POST http://localhost:8080/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "name": "João Silva",
    "username": "joaosilva",
    "email": "joao@example.com",
    "password": "senha123"
  }'
```

**Esperado (201 Created):**
```json
{
  "user": {
    "id": "uuid...",
    "name": "João Silva",
    "username": "joaosilva",
    "email": "joao@example.com",
    "role": "USER"
  }
}
```

#### 4.3 Login (Basic Auth)
```bash
curl -X POST http://localhost:8080/api/auth/authenticate \
  -u "joao@example.com:senha123"
```

**Esperado (200 OK):**
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

#### 4.4 Acessar Endpoint Protegido
```bash
# Salvar o token em variável
TOKEN="SEU_TOKEN_AQUI"

# Testar endpoint /api/users/me
curl -X GET http://localhost:8080/api/users/me \
  -H "Authorization: Bearer $TOKEN"
```

**Esperado (200 OK):**
```json
{
  "id": "uuid...",
  "name": "João Silva",
  "username": "joaosilva",
  "email": "joao@example.com",
  "role": "USER"
}
```

#### 4.5 Listar Cartas (Seed Data)
```bash
curl http://localhost:8080/api/cards
```

**Esperado:** Lista com cartas do seed data

#### 4.6 Buscar Carta por Nome
```bash
curl "http://localhost:8080/api/cards?name=pikachu"
```

#### 4.7 Listar Sets
```bash
curl http://localhost:8080/api/sets
```

#### 4.8 Listar Séries
```bash
curl http://localhost:8080/api/series
```

---

### 5️⃣ MELHORIAS OPCIONAIS (Não Críticas)

#### 5.1 Criar MigrationRunner Automático
**Arquivo:** `src/main/java/com/davsilvam/pokedecks/config/database/MigrationRunner.java`

Executa migrations automaticamente no startup.

#### 5.2 Adicionar CORS
**Arquivo:** `ServletAdapter.java`

```java
// Headers CORS
exchange.getResponseHeaders().set("Access-Control-Allow-Origin", "*");
exchange.getResponseHeaders().set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
exchange.getResponseHeaders().set("Access-Control-Allow-Headers", "Content-Type, Authorization");
```

#### 5.3 Melhorar Logging
- Adicionar níveis de log (DEBUG, INFO, WARN, ERROR)
- Salvar logs em arquivo
- Formato estruturado (JSON)

#### 5.4 Criar Dockerfile
```dockerfile
FROM openjdk:21-slim
WORKDIR /app
COPY target/pokedecks-se-1.0-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
```

#### 5.5 Deploy (Render, Railway, etc)
- Configurar variáveis de ambiente
- Conectar banco PostgreSQL gerenciado
- Configurar CI/CD

---

### 6️⃣ TESTES COMPLETOS (Recomendado)

#### 6.1 Testar CRUD de Usuários
- ✅ Criar usuário (register)
- ✅ Login
- ✅ Buscar por ID
- ✅ Listar todos
- ✅ Editar perfil (PUT /api/users/{id})
- ✅ Deletar conta (DELETE /api/users/{id})

#### 6.2 Testar Cartas
- ✅ Listar todas (GET /api/cards)
- ✅ Buscar por ID (GET /api/cards/{id})
- ✅ Buscar por nome (GET /api/cards?name=pikachu)
- ✅ Criar carta (POST /api/cards) - ADMIN only
- ✅ Deletar carta (DELETE /api/cards/{id}) - ADMIN only

#### 6.3 Testar Sets
- ✅ Listar todos (GET /api/sets)
- ✅ Buscar por ID (GET /api/sets/{id})
- ✅ Listar cartas do set (GET /api/sets/{id}/cards)

#### 6.4 Testar Séries
- ✅ Listar todas (GET /api/series)
- ✅ Buscar por ID (GET /api/series/{id})
- ✅ Listar sets da série (GET /api/series/{id}/sets)

#### 6.5 Testar Orders
- ✅ Criar pedido (POST /api/orders) - autenticado
- ✅ Listar pedidos (GET /api/orders) - ADMIN only
- ✅ Buscar por ID (GET /api/orders/{id})
- ✅ Listar pedidos do usuário (GET /api/users/{id}/orders)

#### 6.6 Testar Autorização
- ✅ Endpoint protegido sem token → 401
- ✅ Endpoint ADMIN com usuário USER → 403
- ✅ Editar perfil de outro usuário → 403
- ✅ Token expirado → 401
- ✅ Token inválido → 401

---

## 📋 CHECKLIST FINAL

### Setup Inicial
- [ ] PostgreSQL instalado e rodando
- [ ] Database `pokedecks` criado
- [ ] Migration V1 executada (tabelas criadas)
- [ ] Migration V2 executada (seed data)
- [ ] Variáveis de ambiente configuradas (DB_URL, DB_USER, DB_PASSWORD, JWT_SECRET)

### Compilação
- [ ] Projeto compila sem erros
- [ ] Todas as dependências resolvidas

### Execução
- [ ] Aplicação inicia sem erros
- [ ] Servidor HTTP rodando na porta 8080
- [ ] Health check responde com 200 OK

### Testes Básicos
- [ ] Registro de usuário funciona
- [ ] Login (Basic Auth) funciona
- [ ] JWT é gerado corretamente
- [ ] Endpoint protegido aceita JWT válido
- [ ] Endpoint protegido rejeita JWT inválido
- [ ] Listar cartas retorna seed data

### Testes Avançados (Opcional)
- [ ] CRUD completo de usuários
- [ ] CRUD completo de cartas
- [ ] Autorização ADMIN funciona
- [ ] Relacionamentos funcionam (sets → cards, series → sets, etc)
- [ ] Orders podem ser criados

---

## 🎯 ORDEM RECOMENDADA

1. **Setup do Banco** (30 min)
   - Criar database
   - Executar migrations
   - Verificar tabelas

2. **Configurar Ambiente** (10 min)
   - application.properties ou env vars
   - JWT secret

3. **Compilar e Executar** (10 min)
   - mvn clean compile
   - Rodar aplicação
   - Verificar logs

4. **Testes Básicos** (20 min)
   - Health check
   - Register
   - Login
   - Listar cartas

5. **Testes Avançados** (30 min)
   - CRUD completo
   - Autorização
   - Relacionamentos

6. **Melhorias Opcionais** (conforme necessidade)
   - CORS
   - Migration runner
   - Logging
   - Deploy

---

## 🆘 TROUBLESHOOTING

### Erro: "Connection refused"
**Solução:** Verificar se PostgreSQL está rodando
```bash
# Windows
net start postgresql

# Linux/Mac
sudo systemctl start postgresql
```

### Erro: "Database does not exist"
**Solução:** Criar database
```sql
CREATE DATABASE pokedecks;
```

### Erro: "Table does not exist"
**Solução:** Executar migrations V1 e V2

### Erro: "JWT secret must be at least 32 characters"
**Solução:** Configurar JWT_SECRET com no mínimo 32 caracteres

### Erro: "Port 8080 already in use"
**Solução:** Mudar porta ou matar processo usando 8080
```bash
# Windows
netstat -ano | findstr :8080
taskkill /PID <PID> /F

# Linux/Mac
lsof -i :8080
kill -9 <PID>
```

---

## 📚 DOCUMENTAÇÃO

### Endpoints Disponíveis

| Método | Endpoint | Auth | Descrição |
|--------|----------|------|-----------|
| GET | `/health` | Não | Health check |
| POST | `/api/auth/register` | Não | Registrar usuário |
| POST | `/api/auth/authenticate` | Basic | Login (retorna JWT) |
| GET | `/api/users` | Não | Listar usuários |
| GET | `/api/users/me` | JWT | Perfil do usuário autenticado |
| GET | `/api/users/{id}` | Não | Buscar usuário |
| PUT | `/api/users/{id}` | JWT (Owner) | Editar perfil |
| DELETE | `/api/users/{id}` | JWT (Owner) | Deletar conta |
| GET | `/api/users/{id}/orders` | Não | Pedidos do usuário |
| GET | `/api/cards` | Não | Listar cartas |
| GET | `/api/cards?name=xxx` | Não | Buscar por nome |
| GET | `/api/cards/{id}` | Não | Buscar carta |
| POST | `/api/cards` | JWT (ADMIN) | Criar carta |
| DELETE | `/api/cards/{id}` | JWT (ADMIN) | Deletar carta |
| GET | `/api/sets` | Não | Listar sets |
| GET | `/api/sets/{id}` | Não | Buscar set |
| GET | `/api/sets/{id}/cards` | Não | Cartas do set |
| GET | `/api/series` | Não | Listar séries |
| GET | `/api/series/{id}` | Não | Buscar série |
| GET | `/api/series/{id}/sets` | Não | Sets da série |
| GET | `/api/orders` | JWT (ADMIN) | Listar pedidos |
| POST | `/api/orders` | JWT | Criar pedido |
| GET | `/api/orders/{id}` | Não | Buscar pedido |

---

**Próxima Ação Recomendada:** 🎯 **Passo 1 - Setup do Banco de Dados**

Boa sorte! 🚀
