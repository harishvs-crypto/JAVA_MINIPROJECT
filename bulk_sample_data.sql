USE medicare_db;

-- ==========================================
-- 1. INSERT 20 DOCTOR USERS & 20 PATIENT USERS
-- ==========================================
INSERT INTO users (username, password, role) VALUES 
('dr_smith', 'pass123', 'Doctor'), ('dr_jones', 'pass123', 'Doctor'), ('dr_williams', 'pass123', 'Doctor'), 
('dr_brown', 'pass123', 'Doctor'), ('dr_davis', 'pass123', 'Doctor'), ('dr_miller', 'pass123', 'Doctor'), 
('dr_wilson', 'pass123', 'Doctor'), ('dr_moore', 'pass123', 'Doctor'), ('dr_taylor', 'pass123', 'Doctor'), 
('dr_anderson', 'pass123', 'Doctor'), ('dr_thomas', 'pass123', 'Doctor'), ('dr_jackson', 'pass123', 'Doctor'), 
('dr_white', 'pass123', 'Doctor'), ('dr_harris', 'pass123', 'Doctor'), ('dr_martin', 'pass123', 'Doctor'), 
('dr_thompson', 'pass123', 'Doctor'), ('dr_garcia', 'pass123', 'Doctor'), ('dr_martinez', 'pass123', 'Doctor'), 
('dr_robinson', 'pass123', 'Doctor'), ('dr_clark', 'pass123', 'Doctor'),
('pat_john', 'pass123', 'Patient'), ('pat_emma', 'pass123', 'Patient'), ('pat_michael', 'pass123', 'Patient'), 
('pat_sophia', 'pass123', 'Patient'), ('pat_william', 'pass123', 'Patient'), ('pat_olivia', 'pass123', 'Patient'), 
('pat_james', 'pass123', 'Patient'), ('pat_ava', 'pass123', 'Patient'), ('pat_alex', 'pass123', 'Patient'), 
('pat_isabella', 'pass123', 'Patient'), ('pat_daniel', 'pass123', 'Patient'), ('pat_mia', 'pass123', 'Patient'), 
('pat_matthew', 'pass123', 'Patient'), ('pat_charlotte', 'pass123', 'Patient'), ('pat_anthony', 'pass123', 'Patient'), 
('pat_amelia', 'pass123', 'Patient'), ('pat_david', 'pass123', 'Patient'), ('pat_harper', 'pass123', 'Patient'), 
('pat_joseph', 'pass123', 'Patient'), ('pat_evelyn', 'pass123', 'Patient');

-- ==========================================
-- 2. INSERT 20 DOCTORS (User IDs will likely be 7 to 26 assuming previous inserts)
-- We will just use subqueries or assume auto-increment mapping if clean database.
-- For safety, we just insert standard doctors.
-- ==========================================
INSERT INTO doctors (name, specialization, phone, email, available_days, fee) VALUES 
('Dr. John Smith', 'Cardiology', '9800000001', 'smith@medicare.com', 'Mon-Fri', 500.00),
('Dr. Sarah Jones', 'Neurology', '9800000002', 'jones@medicare.com', 'Mon-Wed', 700.00),
('Dr. Mark Williams', 'Pediatrics', '9800000003', 'williams@medicare.com', 'Tue-Sat', 400.00),
('Dr. Emily Brown', 'Orthopedics', '9800000004', 'brown@medicare.com', 'Mon,Wed,Fri', 600.00),
('Dr. Michael Davis', 'Dermatology', '9800000005', 'davis@medicare.com', 'Tue,Thu', 450.00),
('Dr. Jessica Miller', 'Psychiatry', '9800000006', 'miller@medicare.com', 'Mon-Fri', 800.00),
('Dr. David Wilson', 'General Medicine', '9800000007', 'wilson@medicare.com', 'Mon-Sat', 300.00),
('Dr. Linda Moore', 'Gynecology', '9800000008', 'moore@medicare.com', 'Mon-Fri', 550.00),
('Dr. Robert Taylor', 'Ophthalmology', '9800000009', 'taylor@medicare.com', 'Mon-Thu', 400.00),
('Dr. Mary Anderson', 'ENT', '9800000010', 'anderson@medicare.com', 'Tue-Sat', 350.00),
('Dr. James Thomas', 'Oncology', '9800000011', 'thomas@medicare.com', 'Mon-Fri', 1000.00),
('Dr. Patricia Jackson', 'Urology', '9800000012', 'jackson@medicare.com', 'Mon,Wed,Fri', 650.00),
('Dr. Richard White', 'Gastroenterology', '9800000013', 'white@medicare.com', 'Tue-Sat', 500.00),
('Dr. Barbara Harris', 'Endocrinology', '9800000014', 'harris@medicare.com', 'Mon-Fri', 600.00),
('Dr. Charles Martin', 'Pulmonology', '9800000015', 'martin@medicare.com', 'Mon-Thu', 550.00),
('Dr. Susan Thompson', 'Rheumatology', '9800000016', 'thompson@medicare.com', 'Tue,Thu,Sat', 500.00),
('Dr. Thomas Garcia', 'Nephrology', '9800000017', 'garcia@medicare.com', 'Mon-Fri', 700.00),
('Dr. Margaret Martinez', 'Cardiology', '9800000018', 'martinez@medicare.com', 'Mon-Wed', 500.00),
('Dr. Christopher Robinson', 'Neurology', '9800000019', 'robinson@medicare.com', 'Thu-Sat', 700.00),
('Dr. Lisa Clark', 'Pediatrics', '9800000020', 'clark@medicare.com', 'Mon-Fri', 400.00);

