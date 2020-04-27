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
    public class PriscriptionsController : ControllerBase
    {
        private readonly HospitalContext _context;

        public PriscriptionsController(HospitalContext context)
        {
            _context = context;
        }

        // GET: api/Priscriptions
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Priscriptions>>> GetPriscriptions()
        {
            return await _context.Priscriptions.ToListAsync();
        }

        // GET: api/Priscriptions/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Priscriptions>> GetPriscriptions(int id)
        {
            var priscriptions = await _context.Priscriptions.FindAsync(id);

            if (priscriptions == null)
            {
                return NotFound();
            }

            return priscriptions;
        }

        // PUT: api/Priscriptions/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPriscriptions(int id, Priscriptions priscriptions)
        {
            if (id != priscriptions.PriscriptionId)
            {
                return BadRequest();
            }

            _context.Entry(priscriptions).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PriscriptionsExists(id))
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

        // POST: api/Priscriptions
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<Priscriptions>> PostPriscriptions(Priscriptions priscriptions)
        {
            _context.Priscriptions.Add(priscriptions);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPriscriptions", new { id = priscriptions.PriscriptionId }, priscriptions);
        }

        // DELETE: api/Priscriptions/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Priscriptions>> DeletePriscriptions(int id)
        {
            var priscriptions = await _context.Priscriptions.FindAsync(id);
            if (priscriptions == null)
            {
                return NotFound();
            }

            _context.Priscriptions.Remove(priscriptions);
            await _context.SaveChangesAsync();

            return priscriptions;
        }

        private bool PriscriptionsExists(int id)
        {
            return _context.Priscriptions.Any(e => e.PriscriptionId == id);
        }
    }
}
