USE medicare_db;

-- 1. Insert Users
INSERT INTO users (username, password, role) VALUES ('drsharma', 'pass123', 'Doctor');
INSERT INTO users (username, password, role) VALUES ('dranjali', 'pass123', 'Doctor');
INSERT INTO users (username, password, role) VALUES ('receptionist1', 'pass123', 'Receptionist');
INSERT INTO users (username, password, role) VALUES ('rahulkumar', 'pass123', 'Patient');
INSERT INTO users (username, password, role) VALUES ('snehapatil', 'pass123', 'Patient');

-- 2. Insert Doctors
-- Assuming the users above got IDs 2, 3 (Admin is ID 1)
INSERT INTO doctors (name, specialization, phone, email, available_days, fee, user_id) 
VALUES ('Dr. Sharma', 'General Physician', '9876543210', 'sharma@medicare.com', 'Mon-Sat', 300.00, 2);

INSERT INTO doctors (name, specialization, phone, email, available_days, fee, user_id) 
VALUES ('Dr. Anjali Rao', 'Cardiology', '9876543211', 'anjali@medicare.com', 'Mon-Fri', 500.00, 3);

-- 3. Insert Patients
-- Assuming doctors are IDs 1 and 2, and patient users are IDs 5 and 6
INSERT INTO patients (name, age, gender, phone, address, disease, doctor_id, user_id) 
VALUES ('Rahul Kumar', 32, 'Male', '9000011111', '123 MG Road, City', 'Fever and Cough', 1, 5);

INSERT INTO patients (name, age, gender, phone, address, disease, doctor_id, user_id) 
VALUES ('Sneha Patil', 28, 'Female', '9000022222', '456 Park Avenue, City', 'High Blood Pressure', 2, 6);

-- 4. Insert Appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time, status) 
VALUES (1, 1, CURDATE(), '10:30:00', 'Confirmed');

INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time, status) 
VALUES (2, 2, CURDATE(), '11:00:00', 'Pending');

-- 5. Insert Prescriptions
INSERT INTO prescriptions (appointment_id, doctor_id, patient_id, symptoms, diagnosis, medicine, dosage, advice, next_visit) 
VALUES (1, 1, 1, 'High fever, body ache', 'Viral Fever', 'Paracetamol 500mg, Vitamin C', '1-0-1 after food', 'Drink plenty of warm fluids.', DATE_ADD(CURDATE(), INTERVAL 5 DAY));

-- 6. Insert Bills
INSERT INTO bills (patient_id, appointment_id, consultation_fee, medicine_charges, test_charges, total, status) 
VALUES (1, 1, 300.00, 150.00, 0.00, 450.00, 'Pending');