-- ==========================================
-- 3. INSERT 20 PATIENTS
-- ==========================================
INSERT INTO patients (name, age, gender, phone, address, disease) VALUES 
('John Doe', 45, 'Male', '9900000001', '101 Maple St', 'Hypertension'),
('Emma Watson', 28, 'Female', '9900000002', '102 Oak Ave', 'Migraine'),
('Michael Jordan', 55, 'Male', '9900000003', '103 Pine Rd', 'Knee Pain'),
('Sophia Loren', 34, 'Female', '9900000004', '104 Cedar Ln', 'Skin Rash'),
('William Pitt', 60, 'Male', '9900000005', '105 Elm St', 'Anxiety'),
('Olivia Newton', 22, 'Female', '9900000006', '106 Birch Blvd', 'Fever'),
('James Bond', 40, 'Male', '9900000007', '107 Walnut Way', 'Pregnancy Checkup'),
('Ava Gardner', 30, 'Female', '9900000008', '108 Cherry Ct', 'Blurry Vision'),
('Alex Hales', 50, 'Male', '9900000009', '109 Spruce Dr', 'Ear Infection'),
('Isabella Ross', 25, 'Female', '9900000010', '110 Ash St', 'Cancer Screening'),
('Daniel Craig', 48, 'Male', '9900000011', '111 Fir Ave', 'Kidney Stones'),
('Mia Hamm', 35, 'Female', '9900000012', '112 Redwood Rd', 'Stomach Ulcer'),
('Matthew Perry', 52, 'Male', '9900000013', '113 Cypress Ln', 'Diabetes'),
('Charlotte Bronte', 29, 'Female', '9900000014', '114 Willow St', 'Asthma'),
('Anthony Hopkins', 65, 'Male', '9900000015', '115 Magnolia Blvd', 'Joint Pain'),
('Amelia Earhart', 38, 'Female', '9900000016', '116 Poplar Way', 'Kidney Failure'),
('David Bowie', 42, 'Male', '9900000017', '117 Sycamore Ct', 'Heart Palpitations'),
('Harper Lee', 31, 'Female', '9900000018', '118 Chestnut Dr', 'Headaches'),
('Joseph Gordon', 27, 'Male', '9900000019', '119 Hickory St', 'Flu'),
('Evelyn Waugh', 46, 'Female', '9900000020', '120 Acacia Ave', 'High Blood Pressure');

-- ==========================================
-- 4. INSERT 20 APPOINTMENTS (Matching Patients 1-20 to Doctors 1-20)
-- ==========================================
INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time, status) VALUES 
(1, 1, CURDATE(), '09:00:00', 'Completed'),
(2, 2, CURDATE(), '09:30:00', 'Completed'),
(3, 3, CURDATE(), '10:00:00', 'Confirmed'),
(4, 4, CURDATE(), '10:30:00', 'Confirmed'),
(5, 5, CURDATE(), '11:00:00', 'Pending'),
(6, 6, CURDATE(), '11:30:00', 'Pending'),
(7, 7, CURDATE(), '12:00:00', 'Confirmed'),
(8, 8, CURDATE(), '12:30:00', 'Completed'),
(9, 9, CURDATE(), '14:00:00', 'Confirmed'),
(10, 10, CURDATE(), '14:30:00', 'Pending'),
(11, 11, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '09:00:00', 'Confirmed'),
(12, 12, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '09:30:00', 'Pending'),
(13, 13, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '10:00:00', 'Confirmed'),
(14, 14, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '10:30:00', 'Confirmed'),
(15, 15, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '11:00:00', 'Pending'),
(16, 16, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '11:30:00', 'Completed'),
(17, 17, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '09:00:00', 'Confirmed'),
(18, 18, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '10:00:00', 'Pending'),
(19, 19, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '11:00:00', 'Confirmed'),
(20, 20, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '12:00:00', 'Confirmed');

