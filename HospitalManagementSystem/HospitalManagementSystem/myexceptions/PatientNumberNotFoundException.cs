using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HospitalManagementSystem.myexceptions
{
    public class PatientNumberNotFoundException : Exception
    {
        public PatientNumberNotFoundException(string message) : base(message)
        {
        }
    }
}
