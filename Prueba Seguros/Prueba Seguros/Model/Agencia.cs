using System;
using System.Collections.Generic;

namespace Prueba_Seguros.Model
{
    public partial class Agencia : Entidad
    {
        public int IdAgencia { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
    }
}
