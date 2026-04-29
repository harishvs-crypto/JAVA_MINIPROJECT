package com.medicare.servlet;

import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medicare.dao.BillDAO;
import com.medicare.model.Bill;

public class BillingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BillDAO billDAO = new BillDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String idStr = request.getParameter("id");
        
        if (idStr != null) {
            int billId = Integer.parseInt(idStr);
            
            if ("markPaid".equals(action)) {
                billDAO.markAsPaid(billId);
                response.sendRedirect("billing.jsp?msg=paid");
            } 
            else if ("exportTxt".equals(action)) {
                Bill b = billDAO.getBillById(billId);
                if (b != null) {
                    response.setContentType("text/plain");
                    response.setHeader("Content-Disposition", "attachment; filename=\"invoice_INV" + b.getId() + ".txt\"");
                    
                    try (OutputStream out = response.getOutputStream()) {
                        String txt = "========================================\n"
                                   + "          MEDICARE+ HOSPITAL          \n"
                                   + "========================================\n"
                                   + "INVOICE #: INV-" + b.getId() + "\n"
                                   + "PATIENT ID: #PT-" + b.getPatientId() + "\n"
                                   + "STATUS: " + b.getStatus() + "\n"
                                   + "----------------------------------------\n"
                                   + "Consultation Fee: Rs." + b.getConsultationFee() + "\n"
                                   + "Medicine Charges: Rs." + b.getMedicineCharges() + "\n"
                                   + "Test Charges:     Rs." + b.getTestCharges() + "\n"
                                   + "----------------------------------------\n"
                                   + "TOTAL AMOUNT:     Rs." + b.getTotal() + "\n"
                                   + "========================================\n";
                        out.write(txt.getBytes());
                    }
                }
            }
        }
    }
}
