package com.medicare.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medicare.dao.AppointmentDAO;
import com.medicare.model.Appointment;

public class AppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AppointmentDAO appointmentDAO = new AppointmentDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("book".equals(action)) {
            Appointment a = new Appointment();
            a.setPatientId(Integer.parseInt(request.getParameter("patientId")));
            a.setDoctorId(Integer.parseInt(request.getParameter("doctorId")));
            a.setAppointmentDate(request.getParameter("appointmentDate"));
            a.setAppointmentTime(request.getParameter("appointmentTime"));
            
            appointmentDAO.bookAppointment(a);
            response.sendRedirect("appointment.jsp?msg=booked");
        }
    }
}
