# 📋 PLANO DE IMPLEMENTAÇÃO - PokéDecks SE

## 🎯 Objetivo
Completar a implementação da **camada de autenticação** seguindo os princípios minimalistas e agnósticos do projeto.

---

## 🚨 GAPS CRÍTICOS IDENTIFICADOS

Após análise comparativa entre `pokedecks` (Spring Boot) e `pokedecks-se` (Java puro):

### ❌ NÃO IMPLEMENTADO:
1. **AuthController** - Endpoints de autenticação
2. **AuthenticationService** - Lógica de registro e login
3. **PasswordUtil** - Hashing de senhas (BCrypt)
4. **V2__seed_initial_data.sql** - Dados iniciais
5. **MigrationRunner** - Executor de migrations

---

## 📦 FASE 1: Password Hashing (BCrypt)

### 1.1 Adicionar Dependência BCrypt

**Arquivo:** `pom.xml`

```xml
<!-- Adicionar após as dependências existentes -->
<!-- Password Hashing com BCrypt -->
<dependency>
    <groupId>org.mindrot</groupId>
    <artifactId>jbcrypt</artifactId>
    <version>0.4</version>
</dependency>
```

**Justificativa:**
- BCrypt é padrão da indústria para hashing de senhas
- Biblioteca minimalista (sem dependências transitivas)
- Compatível com hashes do Spring Security BCryptPasswordEncoder

---

### 1.2 Criar PasswordUtil

**Arquivo:** `src/main/java/com/davsilvam/pokedecks/util/PasswordUtil.java`

```java
package com.davsilvam.pokedecks.util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {
    private static final int LOG_ROUNDS = 10;

    /**
     * Gera hash BCrypt de uma senha.
     * @param plainPassword Senha em texto plano
     * @return Hash BCrypt da senha
     */
    public static String hash(String plainPassword) {
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt(LOG_ROUNDS));
    }

    /**
     * Verifica se uma senha em texto plano corresponde ao hash.
     * @param plainPassword Senha em texto plano
     * @param hashedPassword Hash BCrypt armazenado
     * @return true se a senha corresponde ao hash
     */
    public static boolean verify(String plainPassword, String hashedPassword) {
        try {
            return BCrypt.checkpw(plainPassword, hashedPassword);
        } catch (Exception e) {
            return false;
        }
    }
}
```

**Responsabilidades:**
- Criar hash seguro de senhas (com salt automático)
- Validar senhas contra hashes armazenados
- Proteção contra timing attacks (via BCrypt)

---

## 📦 FASE 2: AuthenticationService

### 2.1 Criar AuthenticationService

**Arquivo:** `src/main/java/com/davsilvam/pokedecks/services/AuthenticationService.java`

```java
package com.davsilvam.pokedecks.services;

import com.davsilvam.pokedecks.config.auth.JwtUtil;
import com.davsilvam.pokedecks.config.errors.exceptions.DatabaseException;
import com.davsilvam.pokedecks.config.errors.exceptions.ResourceConflictException;
import com.davsilvam.pokedecks.models.User;
import com.davsilvam.pokedecks.models.daos.UserDAO;
import com.davsilvam.pokedecks.models.enums.UserRole;
import com.davsilvam.pokedecks.services.dtos.AuthenticateResponseDTO;
import com.davsilvam.pokedecks.services.dtos.CreateUserRequestDTO;
import com.davsilvam.pokedecks.services.dtos.LoginUserRequestDTO;
import com.davsilvam.pokedecks.services.dtos.UserResponseDTO;
import com.davsilvam.pokedecks.services.mappers.UserMapper;
import com.davsilvam.pokedecks.util.PasswordUtil;

import java.sql.SQLException;

public class AuthenticationService {
    private final UserDAO userDAO;

    public AuthenticationService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    /**
     * Registra um novo usuário no sistema.
     * @param request Dados do usuário a ser criado
     * @return DTO com dados do usuário criado
     * @throws ResourceConflictException se username ou email já existirem
     * @throws DatabaseException se houver erro no banco de dados
     */
    public UserResponseDTO register(CreateUserRequestDTO request) {
        try {
            // Validar se username já existe
            User existingByUsername = userDAO.findByUsername(request.username());
            if (existingByUsername != null) {
                throw new ResourceConflictException("Username " + request.username() + " já está em uso");
            }

            // Validar se email já existe
            User existingByEmail = userDAO.findByEmail(request.email());
            if (existingByEmail != null) {
                throw new ResourceConflictException("Email " + request.email() + " já está em uso");
            }

            // Criar usuário com senha hasheada
            User user = new User();
            user.setName(request.name());
            user.setUsername(request.username());
            user.setEmail(request.email());
            user.setPasswordHash(PasswordUtil.hash(request.password()));
            user.setRole(UserRole.USER); // Novos usuários sempre são USER

            User savedUser = userDAO.save(user);
            return UserMapper.toDTO(savedUser);

        } catch (SQLException e) {
            throw new DatabaseException("Erro ao registrar usuário", e);
        }
    }

    /**
     * Autentica um usuário e gera token JWT.
     * @param request Credenciais de login (email + senha)
     * @return DTO com token JWT
     * @throws SecurityException se credenciais forem inválidas
     * @throws DatabaseException se houver erro no banco de dados
     */
    public AuthenticateResponseDTO authenticate(LoginUserRequestDTO request) {
        try {
            // Buscar usuário por email
            User user = userDAO.findByEmail(request.email());
            if (user == null) {
                throw new SecurityException("Credenciais inválidas");
            }

            // Verificar senha
            if (!PasswordUtil.verify(request.password(), user.getPasswordHash())) {
                throw new SecurityException("Credenciais inválidas");
            }

            // Gerar token JWT
            String token = JwtUtil.generateToken(user.getEmail(), user.getRole().name());
            return new AuthenticateResponseDTO(token);

        } catch (SQLException e) {
            throw new DatabaseException("Erro ao autenticar usuário", e);
        }
    }
}
```

