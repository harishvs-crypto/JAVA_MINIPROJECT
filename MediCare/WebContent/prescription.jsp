<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prescription - MediCare+</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .prescription-pad {
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            max-width: 700px;
            margin: 0 auto;
            border-left: 10px solid var(--primary-green);
        }
        .pad-header { border-bottom: 2px solid var(--border-color); padding-bottom: 15px; margin-bottom: 20px; }
        .rx-symbol { font-size: 32px; font-weight: bold; color: var(--primary-blue); }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="sidebar">
            <div class="sidebar-header">
                <h3>MediCare+</h3>
            </div>
            <ul class="sidebar-menu">
                <li><a href="doctor.jsp">Dashboard</a></li>
                <li><a href="prescription.jsp" class="active">Prescription</a></li>
                <li><a href="LogoutServlet" style="color: var(--danger);">Logout</a></li>
            </ul>
        </div>

        <div class="main-content">
            <div class="prescription-pad">
                <div class="pad-header">
                    <h2>Dr. Sharma</h2>
                    <p>General Physician | Reg No: 12345</p>
                </div>
                <div style="display:flex; justify-content: space-between; margin-bottom: 20px;">
                    <div><strong>Patient:</strong> Rahul Kumar</div>
                    <div><strong>Date:</strong> <%= new java.util.Date().toString().substring(0, 10) %></div>
                </div>
                <div class="rx-symbol">Rx</div>
                <form action="PrescriptionServlet" method="POST">
                    <div class="form-group">
                        <label>Symptoms & Diagnosis</label>
                        <textarea class="form-control" rows="3">Fever, Body ache</textarea>
                    </div>
                    <div class="form-group">
                        <label>Medicines & Dosage</label>
                        <textarea class="form-control" rows="4">1. Paracetamol 500mg (1-0-1) after food
2. Vitamin C (1-0-0)</textarea>
                    </div>
                    <div class="form-group">
                        <label>Next Visit</label>
                        <input type="date" class="form-control" style="width: 200px;">
                    </div>
                    <button type="submit" class="btn-primary">Save & Print Prescription</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