-- ==========================================
-- 5. INSERT 20 PRESCRIPTIONS
-- ==========================================
INSERT INTO prescriptions (appointment_id, doctor_id, patient_id, symptoms, diagnosis, medicine, dosage, advice, next_visit) VALUES 
(1, 1, 1, 'Chest tightness', 'Hypertension', 'Amlodipine 5mg', '1-0-0', 'Reduce salt intake', DATE_ADD(CURDATE(), INTERVAL 14 DAY)),
(2, 2, 2, 'Severe headaches', 'Migraine', 'Sumatriptan 50mg', 'SOS', 'Avoid bright lights', DATE_ADD(CURDATE(), INTERVAL 30 DAY)),
(3, 3, 3, 'Limping', 'Ligament strain', 'Ibuprofen 400mg', '1-0-1', 'Rest and ice', DATE_ADD(CURDATE(), INTERVAL 7 DAY)),
(4, 4, 4, 'Red itchy skin', 'Contact Dermatitis', 'Hydrocortisone cream', 'Local apply', 'Avoid allergen', DATE_ADD(CURDATE(), INTERVAL 10 DAY)),
(5, 5, 5, 'Panic attacks', 'Generalized Anxiety', 'Sertraline 50mg', '1-0-0', 'Meditation daily', DATE_ADD(CURDATE(), INTERVAL 21 DAY)),
(6, 6, 6, 'High temp, chills', 'Viral Infection', 'Paracetamol 500mg', '1-1-1', 'Drink fluids', DATE_ADD(CURDATE(), INTERVAL 3 DAY)),
(7, 7, 7, 'Routine checkup', 'Healthy', 'Prenatal Vitamins', '1-0-0', 'Light exercise', DATE_ADD(CURDATE(), INTERVAL 28 DAY)),
(8, 8, 8, 'Vision trouble', 'Myopia', 'Glasses Prescribed', 'N/A', 'Use anti-glare screen', DATE_ADD(CURDATE(), INTERVAL 365 DAY)),
(9, 9, 9, 'Ear pain', 'Otitis Media', 'Amoxicillin 500mg', '1-0-1', 'Complete course', DATE_ADD(CURDATE(), INTERVAL 5 DAY)),
(10, 10, 10, 'Routine screening', 'All Clear', 'None', 'None', 'Annual follow up', DATE_ADD(CURDATE(), INTERVAL 365 DAY)),
(11, 11, 11, 'Flank pain', 'Kidney Stones', 'Tamsulosin 0.4mg', '0-0-1', 'Drink 3L water', DATE_ADD(CURDATE(), INTERVAL 14 DAY)),
(12, 12, 12, 'Abdominal pain', 'Gastric Ulcer', 'Omeprazole 20mg', '1-0-0 before food', 'Avoid spicy food', DATE_ADD(CURDATE(), INTERVAL 20 DAY)),
(13, 13, 13, 'High sugar', 'Type 2 Diabetes', 'Metformin 500mg', '1-0-1', 'Strict diabetic diet', DATE_ADD(CURDATE(), INTERVAL 30 DAY)),
(14, 14, 14, 'Wheezing', 'Asthma Exacerbation', 'Albuterol Inhaler', '2 puffs SOS', 'Avoid dust', DATE_ADD(CURDATE(), INTERVAL 15 DAY)),
(15, 15, 15, 'Joint stiffness', 'Osteoarthritis', 'Celecoxib 200mg', '1-0-0', 'Physiotherapy', DATE_ADD(CURDATE(), INTERVAL 45 DAY)),
(16, 16, 16, 'Swelling', 'CKD Stage 2', 'Lisinopril 10mg', '1-0-0', 'Low protein diet', DATE_ADD(CURDATE(), INTERVAL 30 DAY)),
(17, 17, 17, 'Palpitations', 'Arrhythmia', 'Metoprolol 25mg', '1-0-1', 'Avoid caffeine', DATE_ADD(CURDATE(), INTERVAL 14 DAY)),
(18, 18, 18, 'Throbbing head', 'Tension Headache', 'Naproxen 500mg', 'SOS', 'Manage stress', DATE_ADD(CURDATE(), INTERVAL 21 DAY)),
(19, 19, 19, 'Cough, body ache', 'Influenza', 'Oseltamivir 75mg', '1-0-1', 'Strict rest', DATE_ADD(CURDATE(), INTERVAL 5 DAY)),
(20, 20, 20, 'BP 150/90', 'Essential Hypertension', 'Losartan 50mg', '1-0-0', 'Daily BP check', DATE_ADD(CURDATE(), INTERVAL 30 DAY));

