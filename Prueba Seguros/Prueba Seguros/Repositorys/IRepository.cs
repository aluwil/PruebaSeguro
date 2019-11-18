using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Prueba_Seguros.Repositorys
{
    public interface IRepository<T>
    {
        Task<IActionResult> Agregar([FromBody] T entidad);
        Task<IActionResult> Remover([FromRoute] int id);
        Task<IActionResult> Actualizar([FromRoute] int id, [FromBody] T entidad);
        Task<IActionResult> ObtenerPorId([FromRoute] int id);
    }
}
