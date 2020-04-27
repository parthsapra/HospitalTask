using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Hospital.Models
{
    public class Patients
    {
        [Key]
        public int PatientId { get; set; }
        public string PatientName { get; set; }
        public int Age { get; set; }
        public string Gender { get; set; }
        public string Address { get; set; }
        public DateTime DateAdmitted { get; set; }
        public DateTime DateDischarge { get; set; }
        public string ContactNumber { get; set; }
        public string MedicslHistory { get; set; }
    }
}
