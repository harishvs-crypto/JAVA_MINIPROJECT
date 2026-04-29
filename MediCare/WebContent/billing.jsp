<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.medicare.dao.BillDAO" %>
<%@ page import="com.medicare.model.Bill" %>
<%
    if(session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    List<Bill> billList = new BillDAO().getAllBills();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing - MediCare+</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .invoice-box {
            background: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            max-width: 800px;
            margin: 20px auto;
        }
        .invoice-header { display: flex; justify-content: space-between; border-bottom: 2px solid var(--border-color); padding-bottom: 20px; margin-bottom: 20px; }
        .invoice-total { font-size: 24px; color: var(--primary-blue); font-weight: bold; text-align: right; margin-top: 20px; }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="sidebar">
            <div class="sidebar-header">
                <h3>MediCare+</h3>
            </div>
            <ul class="sidebar-menu">
                <li><a href="admin-dashboard.jsp">Dashboard</a></li>
                <li><a href="doctor.jsp">Doctors</a></li>
                <li><a href="patient.jsp">Patients</a></li>
                <li><a href="appointment.jsp">Appointments</a></li>
                <li><a href="billing.jsp" class="active">Billing</a></li>
                <li><a href="reports.jsp">Reports</a></li>
                <li><a href="LogoutServlet" style="color: var(--danger);">Logout</a></li>
            </ul>
        </div>

        <div class="main-content">
            <div class="topbar">
                <h2>Billing & Invoices</h2>
            </div>
            
            <% if("paid".equals(request.getParameter("msg"))) { %>
                <div style="background: var(--primary-green); color: white; padding: 10px; border-radius: 5px; margin-top: 15px; margin-bottom: 15px; max-width: 800px; margin-left: auto; margin-right: auto;">Bill successfully marked as paid!</div>
            <% } %>

            <% for(Bill b : billList) { %>
            <div class="invoice-box">
                <div class="invoice-header">
                    <div>
                        <h2 style="color: var(--primary-blue);">MediCare+ Hospital</h2>
                        <p>123 Health Avenue, City</p>
                    </div>
                    <div style="text-align: right;">
                        <h3>INVOICE #INV-<%= b.getId() %></h3>
                        <p>Date: <%= new java.util.Date().toString().substring(0, 10) %></p>
                        <% if("Paid".equals(b.getStatus())) { %>
                            <span class="badge badge-confirmed">Status: Paid</span>
                        <% } else { %>
                            <span class="badge badge-pending">Status: Pending</span>
                        <% } %>
                    </div>
                </div>
                
                <div style="margin-bottom: 20px;">
                    <strong>Bill To:</strong><br>
                    Patient ID: #PT-<%= b.getPatientId() %><br>
                    Appointment ID: #APT-<%= b.getAppointmentId() %>
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>Description</th>
                            <th style="text-align: right;">Amount (₹)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Consultation Fee</td>
                            <td style="text-align: right;"><%= b.getConsultationFee() %></td>
                        </tr>
                        <tr>
                            <td>Medicine Charges</td>
                            <td style="text-align: right;"><%= b.getMedicineCharges() %></td>
                        </tr>
                        <tr>
                            <td>Lab Test Charges</td>
                            <td style="text-align: right;"><%= b.getTestCharges() %></td>
                        </tr>
                    </tbody>
                </table>
                <div class="invoice-total">
                    Total: ₹<%= b.getTotal() %>
                </div>
                <div style="margin-top: 30px; text-align: right;">
                    <% if(!"Paid".equals(b.getStatus())) { %>
                        <a href="BillingServlet?action=markPaid&id=<%= b.getId() %>" class="btn-primary" style="text-decoration:none;">Mark as Paid</a>
                    <% } %>
                    <a href="BillingServlet?action=exportTxt&id=<%= b.getId() %>" class="btn-action btn-view" style="padding: 12px; margin-left: 10px; text-decoration:none;">Export as .TXT</a>
                    <button class="btn-action btn-edit" style="padding: 12px; margin-left: 10px;" onclick="window.print()">Print Bill</button>
                </div>
            </div>
            <% } %>
            <% if(billList.isEmpty()) { %>
                <div class="invoice-box" style="text-align:center;">No bills found.</div>
            <% } %>
        </div>
    </div>
</body>
</html>
