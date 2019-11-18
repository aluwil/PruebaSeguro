using System;
using System.Collections.Generic;

namespace Prueba_Seguros.Model
{
    public partial class EstadoPoliza : Entidad
    {
        public EstadoPoliza()
        {
            EmisionPoliza = new HashSet<EmisionPoliza>();
        }

        public int IdEstadoPoliza { get; set; }
        public string Descripon { get; set; }

        public virtual ICollection<EmisionPoliza> EmisionPoliza { get; set; }
    }
}
