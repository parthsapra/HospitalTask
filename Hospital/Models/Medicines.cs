using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Hospital.Models
{
    public class Medicines
    {
        [Key]
        public int MedicineId { get; set; }
        public string MedicineName { get; set; }
        public string Description { get; set; }
        public DateTime ManufactureDate { get; set; }
        public DateTime ExpireDate { get; set; }
        public int Price { get; set; }
    }
}
