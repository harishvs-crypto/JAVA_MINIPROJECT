package com.medicare.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.medicare.model.Prescription;
import com.medicare.util.DBConnection;

public class PrescriptionDAO {

    public boolean addPrescription(Prescription p) {
        String sql = "INSERT INTO prescriptions (appointment_id, doctor_id, patient_id, symptoms, diagnosis, medicine, dosage, advice, next_visit) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, p.getAppointmentId());
            ps.setInt(2, p.getDoctorId());
            ps.setInt(3, p.getPatientId());
            ps.setString(4, p.getSymptoms());
            ps.setString(5, p.getDiagnosis());
            ps.setString(6, p.getMedicine());
            ps.setString(7, p.getDosage());
            ps.setString(8, p.getAdvice());
            ps.setString(9, p.getNextVisit());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
