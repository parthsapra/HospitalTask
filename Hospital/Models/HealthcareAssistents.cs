using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Hospital.Models
{
    public class HealthcareAssistents
    {
        [Key]
        public int HealthcareAssistentId { get; set; }
        public string HealthcareAssistentName { get; set; }
        public string ContactNumber { get; set; }
        public int DepartmentId { get; set; }
        public int Gender { get; set; }
    }
}
