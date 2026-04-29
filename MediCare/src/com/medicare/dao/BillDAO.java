package com.medicare.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.medicare.model.Bill;
import com.medicare.util.DBConnection;

public class BillDAO {

    public boolean generateBill(Bill b) {
        String sql = "INSERT INTO bills (patient_id, appointment_id, consultation_fee, medicine_charges, test_charges, total, status) VALUES (?, ?, ?, ?, ?, ?, 'Pending')";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, b.getPatientId());
            ps.setInt(2, b.getAppointmentId());
            ps.setDouble(3, b.getConsultationFee());
            ps.setDouble(4, b.getMedicineCharges());
            ps.setDouble(5, b.getTestCharges());
            ps.setDouble(6, b.getTotal());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Bill> getAllBills() {
        List<Bill> list = new ArrayList<>();
        String sql = "SELECT * FROM bills ORDER BY id DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Bill b = new Bill();
                b.setId(rs.getInt("id"));
                b.setPatientId(rs.getInt("patient_id"));
                b.setAppointmentId(rs.getInt("appointment_id"));
                b.setConsultationFee(rs.getDouble("consultation_fee"));
                b.setMedicineCharges(rs.getDouble("medicine_charges"));
                b.setTestCharges(rs.getDouble("test_charges"));
                b.setTotal(rs.getDouble("total"));
                b.setStatus(rs.getString("status"));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean markAsPaid(int billId) {
        String sql = "UPDATE bills SET status='Paid' WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, billId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public Bill getBillById(int id) {
        String sql = "SELECT * FROM bills WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Bill b = new Bill();
                b.setId(rs.getInt("id"));
                b.setPatientId(rs.getInt("patient_id"));
                b.setAppointmentId(rs.getInt("appointment_id"));
                b.setConsultationFee(rs.getDouble("consultation_fee"));
                b.setMedicineCharges(rs.getDouble("medicine_charges"));
                b.setTestCharges(rs.getDouble("test_charges"));
                b.setTotal(rs.getDouble("total"));
                b.setStatus(rs.getString("status"));
                return b;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
