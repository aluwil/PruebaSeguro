using System;
using System.Collections.Generic;

namespace Prueba_Seguros.Model
{
    public partial class TipoPoliza : Entidad
    {
        public TipoPoliza()
        {
            EmisionPoliza = new HashSet<EmisionPoliza>();
        }

        public int IdTipoPoliza { get; set; }
        public string Descripcion { get; set; }

        public virtual ICollection<EmisionPoliza> EmisionPoliza { get; set; }
    }
}