-- ==========================================
-- 6. INSERT 20 BILLS
-- ==========================================
INSERT INTO bills (patient_id, appointment_id, consultation_fee, medicine_charges, test_charges, total, status) VALUES 
(1, 1, 500.00, 150.00, 1000.00, 1650.00, 'Paid'),
(2, 2, 700.00, 200.00, 0.00, 900.00, 'Pending'),
(3, 3, 400.00, 100.00, 500.00, 1000.00, 'Paid'),
(4, 4, 600.00, 250.00, 0.00, 850.00, 'Pending'),
(5, 5, 450.00, 300.00, 0.00, 750.00, 'Paid'),
(6, 6, 800.00, 120.00, 2000.00, 2920.00, 'Pending'),
(7, 7, 300.00, 50.00, 0.00, 350.00, 'Paid'),
(8, 8, 550.00, 0.00, 1200.00, 1750.00, 'Pending'),
(9, 9, 400.00, 80.00, 0.00, 480.00, 'Paid'),
(10, 10, 350.00, 0.00, 3000.00, 3350.00, 'Paid'),
(11, 11, 1000.00, 400.00, 1500.00, 2900.00, 'Pending'),
(12, 12, 650.00, 180.00, 0.00, 830.00, 'Paid'),
(13, 13, 500.00, 220.00, 800.00, 1520.00, 'Pending'),
(14, 14, 600.00, 350.00, 0.00, 950.00, 'Paid'),
(15, 15, 550.00, 190.00, 600.00, 1340.00, 'Pending'),
(16, 16, 500.00, 280.00, 2500.00, 3280.00, 'Paid'),
(17, 17, 700.00, 150.00, 4000.00, 4850.00, 'Pending'),
(18, 18, 500.00, 90.00, 0.00, 590.00, 'Paid'),
(19, 19, 700.00, 110.00, 0.00, 810.00, 'Pending'),
(20, 20, 400.00, 160.00, 300.00, 860.00, 'Paid');

-- ==========================================
-- 7. INSERT 20 REPORTS
-- ==========================================
INSERT INTO reports (patient_id, report_name, report_path) VALUES 
(1, 'ECG_Report_John.pdf', 'd:\\suriya\\MediCareData\\Reports\\ECG_Report_John.pdf'),
(2, 'MRI_Brain_Emma.pdf', 'd:\\suriya\\MediCareData\\Reports\\MRI_Brain_Emma.pdf'),
(3, 'XRay_Knee_Michael.pdf', 'd:\\suriya\\MediCareData\\Reports\\XRay_Knee_Michael.pdf'),
(4, 'Skin_Biopsy_Sophia.txt', 'd:\\suriya\\MediCareData\\Reports\\Skin_Biopsy_Sophia.txt'),
(5, 'Psych_Eval_William.pdf', 'd:\\suriya\\MediCareData\\Reports\\Psych_Eval_William.pdf'),
(6, 'Blood_Test_Olivia.pdf', 'd:\\suriya\\MediCareData\\Reports\\Blood_Test_Olivia.pdf'),
(7, 'Ultrasound_James.pdf', 'd:\\suriya\\MediCareData\\Reports\\Ultrasound_James.pdf'),
(8, 'Vision_Test_Ava.txt', 'd:\\suriya\\MediCareData\\Reports\\Vision_Test_Ava.txt'),
(9, 'Audiogram_Alex.pdf', 'd:\\suriya\\MediCareData\\Reports\\Audiogram_Alex.pdf'),
(10, 'Mammogram_Isabella.pdf', 'd:\\suriya\\MediCareData\\Reports\\Mammogram_Isabella.pdf'),
(11, 'CT_Scan_Daniel.pdf', 'd:\\suriya\\MediCareData\\Reports\\CT_Scan_Daniel.pdf'),
(12, 'Endoscopy_Mia.pdf', 'd:\\suriya\\MediCareData\\Reports\\Endoscopy_Mia.pdf'),
(13, 'HbA1c_Matthew.txt', 'd:\\suriya\\MediCareData\\Reports\\HbA1c_Matthew.txt'),
(14, 'Spirometry_Charlotte.pdf', 'd:\\suriya\\MediCareData\\Reports\\Spirometry_Charlotte.pdf'),
(15, 'Bone_Density_Anthony.pdf', 'd:\\suriya\\MediCareData\\Reports\\Bone_Density_Anthony.pdf'),
(16, 'Kidney_Panel_Amelia.txt', 'd:\\suriya\\MediCareData\\Reports\\Kidney_Panel_Amelia.txt'),
(17, 'Holter_Monitor_David.pdf', 'd:\\suriya\\MediCareData\\Reports\\Holter_Monitor_David.pdf'),
(18, 'EEG_Harper.pdf', 'd:\\suriya\\MediCareData\\Reports\\EEG_Harper.pdf'),
(19, 'Flu_Test_Joseph.txt', 'd:\\suriya\\MediCareData\\Reports\\Flu_Test_Joseph.txt'),
(20, 'Cholesterol_Evelyn.pdf', 'd:\\suriya\\MediCareData\\Reports\\Cholesterol_Evelyn.pdf');
