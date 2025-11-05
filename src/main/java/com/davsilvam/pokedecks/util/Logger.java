package com.davsilvam.pokedecks.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Logger {
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
    private static final String RESET = "\u001B[0m";
    private static final String RED = "\u001B[31m";
    private static final String GREEN = "\u001B[32m";
    private static final String YELLOW = "\u001B[33m";
    private static final String BLUE = "\u001B[34m";
    private static final String PURPLE = "\u001B[35m";
    private static final String CYAN = "\u001B[36m";
    private static final String WHITE = "\u001B[37m";

    public enum Level {
        DEBUG(CYAN, "DEBUG"),
        INFO(GREEN, "INFO "),
        WARN(YELLOW, "WARN "),
        ERROR(RED, "ERROR"),
        SQL(PURPLE, "SQL  "),
        HTTP(BLUE, "HTTP ");

        private final String color;
        private final String label;

        Level(String color, String label) {
            this.color = color;
            this.label = label;
        }
    }

    private static String timestamp() {
        return LocalDateTime.now().format(FORMATTER);
    }

    private static void log(Level level, String message, Object... args) {
        String formattedMessage = args.length > 0 ? String.format(message, args) : message;
        System.out.printf("%s[%s] %s%s%s %s%n",
                level.color,
                timestamp(),
                level.label,
                RESET,
                WHITE,
                formattedMessage + RESET);
    }

    public static void debug(String message, Object... args) {
        log(Level.DEBUG, message, args);
    }

    public static void info(String message, Object... args) {
        log(Level.INFO, message, args);
    }

    public static void warn(String message, Object... args) {
        log(Level.WARN, message, args);
    }

    public static void error(String message, Object... args) {
        log(Level.ERROR, message, args);
    }

    public static void error(String message, Throwable throwable) {
        log(Level.ERROR, message + " - " + throwable.getMessage());
        if (throwable.getCause() != null) {
            System.err.println("  Caused by: " + throwable.getCause().getMessage());
        }
    }

    public static void sql(String query, Object... params) {
        String formattedQuery = query.replaceAll("\\s+", " ").trim();
        if (params.length > 0) {
            log(Level.SQL, "%s | Params: %s", formattedQuery, java.util.Arrays.toString(params));
        } else {
            log(Level.SQL, formattedQuery);
        }
    }

    public static void http(String method, String path, int statusCode, long durationMs) {
        String statusColor = statusCode >= 500 ? RED :
                            statusCode >= 400 ? YELLOW :
                            statusCode >= 300 ? CYAN :
                            statusCode >= 200 ? GREEN : WHITE;
        
        System.out.printf("%s[%s] %s%s %s%-6s %s%s%d%s %s(%dms)%s%n",
                Level.HTTP.color,
                timestamp(),
                Level.HTTP.label,
                RESET,
                BLUE,
                method,
                WHITE,
                path,
                statusColor,
                statusCode,
                RESET + WHITE,
                durationMs,
                RESET);
    }

    public static void banner() {
        String banner = """
                
                ╔═══════════════════════════════════════════════════════╗
                ║                                                       ║
                ║        ____        __    ____           __            ║
                ║       / __ \\____  / /__ / __ \\___  ____/ /_______     ║
                ║      / /_/ / __ \\/ //_// / / / _ \\/ __  / / ___/      ║
                ║     / ____/ /_/ / ,<  / /_/ /  __/ /_/ / (__  )       ║
                ║    /_/    \\____/_/|_|/_____/\\___/\\__,_/_/____/        ║
                ║                                                       ║
                ║              API RESTful Agnóstica                    ║
                ║              Java 21 - Pure JDBC                      ║
                ║                                                       ║
                ╚═══════════════════════════════════════════════════════╝
                """;
        System.out.println(GREEN + banner + RESET);
    }
}
