package com.davsilvam.pokedecks.services;

import com.davsilvam.pokedecks.config.errors.exceptions.DatabaseException;
import com.davsilvam.pokedecks.config.errors.exceptions.ResourceNotFoundException;
import com.davsilvam.pokedecks.models.Card;
import com.davsilvam.pokedecks.models.Order;
import com.davsilvam.pokedecks.models.OrderItem;
import com.davsilvam.pokedecks.models.User;
import com.davsilvam.pokedecks.models.daos.CardDAO;
import com.davsilvam.pokedecks.models.daos.OrderDAO;
import com.davsilvam.pokedecks.models.daos.UserDAO;
import com.davsilvam.pokedecks.services.dtos.CreateOrderRequestDTO;
import com.davsilvam.pokedecks.services.dtos.OrderResponseDTO;
import com.davsilvam.pokedecks.services.mappers.OrderMapper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class OrderService {
    private final OrderDAO orderDAO;
    private final UserDAO userDAO;
    private final CardDAO cardDAO;

    public OrderService(OrderDAO orderDAO, UserDAO userDAO, CardDAO cardDAO) {
        this.orderDAO = orderDAO;
        this.userDAO = userDAO;
        this.cardDAO = cardDAO;
    }

    public OrderResponseDTO createOrder(CreateOrderRequestDTO order) {
        try {
            User user = userDAO.findById(order.userId());

            if (user == null) {
                throw new ResourceNotFoundException("Usuário com ID " + order.userId());
            }

            Order orderEntity = new Order(
                    UUID.randomUUID(),
                    order.orderTime(),
                    order.userId()
            );

            List<OrderItem> orderItems = new ArrayList<>();

            for (var itemDTO : order.orderItems()) {
                Card card = cardDAO.findById(itemDTO.cardId());
                if (card == null) {
                    throw new ResourceNotFoundException("Carta com ID " + itemDTO.cardId());
                }

                OrderItem orderItem = new OrderItem(
                        UUID.randomUUID(),
                        itemDTO.quantity(),
                        orderEntity.getId(),
                        card.getId()
                );
                orderItem.setCard(card);
                orderItems.add(orderItem);
            }

            orderEntity.setUser(user);
            orderEntity.setOrderItems(orderItems);

            Order savedOrder = orderDAO.save(orderEntity);
            return OrderMapper.toDTO(savedOrder);
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao criar pedido", e);
        }
    }

    public OrderResponseDTO getOrderById(UUID id) {
        try {
            Order order = orderDAO.findByIdWithDetails(id);

            if (order == null) {
                throw new ResourceNotFoundException("Pedido com ID " + id);
            }

            return OrderMapper.toDTO(order);
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao buscar pedido", e);
        }
    }

    public List<OrderResponseDTO> getAllOrders() {
        try {
            List<Order> orders = orderDAO.findAllWithDetails();

            return orders.stream()
                    .map(OrderMapper::toDTO)
                    .toList();
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao listar pedidos", e);
        }
    }

    public List<OrderResponseDTO> getOrdersByUserId(UUID userId) {
        try {
            User user = userDAO.findById(userId);

            if (user == null) {
                throw new ResourceNotFoundException("Usuário com ID " + userId);
            }

            List<Order> orders = orderDAO.findByUserIdWithDetails(userId);

            return orders.stream()
                    .map(OrderMapper::toDTO)
                    .toList();
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao buscar pedidos do usuário", e);
        }
    }

    public void deleteOrderById(UUID id) {
        try {
            Order order = orderDAO.findById(id);

            if (order == null) {
                throw new ResourceNotFoundException("Pedido com ID " + id);
            }

            orderDAO.deleteById(id);
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao deletar pedido", e);
        }
    }
}