**Responsabilidades:**
- Registrar novos usuários com validação de duplicatas
- Hashear senhas antes de salvar
- Validar credenciais de login
- Gerar tokens JWT para usuários autenticados

---

## 📦 FASE 3: AuthController

### 3.1 Criar AuthController

**Arquivo:** `src/main/java/com/davsilvam/pokedecks/controllers/AuthController.java`

```java
package com.davsilvam.pokedecks.controllers;

import com.davsilvam.pokedecks.server.Request;
import com.davsilvam.pokedecks.server.Response;
import com.davsilvam.pokedecks.server.SimpleServlet;
import com.davsilvam.pokedecks.services.AuthenticationService;
import com.davsilvam.pokedecks.services.dtos.AuthenticateResponseDTO;
import com.davsilvam.pokedecks.services.dtos.CreateUserRequestDTO;
import com.davsilvam.pokedecks.services.dtos.LoginUserRequestDTO;
import com.davsilvam.pokedecks.services.dtos.UserResponseDTO;
import com.davsilvam.pokedecks.util.JsonUtil;

import java.io.IOException;

public class AuthController extends SimpleServlet {
    private final AuthenticationService authenticationService;

    public AuthController(AuthenticationService authenticationService) {
        this.authenticationService = authenticationService;
    }

    @Override
    public void doPost(Request req, Response res) throws IOException {
        String path = req.path();

        // POST /api/auth/register - Registra novo usuário
        if (path.equals("/api/auth/register")) {
            CreateUserRequestDTO dto = JsonUtil.fromJson(req.body(), CreateUserRequestDTO.class);
            
            // Validações básicas
            if (dto.username() == null || dto.username().isBlank()) {
                res.error(400, "Username é obrigatório");
                return;
            }
            if (dto.email() == null || dto.email().isBlank()) {
                res.error(400, "Email é obrigatório");
                return;
            }
            if (dto.password() == null || dto.password().length() < 6) {
                res.error(400, "Senha deve ter no mínimo 6 caracteres");
                return;
            }
            
            UserResponseDTO user = authenticationService.register(dto);
            res.json(201, java.util.Map.of("user", user));
            return;
        }

        // POST /api/auth/authenticate - Autentica usuário e retorna JWT
        if (path.equals("/api/auth/authenticate") || path.equals("/api/auth/login")) {
            LoginUserRequestDTO dto = JsonUtil.fromJson(req.body(), LoginUserRequestDTO.class);
            
            // Validações básicas
            if (dto.email() == null || dto.email().isBlank()) {
                res.error(400, "Email é obrigatório");
                return;
            }
            if (dto.password() == null || dto.password().isBlank()) {
                res.error(400, "Senha é obrigatória");
                return;
            }
            
            AuthenticateResponseDTO authResponse = authenticationService.authenticate(dto);
            res.json(authResponse);
            return;
        }

        res.error(404, "Endpoint não encontrado");
    }
}
```

