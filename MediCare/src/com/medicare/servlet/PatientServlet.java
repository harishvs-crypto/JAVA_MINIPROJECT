package com.medicare.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medicare.dao.PatientDAO;
import com.medicare.model.Patient;

public class PatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PatientDAO patientDAO = new PatientDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            Patient p = new Patient();
            p.setName(request.getParameter("name"));
            p.setAge(Integer.parseInt(request.getParameter("age")));
            p.setGender(request.getParameter("gender"));
            p.setPhone(request.getParameter("phone"));
            p.setAddress(request.getParameter("address"));
            p.setDisease(request.getParameter("disease"));
            
            patientDAO.addPatient(p);
            response.sendRedirect("patient.jsp?msg=added");
        } else if ("update".equals(action)) {
            Patient p = new Patient();
            p.setId(Integer.parseInt(request.getParameter("id")));
            p.setName(request.getParameter("name"));
            p.setAge(Integer.parseInt(request.getParameter("age")));
            p.setGender(request.getParameter("gender"));
            p.setPhone(request.getParameter("phone"));
            p.setAddress(request.getParameter("address"));
            p.setDisease(request.getParameter("disease"));
            
            patientDAO.updatePatient(p);
            response.sendRedirect("patient.jsp?msg=updated");
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            patientDAO.deletePatient(id);
            response.sendRedirect("patient.jsp?msg=deleted");
        } else {
            response.sendRedirect("patient.jsp");
        }
    }
}
