package com.davsilvam.pokedecks.services.mappers;

import com.davsilvam.pokedecks.models.Order;
import com.davsilvam.pokedecks.services.dtos.OrderItemResponseDTO;
import com.davsilvam.pokedecks.services.dtos.OrderResponseDTO;
import com.davsilvam.pokedecks.services.dtos.UserResponseDTO;

import java.util.List;

public class OrderMapper {
    public static OrderResponseDTO toDTO(Order order) {
        if (order == null) {
            return null;
        }

        UserResponseDTO userDTO = UserMapper.toDTO(order.getUser());
        List<OrderItemResponseDTO> orderItemsDTO = order.getOrderItems().stream()
                .map(OrderItemMapper::toDTO)
                .toList();

        double totalPrice = order.getOrderItems().stream()
                .mapToDouble(orderItem -> orderItem.getCard().getPrice() * orderItem.getQuantity())
                .sum();

        return new OrderResponseDTO(
                order.getId(),
                order.getOrderTime(),
                userDTO,
                orderItemsDTO,
                order.getOrderItems().size(),
                totalPrice
        );
    }
}
