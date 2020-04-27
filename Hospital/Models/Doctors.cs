using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using static Hospital.Models.ApplicationObjects;

namespace Hospital.Models
{
    public class Doctors
    {
        [Key]
        public int DoctorId { get; set; }
        public string DoctorName { get; set; }
        public int DepartmentId { get; set; }
        public string ContactNumber { get; set; }
        public string EmailId { get; set; }
        public string Address { get; set; }
        public int Salary { get; set; }
        public int Gender { get; set; }
    }
}
