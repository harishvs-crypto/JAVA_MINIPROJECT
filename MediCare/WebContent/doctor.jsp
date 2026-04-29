<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.medicare.dao.DoctorDAO" %>
<%@ page import="com.medicare.model.Doctor" %>
<%
    if(session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    List<Doctor> docs = new DoctorDAO().getAllDoctors();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctors - MediCare+</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="wrapper">
        <div class="sidebar">
            <div class="sidebar-header">
                <h3>MediCare+</h3>
            </div>
            <ul class="sidebar-menu">
                <li><a href="admin-dashboard.jsp">Dashboard</a></li>
                <li><a href="doctor.jsp" class="active">Doctors</a></li>
                <li><a href="patient.jsp">Patients</a></li>
                <li><a href="appointment.jsp">Appointments</a></li>
                <li><a href="LogoutServlet" style="color: var(--danger);">Logout</a></li>
            </ul>
        </div>
        <div class="main-content">
            <div class="topbar">
                <h2>Doctor Directory</h2>
            </div>
            <div class="cards-row">
                <% for(Doctor d : docs) { %>
                <div class="doctor-card" style="background:#fff; padding:20px; border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,0.05); text-align:center; border-top:4px solid var(--primary-blue);">
                    <h3 style="color:var(--text-dark); margin:10px 0 5px;"><%= d.getName() %></h3>
                    <div style="color:var(--primary-blue); font-weight:500; font-size:14px;"><%= d.getSpecialization() %></div>
                    <p style="font-size:13px; color:var(--text-light); margin-top:5px;">Available: <%= d.getAvailableDays() %></p>
                    <div class="badge badge-confirmed" style="margin-top:10px; display:inline-block;">Available</div>
                    <div style="margin-top:10px; font-weight:bold;">Fee: ₹<%= d.getFee() %></div>
                </div>
                <% } %>
                <% if(docs.isEmpty()) { %>
                    <p>No doctors found.</p>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>
