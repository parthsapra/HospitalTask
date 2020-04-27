using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Hospital.Context;
using Hospital.Models;

namespace Hospital.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BedsController : ControllerBase
    {
        private readonly HospitalContext _context;

        public BedsController(HospitalContext context)
        {
            _context = context;
        }

        // GET: api/Beds
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Beds>>> GetBeds()
        {
            return await _context.Beds.ToListAsync();
        }

        // GET: api/Beds/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Beds>> GetBeds(int id)
        {
            var beds = await _context.Beds.FindAsync(id);

            if (beds == null)
            {
                return NotFound();
            }

            return beds;
        }

        // PUT: api/Beds/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBeds(int id, Beds beds)
        {
            if (id != beds.BedId)
            {
                return BadRequest();
            }

            _context.Entry(beds).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BedsExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Beds
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<Beds>> PostBeds(Beds beds)
        {
            _context.Beds.Add(beds);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetBeds", new { id = beds.BedId }, beds);
        }

        // DELETE: api/Beds/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Beds>> DeleteBeds(int id)
        {
            var beds = await _context.Beds.FindAsync(id);
            if (beds == null)
            {
                return NotFound();
            }

            _context.Beds.Remove(beds);
            await _context.SaveChangesAsync();

            return beds;
        }

        private bool BedsExists(int id)
        {
            return _context.Beds.Any(e => e.BedId == id);
        }
    }
}
