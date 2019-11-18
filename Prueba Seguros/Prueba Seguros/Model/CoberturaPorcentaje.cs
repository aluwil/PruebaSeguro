using System;
using System.Collections.Generic;

namespace Prueba_Seguros.Model
{
    public partial class CoberturaPorcentaje : Entidad
    {
        public CoberturaPorcentaje()
        {
            EmisionPoliza = new HashSet<EmisionPoliza>();
        }

        public int IdCoberturaPorcentaje { get; set; }
        public int Porcentaje { get; set; }

        public virtual ICollection<EmisionPoliza> EmisionPoliza { get; set; }
    }
}
