<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.medicare.util.DBConnection" %>
<%
    if(session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    
    int totalPatients = 0, totalDoctors = 0, todayAppts = 0, pendingBills = 0;
    try (Connection conn = DBConnection.getConnection()) {
        ResultSet rs1 = conn.createStatement().executeQuery("SELECT COUNT(*) FROM patients");
        if(rs1.next()) totalPatients = rs1.getInt(1);
        
        ResultSet rs2 = conn.createStatement().executeQuery("SELECT COUNT(*) FROM doctors");
        if(rs2.next()) totalDoctors = rs2.getInt(1);
        
        ResultSet rs3 = conn.createStatement().executeQuery("SELECT COUNT(*) FROM appointments WHERE appointment_date = CURDATE()");
        if(rs3.next()) todayAppts = rs3.getInt(1);
        
        ResultSet rs4 = conn.createStatement().executeQuery("SELECT COUNT(*) FROM bills WHERE status='Pending'");
        if(rs4.next()) pendingBills = rs4.getInt(1);
    } catch(Exception e) {}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - MediCare+</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="wrapper">
        <div class="sidebar">
            <div class="sidebar-header">
                <h3>MediCare+</h3>
                <p style="font-size: 12px; color: var(--text-light);">Admin Panel</p>
            </div>
            <ul class="sidebar-menu">
                <li><a href="admin-dashboard.jsp" class="active">Dashboard</a></li>
                <li><a href="doctor.jsp">Doctors</a></li>
                <li><a href="patient.jsp">Patients</a></li>
                <li><a href="appointment.jsp">Appointments</a></li>
                <li><a href="billing.jsp">Billing</a></li>
                <li><a href="reports.jsp">Reports</a></li>
                <li><a href="LogoutServlet" style="color: var(--danger);">Logout</a></li>
            </ul>
        </div>

        <div class="main-content">
            <div class="topbar">
                <h2>Welcome, <%= session.getAttribute("username") %></h2>
                <div class="date-time" id="datetime"><%= java.time.LocalDate.now().toString() %></div>
            </div>

            <div class="cards-row">
                <div class="card-stat">
                    <h4>Total Patients</h4>
                    <h2><%= totalPatients %></h2>
                </div>
                <div class="card-stat">
                    <h4>Total Doctors</h4>
                    <h2><%= totalDoctors %></h2>
                </div>
                <div class="card-stat">
                    <h4>Today's Appointments</h4>
                    <h2><%= todayAppts %></h2>
                </div>
                <div class="card-stat">
                    <h4>Pending Bills</h4>
                    <h2><%= pendingBills %></h2>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
