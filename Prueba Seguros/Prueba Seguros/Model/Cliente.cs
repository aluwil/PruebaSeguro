using System;
using System.Collections.Generic;

namespace Prueba_Seguros.Model
{
    public partial class Cliente : Entidad
    {
        public Cliente()
        {
            EmisionPoliza = new HashSet<EmisionPoliza>();
        }

        public int IdCliente { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Telefono { get; set; }

        public virtual ICollection<EmisionPoliza> EmisionPoliza { get; set; }
    }
}
