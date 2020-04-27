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
    public class HealthcareAssistentsController : ControllerBase
    {
        private readonly HospitalContext _context;

        public HealthcareAssistentsController(HospitalContext context)
        {
            _context = context;
        }

        // GET: api/HealthcareAssistents
        [HttpGet]
        public async Task<ActionResult<IEnumerable<HealthcareAssistents>>> GetHealthcareAssistents()
        {
            return await _context.HealthcareAssistents.ToListAsync();
        }

        // GET: api/HealthcareAssistents/5
        [HttpGet("{id}")]
        public async Task<ActionResult<HealthcareAssistents>> GetHealthcareAssistents(int id)
        {
            var healthcareAssistents = await _context.HealthcareAssistents.FindAsync(id);

            if (healthcareAssistents == null)
            {
                return NotFound();
            }

            return healthcareAssistents;
        }

        // PUT: api/HealthcareAssistents/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutHealthcareAssistents(int id, HealthcareAssistents healthcareAssistents)
        {
            if (id != healthcareAssistents.HealthcareAssistentId)
            {
                return BadRequest();
            }

            _context.Entry(healthcareAssistents).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HealthcareAssistentsExists(id))
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

        // POST: api/HealthcareAssistents
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<HealthcareAssistents>> PostHealthcareAssistents(HealthcareAssistents healthcareAssistents)
        {
            _context.HealthcareAssistents.Add(healthcareAssistents);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetHealthcareAssistents", new { id = healthcareAssistents.HealthcareAssistentId }, healthcareAssistents);
        }

        // DELETE: api/HealthcareAssistents/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<HealthcareAssistents>> DeleteHealthcareAssistents(int id)
        {
            var healthcareAssistents = await _context.HealthcareAssistents.FindAsync(id);
            if (healthcareAssistents == null)
            {
                return NotFound();
            }

            _context.HealthcareAssistents.Remove(healthcareAssistents);
            await _context.SaveChangesAsync();

            return healthcareAssistents;
        }

        private bool HealthcareAssistentsExists(int id)
        {
            return _context.HealthcareAssistents.Any(e => e.HealthcareAssistentId == id);
        }
    }
}
