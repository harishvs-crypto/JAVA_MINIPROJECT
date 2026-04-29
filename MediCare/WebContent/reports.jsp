<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.medicare.dao.ReportDAO" %>
<%@ page import="com.medicare.model.Report" %>
<%
    if(session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    List<Report> reportsList = new ReportDAO().getAllReports();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports - MediCare+</title>
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
                <li><a href="appointment.jsp">Appointments</a></li>
                <li><a href="billing.jsp">Billing</a></li>
                <li><a href="reports.jsp" class="active">Reports</a></li>
                <li><a href="LogoutServlet" style="color: var(--danger);">Logout</a></li>
            </ul>
        </div>

        <div class="main-content">
            <h2>Medical Reports</h2>
            
            <% if("uploaded".equals(request.getParameter("msg"))) { %>
                <div style="background: var(--primary-green); color: white; padding: 10px; border-radius: 5px; margin-top: 15px;">Report successfully uploaded!</div>
            <% } %>
            <% if("invalid_patient".equals(request.getParameter("error"))) { %>
                <div style="background: var(--danger); color: white; padding: 10px; border-radius: 5px; margin-top: 15px;">Error: Invalid Patient ID format. Use numbers only!</div>
            <% } %>
            <% if("no_file".equals(request.getParameter("error"))) { %>
                <div style="background: var(--danger); color: white; padding: 10px; border-radius: 5px; margin-top: 15px;">Error: No file selected.</div>
            <% } %>

            <div class="table-container" style="margin-top:20px;">
                <form action="UploadReportServlet" method="POST" enctype="multipart/form-data">
                    <div class="form-group" style="display: flex; gap: 10px; align-items: flex-end;">
                        <div>
                            <label>Patient ID</label>
                            <input type="text" name="patientId" class="form-control" placeholder="e.g. 1" required>
                        </div>
                        <div>
                            <label>Upload Report (.txt or .pdf)</label>
                            <input type="file" name="reportFile" class="form-control" required>
                        </div>
                        <button type="submit" class="btn-primary" style="width: auto; margin-top: 0;">Upload</button>
                    </div>
                </form>
            </div>

            <div class="table-container" style="margin-top:20px;">
                <h3>Generated Reports</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Report ID</th>
                            <th>Patient ID</th>
                            <th>Report Name</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(Report r : reportsList) { %>
                        <tr>
                            <td>#REP-<%= r.getId() %></td>
                            <td>#PT-<%= r.getPatientId() %></td>
                            <td><%= r.getReportName() %></td>
                            <td><%= r.getCreatedAt().substring(0, 10) %></td>
                            <td>
                                <!-- Open file directly if it's text/pdf or trigger download -->
                                <a href="DownloadReportServlet?path=<%= java.net.URLEncoder.encode(r.getReportPath(), "UTF-8") %>" class="btn-action btn-edit" style="text-decoration:none; display:inline-block;">Download</a>
                            </td>
                        </tr>
                        <% } %>
                        <% if(reportsList.isEmpty()) { %>
                            <tr><td colspan="5" style="text-align:center;">No reports found.</td></tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
