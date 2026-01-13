package com.davsilvam.pokedecks.controllers;

import com.davsilvam.pokedecks.server.Request;
import com.davsilvam.pokedecks.server.Response;
import com.davsilvam.pokedecks.server.SimpleServlet;
import com.davsilvam.pokedecks.services.ReportService;
import com.davsilvam.pokedecks.services.dtos.CustomerPurchaseReportDTO;
import com.davsilvam.pokedecks.services.dtos.DailyRevenueReportDTO;
import com.davsilvam.pokedecks.services.dtos.OutOfStockProductDTO;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

public class ReportController extends SimpleServlet {
    private final ReportService reportService;

    public ReportController(ReportService reportService) {
        this.reportService = reportService;
    }

    @Override
    public void doGet(Request req, Response res) throws IOException {
        String path = req.path();

        // GET /reports/daily-revenue?startDate=...&endDate=...
        if (path.equals("/reports/daily-revenue")) {
            String role = req.authenticatedRole();
            if (!"ADMIN".equals(role)) {
                res.error(403, "Forbidden - Admin role required");
                return;
            }

            String startDateStr = req.query("startDate");
            String endDateStr = req.query("endDate");

            if (startDateStr == null || endDateStr == null) {
                res.error(400, "Missing required parameters: startDate and endDate");
                return;
            }

            LocalDate startDate = LocalDate.parse(startDateStr);
            LocalDate endDate = LocalDate.parse(endDateStr);

            List<DailyRevenueReportDTO> report = reportService.getDailyRevenueReport(startDate, endDate);
            res.json(report);
            return;
        }

        // GET /reports/out-of-stock
        if (path.equals("/reports/out-of-stock")) {
            String role = req.authenticatedRole();
            if (!"ADMIN".equals(role)) {
                res.error(403, "Forbidden - Admin role required");
                return;
            }

            List<OutOfStockProductDTO> report = reportService.getOutOfStockProducts();
            res.json(report);
            return;
        }

        // GET /reports/customer-purchases?startDate=...&endDate=...
        if (path.equals("/reports/customer-purchases")) {
            String role = req.authenticatedRole();
            if (!"ADMIN".equals(role)) {
                res.error(403, "Forbidden - Admin role required");
                return;
            }

            String startDateStr = req.query("startDate");
            String endDateStr = req.query("endDate");

            if (startDateStr == null || endDateStr == null) {
                res.error(400, "Missing required parameters: startDate and endDate");
                return;
            }

            LocalDate startDate = LocalDate.parse(startDateStr);
            LocalDate endDate = LocalDate.parse(endDateStr);

            List<CustomerPurchaseReportDTO> report = reportService.getCustomerPurchaseReport(startDate, endDate);
            res.json(report);
            return;
        }

        res.error(404, "Endpoint not found");
    }
}
