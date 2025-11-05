package com.davsilvam.pokedecks.models.daos;

import com.davsilvam.pokedecks.config.database.DatabaseConnection;
import com.davsilvam.pokedecks.core.DAO;
import com.davsilvam.pokedecks.models.Card;
import com.davsilvam.pokedecks.models.OrderItem;
import com.davsilvam.pokedecks.util.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class OrderItemDAO implements DAO<OrderItem, UUID> {
    private final DatabaseConnection db;
    private final CardDAO cardDAO;

    public OrderItemDAO(DatabaseConnection db) {
        this.db = db;
        this.cardDAO = new CardDAO(db);
    }

    @Override
    public OrderItem save(OrderItem orderItem) throws SQLException {
        String queryStr = "INSERT INTO order_items (id, quantity, order_id, card_id) VALUES (?, ?, ?, ?)";
        Logger.sql(queryStr, orderItem.getId(), orderItem.getQuantity(), orderItem.getOrderId(), orderItem.getCardId());

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(queryStr)
        ) {
            pstmt.setObject(1, orderItem.getId());
            pstmt.setInt(2, orderItem.getQuantity());
            pstmt.setObject(3, orderItem.getOrderId());
            pstmt.setString(4, orderItem.getCardId());

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                Logger.debug("Item de pedido salvo: %s", orderItem.getId());
                return orderItem;
            }
            throw new SQLException("Failed to save the order item.");
        }
    }

    @Override
    public OrderItem findById(UUID id) throws SQLException {
        String queryStr = "SELECT * FROM order_items WHERE id = ?";
        Logger.sql(queryStr, id);

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(queryStr)
        ) {
            pstmt.setObject(1, id);

            try (ResultSet result = pstmt.executeQuery()) {
                if (result.next()) {
                    return buildOrderItemFromResultSet(result);
                }
            }
        }

        return null;
    }

    @Override
    public List<OrderItem> findAll() throws SQLException {
        String queryStr = "SELECT * FROM order_items";
        Logger.sql(queryStr);
        List<OrderItem> orderItems = new ArrayList<>();

        try (
                Connection conn = db.getConn();
                Statement stmt = conn.createStatement();
                ResultSet result = stmt.executeQuery(queryStr)
        ) {
            while (result.next()) {
                OrderItem orderItem = buildOrderItemFromResultSet(result);
                orderItems.add(orderItem);
            }
        }

        return orderItems;
    }

    @Override
    public boolean existsById(UUID id) throws SQLException {
        String queryStr = "SELECT 1 FROM order_items WHERE id = ?";
        Logger.sql(queryStr, id);

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(queryStr)
        ) {
            pstmt.setObject(1, id);

            try (ResultSet result = pstmt.executeQuery()) {
                return result.next();
            }
        }
    }

    @Override
    public int count() throws SQLException {
        String queryStr = "SELECT COUNT(*) FROM order_items";
        Logger.sql(queryStr);

        try (
                Connection conn = db.getConn();
                Statement stmt = conn.createStatement();
                ResultSet result = stmt.executeQuery(queryStr)
        ) {
            if (result.next()) {
                return result.getInt(1);
            }

            return 0;
        }
    }

    @Override
    public void deleteById(UUID id) throws SQLException {
        String queryStr = "DELETE FROM order_items WHERE id = ?";
        Logger.sql(queryStr, id);

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(queryStr)
        ) {
            pstmt.setObject(1, id);

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Failed to delete order item, no rows affected.");
            }
            
            Logger.debug("Item de pedido deletado: %s", id);
        }
    }

    public List<OrderItem> findByOrderId(UUID orderId) throws SQLException {
        String queryStr = "SELECT * FROM order_items WHERE order_id = ?";
        Logger.sql(queryStr, orderId);
        List<OrderItem> orderItems = new ArrayList<>();

        try (
                Connection conn = db.getConn();
                PreparedStatement pstmt = conn.prepareStatement(queryStr)
        ) {
            pstmt.setObject(1, orderId);

            try (ResultSet result = pstmt.executeQuery()) {
                while (result.next()) {
                    OrderItem orderItem = buildOrderItemFromResultSet(result);
                    orderItems.add(orderItem);
                }
            }
        }

        Logger.debug("Encontrados %d items para pedido %s", orderItems.size(), orderId);
        return orderItems;
    }

    /**
     * Busca OrderItems do pedido com eager loading das Cards
     */
    public List<OrderItem> findByOrderIdWithCards(UUID orderId) throws SQLException {
        List<OrderItem> orderItems = findByOrderId(orderId);
        
        for (OrderItem item : orderItems) {
            Card card = cardDAO.findById(item.getCardId());
            item.setCard(card);
        }
        
        return orderItems;
    }

    private OrderItem buildOrderItemFromResultSet(ResultSet result) throws SQLException {
        UUID id = result.getObject("id", UUID.class);
        int quantity = result.getInt("quantity");
        UUID orderId = result.getObject("order_id", UUID.class);
        String cardId = result.getString("card_id");

        return new OrderItem(id, quantity, orderId, cardId);
    }
}
