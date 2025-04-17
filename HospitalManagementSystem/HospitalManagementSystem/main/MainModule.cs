using System;
using Microsoft.Data.SqlClient;
using System.Collections.Generic;
using HospitalManagementSystem.dao;
using HospitalManagementSystem.entity;
using HospitalManagementSystem.util;
using HospitalManagementSystem.myexceptions;

namespace HospitalManagementSystem.main
{
    public class MainModule
    {
        public static void Main(string[] args)
        {
            try
            {
                string connStr = DBPropertyUtil.GetConnectionString("db.properties");
                SqlConnection conn = DBConnection.GetConnection(connStr);
                IHospitalService service = new HospitalServiceImpl(conn.ConnectionString);
                bool exit = false;

                while (!exit)
                {
                    Console.WriteLine("\n=== Hospital Management System ===");
                    Console.WriteLine("1. Get Appointment by ID");
                    Console.WriteLine("2. Get Appointments for Patient");
                    Console.WriteLine("3. Get Appointments for Doctor");
                    Console.WriteLine("4. Schedule Appointment");
                    Console.WriteLine("5. Update Appointment");
                    Console.WriteLine("6. Cancel Appointment");
                    Console.WriteLine("7. Exit");
                    Console.Write("Enter your choice: ");
                    string choice = Console.ReadLine();

                    switch (choice)
                    {
                        case "1":
                            Console.Write("Enter Appointment ID: ");
                            int aid = int.Parse(Console.ReadLine());
                            Appointment appt = service.GetAppointmentById(aid);
                            if (appt != null)
                                appt.PrintDetails();
                            else
                                Console.WriteLine("No appointment found.");
                            break;

                        case "2":
                            Console.Write("Enter Patient ID: ");
                            int patientId = int.Parse(Console.ReadLine());
                            var patientAppointments = service.GetAppointmentsForPatient(patientId);
                            if (patientAppointments.Count == 0)
                                throw new PatientNumberNotFoundException($"Patient with ID {patientId} does not exist or has no appointments.");
                            foreach (var a in patientAppointments)
                                a.PrintDetails();
                            break;

                        case "3":
                            Console.Write("Enter Doctor ID: ");
                            int doctorId = int.Parse(Console.ReadLine());
                            var doctorAppointments = service.GetAppointmentsForDoctor(doctorId);
                            foreach (var a in doctorAppointments)
                                a.PrintDetails();
                            break;

                        case "4":
                            Console.Write("Enter Patient ID: ");
                            int pId = int.Parse(Console.ReadLine());
                            Console.Write("Enter Doctor ID: ");
                            int dId = int.Parse(Console.ReadLine());
                            Console.Write("Enter Description: ");
                            string desc = Console.ReadLine();
                            Appointment newAppointment = new Appointment(0, pId, dId, DateTime.Now.AddDays(1), desc);
                            bool isScheduled = service.ScheduleAppointment(newAppointment);
                            Console.WriteLine("Appointment Scheduled: " + isScheduled);
                            break;

                        case "5":
                            Console.Write("Enter Appointment ID to update: ");
                            int updateId = int.Parse(Console.ReadLine());
                            Appointment updateAppt = service.GetAppointmentById(updateId);
                            if (updateAppt != null)
                            {
                                Console.Write("Enter new description: ");
                                updateAppt.Description = Console.ReadLine();
                                bool updated = service.UpdateAppointment(updateAppt);
                                Console.WriteLine("Appointment Updated: " + updated);
                            }
                            else
                            {
                                Console.WriteLine("Appointment not found.");
                            }
                            break;

                        case "6":
                            Console.Write("Enter Appointment ID to cancel: ");
                            int cancelId = int.Parse(Console.ReadLine());
                            bool cancelled = service.CancelAppointment(cancelId);
                            Console.WriteLine("Appointment Cancelled: " + cancelled);
                            break;

                        case "7":
                            exit = true;
                            Console.WriteLine("Exiting...");
                            break;

                        default:
                            Console.WriteLine("Invalid choice. Try again.");
                            break;
                    }
                }
            }
            catch (PatientNumberNotFoundException ex)
            {
                Console.WriteLine("Patient Not Found: " + ex.Message);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("Database error: " + ex.Message);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Unexpected error: " + ex.Message);
            }
        }
    }
}
