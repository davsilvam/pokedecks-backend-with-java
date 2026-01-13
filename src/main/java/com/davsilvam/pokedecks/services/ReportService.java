package com.davsilvam.pokedecks.services;

import com.davsilvam.pokedecks.config.errors.exceptions.DatabaseException;
import com.davsilvam.pokedecks.models.daos.CardDAO;
import com.davsilvam.pokedecks.models.daos.OrderDAO;
import com.davsilvam.pokedecks.services.dtos.CustomerPurchaseReportDTO;
import com.davsilvam.pokedecks.services.dtos.DailyRevenueReportDTO;
import com.davsilvam.pokedecks.services.dtos.OutOfStockProductDTO;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

public class ReportService {
    private final OrderDAO orderDAO;
    private final CardDAO cardDAO;

    public ReportService(OrderDAO orderDAO, CardDAO cardDAO) {
        this.orderDAO = orderDAO;
        this.cardDAO = cardDAO;
    }

    public List<DailyRevenueReportDTO> getDailyRevenueReport(LocalDate startDate, LocalDate endDate) {
        try {
            return orderDAO.getDailyRevenue(startDate, endDate);
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao gerar relatório de receita diária", e);
        }
    }

    public List<OutOfStockProductDTO> getOutOfStockProducts() {
        try {
            return cardDAO.getOutOfStockProducts();
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao buscar produtos sem estoque", e);
        }
    }

    public List<CustomerPurchaseReportDTO> getCustomerPurchaseReport(LocalDate startDate, LocalDate endDate) {
        try {
            return orderDAO.getCustomerPurchases(startDate, endDate);
        } catch (SQLException e) {
            throw new DatabaseException("Erro ao gerar relatório de compras por cliente", e);
        }
    }
}
