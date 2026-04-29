<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.medicare.dao.AppointmentDAO" %>
<%@ page import="com.medicare.model.Appointment" %>
<%
    if(session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    List<Appointment> appts = new AppointmentDAO().getAllAppointments();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointments - MediCare+</title>
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
                <li><a href="doctor.jsp">Doctors</a></li>
                <li><a href="patient.jsp">Patients</a></li>
                <li><a href="appointment.jsp" class="active">Appointments</a></li>
                <li><a href="LogoutServlet" style="color: var(--danger);">Logout</a></li>
            </ul>
        </div>
        <div class="main-content">
            <h2>Appointments</h2>
            
            <% if(request.getParameter("msg") != null) { %>
                <div style="background-color: var(--primary-green); color: white; padding: 10px; border-radius: 5px; margin: 15px 0;">
                    Appointment Booked successfully!
                </div>
            <% } %>

            <div class="table-container">
                <h3>Book Appointment</h3>
                <form action="AppointmentServlet" method="POST" style="margin-top: 15px;">
                    <input type="hidden" name="action" value="book">
                    <div style="display: flex; gap: 15px; flex-wrap: wrap;">
                        <input type="number" name="patientId" placeholder="Patient ID" class="form-control" style="width: 150px;" required>
                        <input type="number" name="doctorId" placeholder="Doctor ID" class="form-control" style="width: 150px;" required>
                        <input type="date" name="appointmentDate" class="form-control" style="width: 150px;" required>
                        <input type="time" name="appointmentTime" class="form-control" style="width: 150px;" required>
                        <button type="submit" class="btn-primary" style="margin-top: 0; width: auto;">Book</button>
                    </div>
                </form>
            </div>

            <div class="table-container" style="margin-top: 20px;">
                <h3>All Appointments</h3>
                <table style="margin-top:15px;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Patient ID</th>
                            <th>Doctor ID</th>
                            <th>Date & Time</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(Appointment a : appts) { %>
                        <tr>
                            <td>#APT-<%= a.getId() %></td>
                            <td>#PT-<%= a.getPatientId() %></td>
                            <td>#DOC-<%= a.getDoctorId() %></td>
                            <td><%= a.getAppointmentDate() %> <%= a.getAppointmentTime() %></td>
                            <td><span class="badge badge-<%= a.getStatus().toLowerCase() %>"><%= a.getStatus() %></span></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
