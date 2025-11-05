package com.davsilvam.pokedecks.services.mappers;

import com.davsilvam.pokedecks.models.OrderItem;
import com.davsilvam.pokedecks.services.dtos.OrderItemResponseDTO;

public class OrderItemMapper {
    public static OrderItemResponseDTO toDTO(OrderItem orderItem) {
        if (orderItem == null) {
            return null;
        }

        return new OrderItemResponseDTO(
                orderItem.getId(),
                orderItem.getQuantity(),
                orderItem.getCard().getId(),
                orderItem.getCard().getName(),
                orderItem.getCard().getImageUrl(),
                orderItem.getCard().getLocalId(),
                orderItem.getCard().getPrice()
        );
    }
}
