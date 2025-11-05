package com.davsilvam.pokedecks.config.auth;

import com.davsilvam.pokedecks.util.PropertiesConfig;
import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.security.SignatureException;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.Date;

public class JwtUtil {
    private static final PropertiesConfig CONFIG = PropertiesConfig.load();
    
    private static final String SECRET_KEY = CONFIG.getOrDefault(
        "jwt.secret",
        System.getenv("JWT_SECRET") != null 
            ? System.getenv("JWT_SECRET")
            : "your-secret-key-min-32-chars-for-hmac-sha256-security"
    );
    
    private static final long EXPIRATION_TIME = Long.parseLong(
        CONFIG.getOrDefault("jwt.expiration", "86400000")
    );

    private static final SecretKey KEY = Keys.hmacShaKeyFor(SECRET_KEY.getBytes(StandardCharsets.UTF_8));
    private static final JwtParser PARSER = Jwts.parser()
            .verifyWith(KEY)
            .build();

    public static String validateAndExtractEmail(String token) {
        try {
            Claims claims = PARSER.parseSignedClaims(token).getPayload();

            Date expiration = claims.getExpiration();
            if (expiration != null && expiration.before(new Date())) {
                throw new SecurityException("Token expired");
            }

            return claims.get("email", String.class);
        } catch (ExpiredJwtException e) {
            throw new SecurityException("Token expired: " + e.getMessage());
        } catch (SignatureException e) {
            throw new SecurityException("Invalid token signature: " + e.getMessage());
        } catch (MalformedJwtException e) {
            throw new SecurityException("Malformed token: " + e.getMessage());
        } catch (JwtException e) {
            throw new SecurityException("Invalid token: " + e.getMessage());
        }
    }

    public static String extractRole(String token) {
        try {
            Claims claims = PARSER.parseSignedClaims(token).getPayload();
            return claims.get("role", String.class);
        } catch (JwtException e) {
            throw new SecurityException("Invalid token: " + e.getMessage());
        }
    }

    public static String generateToken(String email, String role) {
        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);
        Date expiration = new Date(nowMillis + EXPIRATION_TIME);

        return Jwts.builder()
                .subject(email)
                .claim("email", email)
                .claim("role", role)
                .issuedAt(now)
                .expiration(expiration)
                .signWith(KEY)
                .compact();
    }
}
