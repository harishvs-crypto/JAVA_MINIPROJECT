package com.medicare.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.medicare.dao.ReportDAO;
import com.medicare.model.Report;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class UploadReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Directory where uploaded files will be saved
    private static final String UPLOAD_DIR = "d:" + File.separator + "suriya" + File.separator + "MediCareData" + File.separator + "Reports";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patientIdStr = request.getParameter("patientId");
        
        // Remove #PT- prefix if user typed it
        if(patientIdStr != null && patientIdStr.startsWith("#PT-")) {
            patientIdStr = patientIdStr.substring(4);
        }
        
        int patientId = 0;
        try {
            patientId = Integer.parseInt(patientIdStr);
        } catch(Exception e) {
            response.sendRedirect("reports.jsp?error=invalid_patient");
            return;
        }

        Part filePart = request.getPart("reportFile");
        if (filePart == null || filePart.getSize() == 0) {
            response.sendRedirect("reports.jsp?error=no_file");
            return;
        }
        
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        // Create directory if it doesn't exist
        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) uploadDir.mkdirs();
        
        // Save file to disk
        String filePath = UPLOAD_DIR + File.separator + fileName;
        filePart.write(filePath);
        
        // Save metadata to DB
        Report r = new Report();
        r.setPatientId(patientId);
        r.setReportName(fileName);
        r.setReportPath(filePath);
        
        ReportDAO dao = new ReportDAO();
        if (dao.addReport(r)) {
            response.sendRedirect("reports.jsp?msg=uploaded");
        } else {
            response.sendRedirect("reports.jsp?error=db_error");
        }
    }
}
