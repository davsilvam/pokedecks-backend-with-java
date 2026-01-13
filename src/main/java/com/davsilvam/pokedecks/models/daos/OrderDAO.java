package com.davsilvam.pokedecks.models.daos;

import com.davsilvam.pokedecks.config.database.DatabaseConnection;
import com.davsilvam.pokedecks.core.DAO;
import com.davsilvam.pokedecks.models.Order;
import com.davsilvam.pokedecks.models.OrderItem;
import com.davsilvam.pokedecks.models.User;
import com.davsilvam.pokedecks.services.dtos.CustomerPurchaseReportDTO;
import com.davsilvam.pokedecks.services.dtos.DailyRevenueReportDTO;
import com.davsilvam.pokedecks.util.Logger;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class OrderDAO implements DAO<Order, UUID> {
    private final DatabaseConnection db;
    private final UserDAO userDAO;
    private final OrderItemDAO orderItemDAO;

    public OrderDAO(DatabaseConnection db) {
        this.db = db;
        this.userDAO = new UserDAO(db);
        this.orderItemDAO = new OrderItemDAO(db);
    }

    @Override
    public Order save(Order order) throws SQLException {
        String queryStr = "INSERT INTO orders (id, order_time, user_id) VALUES (?, ?, ?)";
        Logger.sql(queryStr, order.getId(), order.getOrderTime(), order.getUserId());

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setObject(1, order.getId());
                pstmt.setTimestamp(2, Timestamp.valueOf(order.getOrderTime()));
                pstmt.setObject(3, order.getUserId());

                int affectedRows = pstmt.executeUpdate();
                if (affectedRows > 0) {
                    Logger.debug("Pedido salvo: %s", order.getId());
                    return order;
                }
                throw new SQLException("Failed to save the order.");
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    @Override
    public Order findById(UUID id) throws SQLException {
        String queryStr = "SELECT * FROM orders WHERE id = ?";
        Logger.sql(queryStr, id);

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setObject(1, id);

                try (ResultSet result = pstmt.executeQuery()) {
                    if (result.next()) {
                        return buildOrderFromResultSet(result);
                    }
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        return null;
    }

    /**
     * Busca pedido com eager loading de User e OrderItems
     */
    public Order findByIdWithDetails(UUID id) throws SQLException {
        Order order = findById(id);
        if (order == null) return null;

        return loadOrderDetails(order);
    }

    public List<Order> findByUserId(UUID userId) throws SQLException {
        String queryStr = "SELECT * FROM orders WHERE user_id = ?";
        Logger.sql(queryStr, userId);
        List<Order> orders = new ArrayList<>();

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setObject(1, userId);

                try (ResultSet result = pstmt.executeQuery()) {
                    while (result.next()) {
                        Order order = buildOrderFromResultSet(result);
                        orders.add(order);
                    }
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        Logger.debug("Encontrados %d pedidos para usuário %s", orders.size(), userId);
        return orders;
    }

    public List<Order> findByUserIdWithDetails(UUID userId) throws SQLException {
        List<Order> orders = findByUserId(userId);
        
        for (Order order : orders) {
            loadOrderDetails(order);
        }
        
        return orders;
    }

    @Override
    public List<Order> findAll() throws SQLException {
        String queryStr = "SELECT * FROM orders";
        Logger.sql(queryStr);
        List<Order> orders = new ArrayList<>();

        Connection conn = null;
        try {
            conn = db.getConn();
            try (Statement stmt = conn.createStatement();
                 ResultSet result = stmt.executeQuery(queryStr)) {
                while (result.next()) {
                    Order order = buildOrderFromResultSet(result);
                    orders.add(order);
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }

        Logger.debug("Encontrados %d pedidos", orders.size());
        return orders;
    }

    public List<Order> findAllWithDetails() throws SQLException {
        List<Order> orders = findAll();
        
        for (Order order : orders) {
            loadOrderDetails(order);
        }
        
        return orders;
    }

    @Override
    public boolean existsById(UUID id) throws SQLException {
        String queryStr = "SELECT 1 FROM orders WHERE id = ?";
        Logger.sql(queryStr, id);

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setObject(1, id);

                try (ResultSet result = pstmt.executeQuery()) {
                    return result.next();
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    @Override
    public int count() throws SQLException {
        String queryStr = "SELECT COUNT(*) FROM orders";
        Logger.sql(queryStr);
        
        Connection conn = null;
        try {
            conn = db.getConn();
            try (Statement stmt = conn.createStatement();
                 ResultSet result = stmt.executeQuery(queryStr)) {
                if (result.next()) {
                    return result.getInt(1);
                }

                return 0;
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    @Override
    public void deleteById(UUID id) throws SQLException {
        String queryStr = "DELETE FROM orders WHERE id = ?";
        Logger.sql(queryStr, id);

        Connection conn = null;
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setObject(1, id);

                int affectedRows = pstmt.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Failed to delete order, no rows affected.");
                }
                
                Logger.debug("Pedido deletado: %s", id);
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
    }

    private Order loadOrderDetails(Order order) throws SQLException {
        User user = userDAO.findById(order.getUserId());
        order.setUser(user);

        List<OrderItem> orderItems = orderItemDAO.findByOrderIdWithCards(order.getId());
        order.setOrderItems(orderItems);

        Logger.debug("Detalhes carregados para pedido %s: %d items", order.getId(), orderItems.size());
        return order;
    }

    private Order buildOrderFromResultSet(ResultSet result) throws SQLException {
        UUID id = result.getObject("id", UUID.class);
        LocalDateTime orderTime = result.getTimestamp("order_time").toLocalDateTime();
        UUID userId = result.getObject("user_id", UUID.class);

        return new Order(id, orderTime, userId);
    }

    public List<DailyRevenueReportDTO> getDailyRevenue(LocalDate startDate, LocalDate endDate) throws SQLException {
        String queryStr = """
            SELECT DATE(o.order_time) as date, SUM(oi.quantity * c.price) as total_revenue
            FROM orders o
            JOIN order_items oi ON oi.order_id = o.id
            JOIN cards c ON c.id = oi.card_id
            WHERE o.order_time >= ? AND o.order_time <= ?
            GROUP BY DATE(o.order_time)
            ORDER BY DATE(o.order_time)
        """;
        
        List<DailyRevenueReportDTO> results = new ArrayList<>();
        Connection conn = null;
        
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setTimestamp(1, Timestamp.valueOf(startDate.atStartOfDay()));
                pstmt.setTimestamp(2, Timestamp.valueOf(endDate.atTime(23, 59, 59)));
                
                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        LocalDate date = rs.getDate("date").toLocalDate();
                        Double totalRevenue = rs.getDouble("total_revenue");
                        results.add(new DailyRevenueReportDTO(date, totalRevenue));
                    }
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
        
        return results;
    }

    public List<CustomerPurchaseReportDTO> getCustomerPurchases(LocalDate startDate, LocalDate endDate) throws SQLException {
        String queryStr = """
            SELECT u.id, u.name, COUNT(o.id) as total_purchases
            FROM orders o
            JOIN users u ON u.id = o.user_id
            WHERE o.order_time >= ? AND o.order_time <= ?
            GROUP BY u.id, u.name
            ORDER BY total_purchases DESC
        """;
        
        List<CustomerPurchaseReportDTO> results = new ArrayList<>();
        Connection conn = null;
        
        try {
            conn = db.getConn();
            try (PreparedStatement pstmt = conn.prepareStatement(queryStr)) {
                pstmt.setTimestamp(1, Timestamp.valueOf(startDate.atStartOfDay()));
                pstmt.setTimestamp(2, Timestamp.valueOf(endDate.atTime(23, 59, 59)));
                
                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        UUID customerId = (UUID) rs.getObject("id");
                        String customerName = rs.getString("name");
                        Long totalPurchases = rs.getLong("total_purchases");
                        results.add(new CustomerPurchaseReportDTO(customerId, customerName, totalPurchases));
                    }
                }
            }
        } finally {
            if (conn != null) {
                db.releaseConn(conn);
            }
        }
        
        return results;
    }
}