**Endpoints:**
- `POST /api/auth/register` - Registra novo usuário
- `POST /api/auth/authenticate` - Login (gera JWT)
- `POST /api/auth/login` - Alias para authenticate

**Responsabilidades:**
- Validar inputs básicos (não-nulos, tamanhos mínimos)
- Delegar para AuthenticationService
- Retornar respostas HTTP apropriadas

---

## 📦 FASE 4: Atualizar UserDAO

### 4.1 Verificar Métodos Necessários

O `UserDAO` já deve ter os métodos:
- `findByEmail(String email)`
- `findByUsername(String username)`
- `save(User user)`

**Ação:** Verificar implementação desses métodos no arquivo existente.

**Se não existirem, adicionar:**

```java
public User findByEmail(String email) throws SQLException {
    String sql = "SELECT * FROM users WHERE email = ?";
    try (Connection conn = db.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, email);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
            return null;
        }
    }
}

public User findByUsername(String username) throws SQLException {
    String sql = "SELECT * FROM users WHERE username = ?";
    try (Connection conn = db.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, username);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
            return null;
        }
    }
}
```

---

## 📦 FASE 5: Atualizar Composition Root

### 5.1 Registrar AuthenticationService e AuthController

**Arquivo:** `src/main/java/com/davsilvam/pokedecks/config/AppCompositionRoot.java`

**Adicionar:**

```java
// Services
public final AuthenticationService authenticationService;

// Controllers
public final AuthController authController;

// No construtor, após instanciar userDAO:
this.authenticationService = new AuthenticationService(userDAO);
this.authController = new AuthController(authenticationService);
```

---

### 5.2 Registrar Rotas no SimpleHttpServer

**Arquivo:** `src/main/java/com/davsilvam/pokedecks/PokeDecksApplication.java`

**Adicionar:**

```java
// Após registrar outros controllers
server.register("/api/auth", root.authController);
```

---

## 📦 FASE 6: Migration V2 (Seed Data)

### 6.1 Copiar Seed Data

**Ação:** Copiar arquivo de:
```
C:\Users\david\Workspace\sigaa\pokedecks\src\main\resources\db\migration\V2__seed_initial_data.sql
```

Para:
```
C:\Users\david\Workspace\sigaa\pokedecks-se\src\main\resources\migrations\V2__seed_initial_data.sql
```

---

### 6.2 Criar MigrationRunner (Opcional)

**Arquivo:** `src/main/java/com/davsilvam/pokedecks/config/database/MigrationRunner.java`

```java
package com.davsilvam.pokedecks.config.database;

import com.davsilvam.pokedecks.util.Logger;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.Statement;
import java.util.stream.Collectors;

public class MigrationRunner {
    private final DatabaseConnection db;

    public MigrationRunner(DatabaseConnection db) {
        this.db = db;
    }

    public void runMigrations() {
        Logger.info("Executando migrations...");
        runMigration("V1__create_project_entities.sql");
        runMigration("V2__seed_initial_data.sql");
        Logger.info("Migrations concluídas!");
    }

    private void runMigration(String fileName) {
        try {
            InputStream is = getClass().getClassLoader()
                    .getResourceAsStream("migrations/" + fileName);
            
            if (is == null) {
                Logger.warn("Migration não encontrada: " + fileName);
                return;
            }

            String sql = new BufferedReader(new InputStreamReader(is))
                    .lines()
                    .collect(Collectors.joining("\n"));

            try (Connection conn = db.getConnection();
                 Statement stmt = conn.createStatement()) {
                stmt.execute(sql);
                Logger.info("Migration executada: " + fileName);
            }
        } catch (Exception e) {
            Logger.error("Erro ao executar migration " + fileName + ": " + e.getMessage());
        }
    }
}
```

**Adicionar no PokeDecksApplication.main():**

```java
// Executar migrations na inicialização
MigrationRunner migrationRunner = new MigrationRunner(root.databaseConnection);
migrationRunner.runMigrations();
```

---

## 📦 FASE 7: Melhorias no AuthFilter

### 7.1 Verificar Tratamento de Exceções

**Arquivo:** `src/main/java/com/davsilvam/pokedecks/config/auth/AuthFilter.java`

