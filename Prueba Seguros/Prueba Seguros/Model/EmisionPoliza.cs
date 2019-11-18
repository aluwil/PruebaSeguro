using System;
using System.Collections.Generic;

namespace Prueba_Seguros.Model
{
    public partial class EmisionPoliza : Entidad
    {
        public int IdEmisionPoliza { get; set; }
        public int IdCliente { get; set; }
        public int IdRiesgo { get; set; }
        public int IdTipoPoliza { get; set; }
        public int IdEstadoPoliza { get; set; }
        public int NumeroMesesCobertura { get; set; }
        public DateTime InicioVigencia { get; set; }
        public int IdCoberturaPorcentaje { get; set; }
        public double ValorPoliza { get; set; }

        public virtual Cliente IdClienteNavigation { get; set; }
        public virtual CoberturaPorcentaje IdCoberturaPorcentajeNavigation { get; set; }
        public virtual EstadoPoliza IdEstadoPolizaNavigation { get; set; }
        public virtual Riesgo IdRiesgoNavigation { get; set; }
        public virtual TipoPoliza IdTipoPolizaNavigation { get; set; }
    }
}
