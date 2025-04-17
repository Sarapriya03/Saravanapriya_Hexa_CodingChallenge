using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HospitalManagementSystem.entity
{
    public class Appointment
    {
        public int AppointmentId { get; set; }
        public int PatientId { get; set; }
        public int DoctorId { get; set; }
        public DateTime AppointmentDate { get; set; }
        public string Description { get; set; }

        public Appointment()
        {

        }

        public Appointment(int appointmentId, int patientId, int doctorId, DateTime appointmentDate, string description)
        {
            AppointmentId = appointmentId;
            PatientId = patientId;
            DoctorId = doctorId;
            AppointmentDate = appointmentDate;
            Description = description;
        }

        public void PrintDetails()
        {
            Console.WriteLine($"AppointmentId: {AppointmentId}");
            Console.WriteLine($"PatientId: {PatientId}");
            Console.WriteLine($"DoctorId: {DoctorId}");
            Console.WriteLine($"Appointment Date: {AppointmentDate.ToShortDateString()}");
            Console.WriteLine($"Description: {Description}");
        }
    }
}
