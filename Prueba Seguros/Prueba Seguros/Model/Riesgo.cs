using System;
using System.Collections.Generic;

namespace Prueba_Seguros.Model
{
    public partial class Riesgo : Entidad
    {
        public Riesgo()
        {
            EmisionPoliza = new HashSet<EmisionPoliza>();
        }

        public int IdRiesgo { get; set; }
        public string Descripcion { get; set; }

        public virtual ICollection<EmisionPoliza> EmisionPoliza { get; set; }
    }
}
