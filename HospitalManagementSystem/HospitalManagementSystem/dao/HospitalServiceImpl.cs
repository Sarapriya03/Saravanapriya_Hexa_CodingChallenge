using System;
using System.Collections.Generic;
using System.Data;
using Microsoft.Data.SqlClient;
using HospitalManagementSystem.entity;

namespace HospitalManagementSystem.dao
{
    public class HospitalServiceImpl : IHospitalService
    {
        private readonly string connectionString;

        public HospitalServiceImpl(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public Appointment GetAppointmentById(int appointmentId)
        {
            Appointment appt = null;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Appointments WHERE appointmentId = @appointmentId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@appointmentId", appointmentId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    appt = new Appointment
                    {
                        AppointmentId = Convert.ToInt32(reader["appointmentId"]),
                        PatientId = Convert.ToInt32(reader["patientId"]),
                        DoctorId = Convert.ToInt32(reader["doctorId"]),
                        AppointmentDate = Convert.ToDateTime(reader["appointmentDate"]),
                        Description = reader["description"].ToString()
                    };
                }
            }
            return appt;
        }

        public List<Appointment> GetAppointmentsForPatient(int patientId)
        {
            var list = new List<Appointment>();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Appointments WHERE patientId = @patientId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@patientId", patientId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Appointment appt = new Appointment
                    {
                        AppointmentId = Convert.ToInt32(reader["appointmentId"]),
                        PatientId = Convert.ToInt32(reader["patientId"]),
                        DoctorId = Convert.ToInt32(reader["doctorId"]),
                        AppointmentDate = Convert.ToDateTime(reader["appointmentDate"]),
                        Description = reader["description"].ToString()
                    };
                    list.Add(appt);
                }
            }
            return list;
        }

        public List<Appointment> GetAppointmentsForDoctor(int doctorId)
        {
            var list = new List<Appointment>();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Appointments WHERE doctorId = @doctorId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@doctorId", doctorId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Appointment appt = new Appointment
                    {
                        AppointmentId = Convert.ToInt32(reader["appointmentId"]),
                        PatientId = Convert.ToInt32(reader["patientId"]),
                        DoctorId = Convert.ToInt32(reader["doctorId"]),
                        AppointmentDate = Convert.ToDateTime(reader["appointmentDate"]),
                        Description = reader["description"].ToString()
                    };
                    list.Add(appt);
                }
            }
            return list;
        }

        public bool ScheduleAppointment(Appointment appointment)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO Appointments (patientId, doctorId, appointmentDate, description)
                                 VALUES (@patientId, @doctorId, @appointmentDate, @description)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@patientId", appointment.PatientId);
                cmd.Parameters.AddWithValue("@doctorId", appointment.DoctorId);
                cmd.Parameters.AddWithValue("@appointmentDate", appointment.AppointmentDate);
                cmd.Parameters.AddWithValue("@description", appointment.Description);

                conn.Open();
                int result = cmd.ExecuteNonQuery();
                return result > 0;
            }
        }

        public bool UpdateAppointment(Appointment appointment)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"UPDATE Appointments 
                                 SET patientId = @patientId, doctorId = @doctorId, 
                                     appointmentDate = @appointmentDate, description = @description
                                 WHERE appointmentId = @appointmentId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@patientId", appointment.PatientId);
                cmd.Parameters.AddWithValue("@doctorId", appointment.DoctorId);
                cmd.Parameters.AddWithValue("@appointmentDate", appointment.AppointmentDate);
                cmd.Parameters.AddWithValue("@description", appointment.Description);
                cmd.Parameters.AddWithValue("@appointmentId", appointment.AppointmentId);

                conn.Open();
                int result = cmd.ExecuteNonQuery();
                return result > 0;
            }
        }

        public bool CancelAppointment(int appointmentId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Appointments WHERE appointmentId = @appointmentId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@appointmentId", appointmentId);
                conn.Open();
                int result = cmd.ExecuteNonQuery();
                return result > 0;
            }
        }
    }
}
