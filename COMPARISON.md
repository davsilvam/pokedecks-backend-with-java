# 📊 Análise Comparativa: PokéDecks vs PokéDecks-SE

## 🎯 Visão Geral

**PokéDecks (Original)**: API Spring Boot com JPA, Spring Security, OAuth2 Resource Server
**PokéDecks-SE (Reescrita)**: API Java 21 puro com JDBC, HTTP Server nativo, JWT manual

---

## ✅ O QUE JÁ FOI IMPLEMENTADO

### 1. **Infraestrutura Base** ✓
- [x] SimpleHttpServer (substituindo Spring MVC)
- [x] ServletAdapter (adaptador para HttpExchange)
- [x] AuthFilter (substituindo Spring Security filters)
- [x] Request/Response wrappers customizados
- [x] DatabaseConnection (substituindo Spring Data)
- [x] JwtUtil (substituindo Spring OAuth2 Resource Server)

### 2. **Camada de Modelos** ✓
- [x] User
- [x] Card (abstrata)
- [x] Pokemon
- [x] Energy
- [x] Trainer
- [x] Set
- [x] Serie
- [x] Order
- [x] OrderItem
- [x] Enums: UserRole, CardCategory

### 3. **Camada DAO** ✓
- [x] DAO<T> (interface base)
- [x] UserDAO
- [x] CardDAO
- [x] PokemonDAO
- [x] EnergyDAO
- [x] TrainerDAO
- [x] SetDAO
- [x] SerieDAO
- [x] OrderDAO
- [x] OrderItemDAO

### 4. **Camada de Services** ✓
- [x] UserService
- [x] CardService
- [x] SetService
- [x] SerieService
- [x] OrderService
- [x] Mappers (UserMapper, CardMapper, SetMapper, SerieMapper, OrderMapper, OrderItemMapper)

### 5. **DTOs** ✓
- [x] UserResponseDTO
- [x] CreateUserRequestDTO
- [x] EditUserProfileRequestDTO
- [x] LoginUserRequestDTO
- [x] AuthenticateResponseDTO
- [x] CardResponseDTO
- [x] CardBriefResponseDTO
- [x] SetResponseDTO
- [x] SetWithCardsResponseDTO
- [x] SerieResponseDTO
- [x] OrderResponseDTO
- [x] OrderItemResponseDTO
- [x] CreateOrderRequestDTO

### 6. **Controllers Implementados** ✓
- [x] UserController (GET /users, GET /users/{id}, GET /users/me, PUT /users/{id}, DELETE /users/{id}, GET /users/{id}/orders)
- [x] CardController (GET /cards, GET /cards/{id}, POST /cards, PUT /cards/{id}, DELETE /cards/{id})
- [x] SetController (GET /sets, GET /sets/{id}, POST /sets, PUT /sets/{id}, DELETE /sets/{id})
- [x] SerieController (GET /series, GET /series/{id}, POST /series, PUT /series/{id}, DELETE /series/{id})
- [x] OrderController (GET /orders, GET /orders/{id}, POST /orders, DELETE /orders/{id})
- [x] HealthController (GET /health)

### 7. **Exceções Customizadas** ✓
- [x] ResourceNotFoundException
- [x] ResourceConflictException
- [x] DatabaseException

### 8. **Utilitários** ✓
- [x] JsonUtil (substituindo ObjectMapper do Spring)
- [x] Logger (logging customizado)
- [x] PropertiesConfig (substituindo @ConfigurationProperties)

### 9. **Migrations** ⚠️
- [x] V1__create_project_entities.sql
- [ ] V2__seed_initial_data.sql ❌ **FALTANDO**

---

## ❌ O QUE AINDA FALTA IMPLEMENTAR

### 1. **AuthController / Authentication Endpoints** ⭐ **CRÍTICO**

**No projeto original:**
```java
// AuthController.java
POST /api/auth/register - Registra novo usuário
POST /api/auth/authenticate - Autentica usuário e retorna JWT
```

**No projeto SE:**
- ❌ **NÃO EXISTE AuthController**
- ❌ **NÃO EXISTE AuthenticationService**
- ❌ **Endpoints de autenticação não implementados**

**O que precisa ser criado:**
```java
// AuthController.java
public class AuthController extends SimpleServlet {
    @Override
    public void doPost(Request req, Response res) {
        // POST /api/auth/register
        // POST /api/auth/authenticate (login)
    }
}

// AuthenticationService.java
public class AuthenticationService {
    public UserResponseDTO register(CreateUserRequestDTO dto);
    public AuthenticateResponseDTO authenticate(LoginUserRequestDTO dto);
}
```

### 2. **Password Encoding/Hashing** ⭐ **CRÍTICO**

**No projeto original:**
- Usa `PasswordEncoder` do Spring Security (BCrypt)

**No projeto SE:**
- ❌ **NÃO implementado**
- Precisa de implementação manual de BCrypt ou usar biblioteca

