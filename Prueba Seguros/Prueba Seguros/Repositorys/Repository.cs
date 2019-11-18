using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Prueba_Seguros.Model;

namespace Prueba_Seguros.Repositorys
{
    public class Repository<T> : IRepository<T> where T : Entidad, new()
    {
        private readonly DBSegurosContext _context;

        public Repository(DBSegurosContext context)
        {
            _context = context;
        }

        Task<IActionResult> IRepository<T>.Actualizar(int id, T entidad)
        {
            _context.Entry(Mapper.Map<CustomerOrder>(customerOrder)).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CustomerOrderExists(id))
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

        Task<IActionResult> IRepository<T>.Agregar(T entidad)
        {
            throw new NotImplementedException();
        }

        Task<IActionResult> IRepository<T>.ObtenerPorId(int id)
        {
            throw new NotImplementedException();
        }

        Task<IActionResult> IRepository<T>.Remover(int id)
        {
            throw new NotImplementedException();
        }
    }
}
