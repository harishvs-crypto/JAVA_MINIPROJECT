<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.medicare.dao.PatientDAO" %>
<%@ page import="com.medicare.model.Patient" %>
<%
    // Session check
    if(session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    
    PatientDAO patientDAO = new PatientDAO();
    List<Patient> patientList = patientDAO.getAllPatients();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patients - MediCare+</title>
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
                <li><a href="patient.jsp" class="active">Patients</a></li>
                <li><a href="appointment.jsp">Appointments</a></li>
                <li><a href="LogoutServlet" style="color: var(--danger);">Logout</a></li>
            </ul>
        </div>

        <div class="main-content">
            <div class="topbar">
                <h2>Patient Management</h2>
                <button class="btn-primary" style="width:auto; padding:8px 16px;" onclick="openAddForm()">+ Add Patient</button>
            </div>
            
            <% 
               String msg = request.getParameter("msg");
               if(msg != null) { 
                   String displayMsg = "Operation successful!";
                   if(msg.equals("added")) displayMsg = "Patient added successfully!";
                   else if(msg.equals("updated")) displayMsg = "Patient updated successfully!";
                   else if(msg.equals("deleted")) displayMsg = "Patient deleted successfully!";
            %>
                <div style="background-color: var(--primary-green); color: white; padding: 10px; border-radius: 5px; margin-bottom: 15px;">
                    <%= displayMsg %>
                </div>
            <% } %>

            <div id="patientFormContainer" style="display:none; background: #fff; padding: 20px; border-radius: 8px; margin-bottom: 20px; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">
                <h3 id="formTitle">Add New Patient</h3>
                <form action="PatientServlet" method="POST" style="margin-top: 15px;">
                    <input type="hidden" name="action" id="formAction" value="add">
                    <input type="hidden" name="id" id="patientId" value="0">
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                        <div><label>Name:</label><input type="text" name="name" id="patientName" class="form-control" required></div>
                        <div><label>Age:</label><input type="number" name="age" id="patientAge" class="form-control" required></div>
                        <div><label>Gender:</label>
                            <select name="gender" id="patientGender" class="form-control">
                                <option value="M">Male</option>
                                <option value="F">Female</option>
                            </select>
                        </div>
                        <div><label>Phone:</label><input type="text" name="phone" id="patientPhone" class="form-control"></div>
                        <div><label>Disease:</label><input type="text" name="disease" id="patientDisease" class="form-control"></div>
                        <div><label>Address:</label><input type="text" name="address" id="patientAddress" class="form-control"></div>
                    </div>
                    <button type="submit" class="btn-primary" style="width: auto; margin-top: 15px;">Save Patient</button>
                    <button type="button" class="btn-action btn-delete" style="width: auto; margin-top: 15px; margin-left: 10px;" onclick="document.getElementById('patientFormContainer').style.display='none'">Cancel</button>
                </form>
            </div>
            
            <div class="table-container">
                <div style="margin-bottom: 15px;">
                    <input type="text" id="searchInput" onkeyup="searchTable()" placeholder="Search patient by Name or ID..." class="form-control" style="max-width: 300px; display: inline-block;">
                    <button class="btn-action btn-view" onclick="searchTable()">Search</button>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Age/Gender</th>
                            <th>Contact</th>
                            <th>Disease</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(Patient p : patientList) { %>
                        <tr>
                            <td>#PT-<%= p.getId() %></td>
                            <td><%= p.getName() %></td>
                            <td><%= p.getAge() %> / <%= p.getGender() %></td>
                            <td><%= p.getPhone() %></td>
                            <td><%= p.getDisease() %></td>
                            <td>
                                <button class="btn-action btn-edit" onclick="openEditForm(<%= p.getId() %>, '<%= p.getName() != null ? p.getName().replace("'", "\\'") : "" %>', <%= p.getAge() %>, '<%= p.getGender() %>', '<%= p.getPhone() != null ? p.getPhone().replace("'", "\\'") : "" %>', '<%= p.getDisease() != null ? p.getDisease().replace("'", "\\'") : "" %>', '<%= p.getAddress() != null ? p.getAddress().replace("'", "\\'") : "" %>')">Edit</button>
                                <a href="PatientServlet?action=delete&id=<%= p.getId() %>" class="btn-action btn-delete" style="text-decoration:none; padding: 5px 10px; display: inline-block;" onclick="return confirm('Are you sure you want to delete this patient?');">Delete</a>
                            </td>
                        </tr>
                        <% } %>
                        <% if(patientList.isEmpty()) { %>
                        <tr><td colspan="6" style="text-align: center;">No patients found in database.</td></tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
<script>
function openAddForm() {
    document.getElementById('patientFormContainer').style.display = 'block';
    document.getElementById('formTitle').innerText = 'Add New Patient';
    document.getElementById('formAction').value = 'add';
    document.getElementById('patientId').value = '0';
    document.getElementById('patientName').value = '';
    document.getElementById('patientAge').value = '';
    document.getElementById('patientGender').value = 'M';
    document.getElementById('patientPhone').value = '';
    document.getElementById('patientDisease').value = '';
    document.getElementById('patientAddress').value = '';
}

function openEditForm(id, name, age, gender, phone, disease, address) {
    document.getElementById('patientFormContainer').style.display = 'block';
    document.getElementById('formTitle').innerText = 'Edit Patient';
    document.getElementById('formAction').value = 'update';
    document.getElementById('patientId').value = id;
    document.getElementById('patientName').value = name;
    document.getElementById('patientAge').value = age;
    document.getElementById('patientGender').value = gender;
    document.getElementById('patientPhone').value = phone;
    document.getElementById('patientDisease').value = disease;
    document.getElementById('patientAddress').value = address;
}

function searchTable() {
    var input = document.getElementById("searchInput");
    var filter = input.value.toUpperCase();
    var table = document.querySelector("table tbody");
    var tr = table.getElementsByTagName("tr");

    for (var i = 0; i < tr.length; i++) {
        var tdId = tr[i].getElementsByTagName("td")[0];
        var tdName = tr[i].getElementsByTagName("td")[1];
        if (tdId && tdName) {
            var txtValueId = tdId.textContent || tdId.innerText;
            var txtValueName = tdName.textContent || tdName.innerText;
            if (txtValueId.toUpperCase().indexOf(filter) > -1 || txtValueName.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }       
    }
}
</script>
</html>