**Solução:**
```java
// Adicionar dependência no pom.xml
<dependency>
    <groupId>org.mindrot</groupId>
    <artifactId>jbcrypt</artifactId>
    <version>0.4</version>
</dependency>

// PasswordUtil.java
public class PasswordUtil {
    public static String hash(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }
    
    public static boolean verify(String password, String hash) {
        return BCrypt.checkpw(password, hash);
    }
}
```

### 3. **Seed Data (Migration V2)** ⚠️ **IMPORTANTE**

**No projeto original:**
- `V2__seed_initial_data.sql` - dados iniciais de séries, sets e cards

**No projeto SE:**
- ❌ **Arquivo não existe**
- Precisa copiar de `C:\Users\david\Workspace\sigaa\pokedecks\src\main\resources\db\migration\V2__seed_initial_data.sql`

### 4. **Migration Runner** ⚠️ **IMPORTANTE**

**No projeto original:**
- Flyway executa migrations automaticamente

**No projeto SE:**
- ❌ **Não existe runner automático**
- Migrations precisam ser executadas manualmente

**Solução:**
```java
// MigrationRunner.java
public class MigrationRunner {
    public static void runMigrations() {
        // Ler arquivos .sql de resources/migrations
        // Executar em ordem (V1, V2, etc)
        // Criar tabela flyway_schema_history (opcional)
    }
}
```

### 5. **UserDetailsService** (Opcional)

**No projeto original:**
- `UserDetailsServiceImpl` implementa interface do Spring Security

**No projeto SE:**
- ❌ **Não existe equivalente**
- Não é necessário se AuthenticationService for bem implementado

### 6. **Swagger/OpenAPI Documentation** (Baixa prioridade)

**No projeto original:**
- SpringDoc OpenAPI gera documentação automática
- Anotações `@Operation`, `@ApiResponses`, `@Tag`

**No projeto SE:**
- ❌ **Não implementado**
- Seria necessário implementação manual ou biblioteca alternativa

### 7. **CORS Configuration** (Se necessário)

**No projeto original:**
- Configurado via `SecurityConfig`

**No projeto SE:**
- ❌ **Não configurado**
- Pode ser necessário adicionar headers CORS no `ServletAdapter`

### 8. **Tratamento de Exceções em AuthFilter**

**Verificar:**
- Se JWT inválido/expirado está sendo tratado corretamente
- Se retorna 401 com mensagem apropriada

---

## 🔧 PRIORIDADE DE IMPLEMENTAÇÃO

### **ALTA PRIORIDADE** (Sem isso a API não funciona)
1. ⭐ **AuthController + AuthenticationService**
2. ⭐ **Password Hashing (BCrypt)**
3. ⚠️ **V2__seed_initial_data.sql**
4. ⚠️ **Migration Runner**

### **MÉDIA PRIORIDADE** (Melhora experiência)
5. CORS Configuration (se frontend precisar)
6. Melhorias no tratamento de erros do AuthFilter

### **BAIXA PRIORIDADE** (Nice to have)
7. Documentação API (alternativa ao Swagger)
8. Health check expandido
9. Logging estruturado

---

## 📝 DIFERENÇAS ARQUITETURAIS IMPORTANTES

### Spring Boot → Java Puro

| Componente | Spring Boot | PokéDecks-SE |
|------------|-------------|--------------|
| HTTP Server | Tomcat embedded | `com.sun.net.httpserver.HttpServer` |
| Controllers | `@RestController` | `extends SimpleServlet` |
| Routing | `@GetMapping`, `@PostMapping` | `if (path.equals())` manual |
| DI | `@Autowired` | Constructor injection manual |
| ORM | JPA/Hibernate | JDBC puro |
| Repository | `extends JpaRepository` | DAO com SQL manual |
| Security | Spring Security | `AuthFilter` customizado |
| JWT | OAuth2 Resource Server | JJWT manual |
| JSON | Jackson | Gson |
| Config | `application.yml` | `application.properties` |
| Migrations | Flyway auto | Manual execution |

---

## 🎯 CHECKLIST FINAL

Para a API funcionar completamente:

- [ ] Criar `AuthController.java`
- [ ] Criar `AuthenticationService.java`
- [ ] Adicionar BCrypt no pom.xml
- [ ] Criar `PasswordUtil.java`
- [ ] Copiar `V2__seed_initial_data.sql`
- [ ] Criar `MigrationRunner.java` ou executar migrations manualmente
- [ ] Testar registro de usuário (POST /api/auth/register)
- [ ] Testar login (POST /api/auth/authenticate)
- [ ] Testar endpoints protegidos com JWT
- [ ] Verificar se CORS está funcionando (se necessário)

---

## 📊 PROGRESSO ATUAL

**Implementado:** ~85%
**Faltando:** ~15%

A maior parte da infraestrutura e funcionalidades estão implementadas. O principal gap é a **camada de autenticação** (registro e login), que é crítica para o funcionamento da API.
