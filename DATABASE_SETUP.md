# 🐳 SETUP DO BANCO DE DADOS - PokéDecks SE

## 📋 Usando o Banco de Dados Compartilhado

Este projeto **compartilha o mesmo banco de dados** com o projeto Spring Boot original (`pokedecks`).

**Vantagens:**
- ✅ Mesmos dados seed (670+ cartas)
- ✅ Mesmas credenciais
- ✅ Sem duplicação de recursos
- ✅ Testes consistentes entre projetos

---

## ✅ PRÉ-REQUISITOS

- ✅ Projeto original (`pokedecks`) com PostgreSQL rodando
- ✅ Docker Desktop instalado e rodando

---

## 🚀 PASSO 1: VERIFICAR BANCO DE DADOS

### Verificar se PostgreSQL está rodando:

```bash
# Navegar para o projeto original
cd C:\Users\david\Workspace\sigaa\pokedecks

# Verificar status
docker-compose ps
```

**Você deve ver:**
```
NAME                   STATUS              PORTS
pokedecks-postgres-1   Up (healthy)        0.0.0.0:5432->5432/tcp
```

### Se NÃO estiver rodando:

```bash
# Iniciar PostgreSQL do projeto original
cd C:\Users\david\Workspace\sigaa\pokedecks
docker-compose up -d postgres
```

### O que está disponível:
- ✅ Container PostgreSQL 16
- ✅ Database: `pokedecks`
- ✅ User: `docker`
- ✅ Password: `docker`
- ✅ Port: `5432`
- ✅ **670+ cartas** já cadastradas
- ✅ **10 sets** e **10 séries**

---

## 🔍 PASSO 2: VERIFICAR DADOS

### Conectar ao banco:
```bash
# Via docker exec
docker exec -it pokedecks-postgres-1 psql -U docker -d pokedecks
```

### Verificar tabelas criadas:
```sql
-- Listar todas as tabelas
\dt

-- Deve mostrar:
--  cards
--  energies
--  flyway_schema_history
--  order_items
--  orders
--  pokemons
--  series
--  sets
--  trainers
--  users
```

### Verificar seed data:
```sql
-- Contar registros
SELECT 'cards' as table_name, COUNT(*) as count FROM cards
UNION ALL
SELECT 'pokemons', COUNT(*) FROM pokemons
UNION ALL
SELECT 'energies', COUNT(*) FROM energies
UNION ALL
SELECT 'trainers', COUNT(*) FROM trainers
UNION ALL
SELECT 'sets', COUNT(*) FROM sets
UNION ALL
SELECT 'series', COUNT(*) FROM series
UNION ALL
SELECT 'users', COUNT(*) FROM users;

-- Verificar algumas cartas
SELECT id, name, category FROM cards LIMIT 5;

-- Sair do psql
\q
```

**Esperado (dados do projeto original):**
```
 table_name | count 
------------+-------
 cards      |   670
 pokemons   |   519
 energies   |    61
 trainers   |    90
 sets       |    10
 series     |    10
 users      |     X
```

---

## ⚙️ CONFIGURAÇÃO DA APLICAÇÃO

O arquivo `application.properties` já está configurado para usar o banco compartilhado:

```properties
# Database (mesmas credenciais do projeto original)
db.url=jdbc:postgresql://localhost:5432/pokedecks
db.user=docker
db.password=docker

# JWT (mesma chave do projeto original)
jwt.secret=MGQicn6bDVZXFsBi1VXoRHt40PLYkkR4xgJwWc6AzyiNrWQKBikdhtUxXmpebF6g1rKNqHn/7YKF9qLHk0WTlA==
jwt.expiration=86400000
```

**✅ Nenhuma alteração necessária!**

**⚠️ IMPORTANTE:** Não execute os dois projetos **simultaneamente** no mesmo banco!

---

## 🧪 PASSO 3: TESTAR CONEXÃO

```bash
docker exec pokedecks-postgres-1 psql -U docker -d pokedecks -c "SELECT COUNT(*) FROM cards;"
```

**Esperado:** 
```
 count 
-------
   670
```

---

## 🚀 PASSO 4: EXECUTAR APLICAÇÃO

```bash
# Compilar
mvn clean compile

# Executar
mvn exec:java -Dexec.mainClass="com.davsilvam.pokedecks.PokeDecksApplication"
```

**Logs esperados:**
```
[INFO] Conectando ao banco de dados...
[INFO] Conexão estabelecida com sucesso
[INFO] Inicializando Composition Root...
[INFO] Servidor HTTP iniciado na porta 8080
[INFO] Aplicação iniciada com sucesso! ✅
```

---

## 🧪 PASSO 5: TESTAR API

### 5.1 Health Check
```bash
curl http://localhost:8080/health
```

**Esperado:**
```json
{
  "status": "UP",
  "timestamp": "2025-11-11T19:47:50Z"
}
```

### 5.2 Listar Cartas (Seed Data)
```bash
curl http://localhost:8080/api/cards
```

**Esperado:** Array com cartas do seed data

### 5.3 Listar Sets
```bash
curl http://localhost:8080/api/sets
```

