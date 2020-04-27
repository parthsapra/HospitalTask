using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Hospital.Models
{
    public class Beds
    {
        [Key]
        public int BedId { get; set; }
        public int PatientId { get; set; }
        public DateTime DateAssigned { get; set; }
        public DateTime DateFree { get; set; }

    }
}