**Garantir que:**
- JWT expirado retorna 401 com mensagem clara
- JWT inválido retorna 401 (não 500)
- Ausência de token permite requisição continuar

**Exemplo de melhoria:**

```java
try {
    String email = JwtUtil.validateAndExtractEmail(token);
    String role = JwtUtil.extractRole(token);
    
    exchange.setAttribute("authenticatedEmail", email);
    exchange.setAttribute("authenticatedRole", role);
    
} catch (SecurityException e) {
    // Token inválido ou expirado
    String response = "{\"error\": \"" + e.getMessage() + "\"}";
    exchange.getResponseHeaders().set("Content-Type", "application/json");
    exchange.sendResponseHeaders(401, response.length());
    exchange.getResponseBody().write(response.getBytes());
    exchange.getResponseBody().close();
    return;
}
```

---

## 📦 FASE 8: CORS (Opcional)

### 8.1 Adicionar Headers CORS no ServletAdapter

**Arquivo:** `src/main/java/com/davsilvam/pokedecks/server/ServletAdapter.java`

**Adicionar no método `handle()`:**

```java
// Headers CORS
exchange.getResponseHeaders().set("Access-Control-Allow-Origin", "*");
exchange.getResponseHeaders().set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
exchange.getResponseHeaders().set("Access-Control-Allow-Headers", "Content-Type, Authorization");

// Responder OPTIONS (preflight)
if (exchange.getRequestMethod().equals("OPTIONS")) {
    exchange.sendResponseHeaders(204, -1);
    return;
}
```

---

## ✅ CHECKLIST DE IMPLEMENTAÇÃO

### Alta Prioridade (Sem isso não funciona)
- [ ] **FASE 1:** Adicionar BCrypt no pom.xml
- [ ] **FASE 1:** Criar PasswordUtil.java
- [ ] **FASE 2:** Criar AuthenticationService.java
- [ ] **FASE 3:** Criar AuthController.java
- [ ] **FASE 4:** Verificar/completar UserDAO (findByEmail, findByUsername)
- [ ] **FASE 5:** Registrar AuthenticationService no AppCompositionRoot
- [ ] **FASE 5:** Registrar AuthController no AppCompositionRoot
- [ ] **FASE 5:** Registrar rota /api/auth no PokeDecksApplication
- [ ] **FASE 6:** Copiar V2__seed_initial_data.sql

### Média Prioridade (Melhora experiência)
- [ ] **FASE 6:** Criar MigrationRunner.java
- [ ] **FASE 7:** Melhorar tratamento de erros no AuthFilter
- [ ] **FASE 8:** Adicionar CORS (se necessário para frontend)

### Testes
- [ ] Testar POST /api/auth/register (criar usuário)
- [ ] Testar POST /api/auth/authenticate (login)
- [ ] Testar GET /api/users/me com token JWT
- [ ] Testar endpoints protegidos sem token (401)
- [ ] Testar endpoints ADMIN com usuário USER (403)

---

## 🧪 TESTES MANUAIS (curl)

### 1. Registrar Usuário
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

**Esperado:** 201 Created com dados do usuário

---

### 2. Autenticar (Login)
```bash
curl -X POST http://localhost:8080/api/auth/authenticate \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "senha123"
  }'
```

**Esperado:** 200 OK com `{"token": "eyJhbGc..."}`

---

### 3. Acessar Endpoint Protegido
```bash
# Substitua SEU_TOKEN pelo token recebido no passo 2
curl -X GET http://localhost:8080/api/users/me \
  -H "Authorization: Bearer SEU_TOKEN"
```

**Esperado:** 200 OK com dados do usuário autenticado

---

### 4. Testar Token Inválido
```bash
curl -X GET http://localhost:8080/api/users/me \
  -H "Authorization: Bearer token_invalido"
```

**Esperado:** 401 Unauthorized

---

## 📊 PROGRESSO ESPERADO

Após implementação completa:

**Antes:** 85% implementado  
**Depois:** 100% implementado ✅

---

## 🎯 PRÓXIMOS PASSOS PÓS-IMPLEMENTAÇÃO

1. **Testes Unitários** (opcional para projeto acadêmico)
2. **Documentação de API** (criar README com endpoints)
3. **Deploy** (Render, Railway, etc)
4. **Frontend Integration** (se houver)

---

**Responsável:** @davsilvam  
**Prioridade:** CRÍTICA  
**Prazo Estimado:** 2-3 horas  
**Complexidade:** Média