### 5.4 Listar Séries
```bash
curl http://localhost:8080/api/series
```

### 5.5 Registrar Usuário
```bash
curl -X POST http://localhost:8080/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Test User",
    "username": "testuser",
    "email": "test@example.com",
    "password": "senha123"
  }'
```

**Esperado (201 Created):**
```json
{
  "user": {
    "id": "uuid...",
    "name": "Test User",
    "username": "testuser",
    "email": "test@example.com",
    "role": "USER"
  }
}
```

### 5.6 Login
```bash
curl -X POST http://localhost:8080/api/auth/authenticate \
  -u "test@example.com:senha123"
```

**Esperado (200 OK):**
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

### 5.7 Acessar Endpoint Protegido
```bash
# Substituir SEU_TOKEN pelo token recebido
curl -X GET http://localhost:8080/api/users/me \
  -H "Authorization: Bearer SEU_TOKEN"
```

**Esperado (200 OK):**
```json
{
  "id": "uuid...",
  "name": "Test User",
  "username": "testuser",
  "email": "test@example.com",
  "role": "USER"
}
```

---

## 🛠️ COMANDOS ÚTEIS

### Gerenciar PostgreSQL (do projeto original)
```bash
# Navegar para o projeto original
cd C:\Users\david\Workspace\sigaa\pokedecks

# Iniciar
docker-compose up -d postgres

# Parar
docker-compose stop postgres

# Reiniciar
docker-compose restart postgres

# Ver logs
docker-compose logs -f postgres
```

### Acessar PostgreSQL
```bash
# Via docker exec
docker exec -it pokedecks-postgres-1 psql -U docker -d pokedecks

# Via psql local (se tiver instalado)
psql -h localhost -U docker -d pokedecks
# Senha: docker
```

### Backup do Banco
```bash
# Exportar dump
docker exec pokedecks-postgres-1 pg_dump -U docker pokedecks > backup.sql

# Restaurar dump
docker exec -i pokedecks-postgres-1 psql -U docker pokedecks < backup.sql
```

---

## 🔧 TROUBLESHOOTING

### Erro: "Connection refused"
**Causa:** Container PostgreSQL não está rodando

**Solução:**
```bash
docker-compose up -d postgres
docker-compose ps
```

### Erro: "Port 5432 already in use"
**Causa:** Isso é ESPERADO! Ambos os projetos compartilham o mesmo banco.

**Solução:** Não fazer nada! Usar o PostgreSQL do projeto original.

### Erro: "Tables not found"
**Causa:** Banco do projeto original não foi inicializado

**Solução:**
```bash
cd C:\Users\david\Workspace\sigaa\pokedecks
docker-compose up -d postgres
# Aguardar migrations do Flyway executarem
```

### Erro: "Password authentication failed"
**Causa:** Credenciais incorretas

**Solução:** Verificar que está usando `docker/docker`:
```properties
db.user=docker
db.password=docker
```

---

## 📊 BANCO COMPARTILHADO

### Projeto Original (Spring Boot)
```yaml
Localização: C:\Users\david\Workspace\sigaa\pokedecks
Container: pokedecks-postgres-1
Database: pokedecks
User: docker
Password: docker
Port: 5432
PostgreSQL: 16
Dados: 670+ cartas, 10 sets, 10 séries
```

### Projeto SE (Java Puro)
```yaml
Localização: C:\Users\david\Workspace\sigaa\pokedecks-se
Container: (usa o do projeto original)
Database: pokedecks   ✅ COMPARTILHADO
User: docker          ✅ COMPARTILHADO
Password: docker      ✅ COMPARTILHADO
Port: 5432            ✅ COMPARTILHADO
PostgreSQL: 16        ✅ COMPARTILHADO
JWT Secret: XXXXX     ✅ COMPARTILHADO
Dados: (mesmos)       ✅ COMPARTILHADO
```

**✅ 100% COMPARTILHADO!**

**⚠️ ATENÇÃO:** Não execute os dois projetos simultaneamente para evitar conflitos de dados!

---

## 🎯 PRÓXIMOS PASSOS

Após setup do banco:

1. ✅ Banco rodando com Docker
2. ✅ Migrations executadas
3. ✅ Seed data carregado
4. → **Executar aplicação**
5. → **Testar endpoints**
6. → **Desenvolver features adicionais**

---

## ✅ CHECKLIST

- [ ] Docker Desktop instalado e rodando
- [ ] PostgreSQL do projeto original rodando (`cd pokedecks && docker-compose ps`)
- [ ] Container `pokedecks-postgres-1` com status "healthy"
- [ ] 670+ cartas no banco (verificado com SELECT COUNT)
- [ ] `application.properties` do SE configurado (já está!)
- [ ] Projeto original NÃO rodando simultaneamente
- [ ] Aplicação SE inicia sem erros
- [ ] Health check retorna 200 OK
- [ ] Endpoints retornam dados compartilhados

---

**Data:** 2025-11-11  
**Status:** ✅ PRONTO PARA USO  
**Compatibilidade:** 100% com projeto original
