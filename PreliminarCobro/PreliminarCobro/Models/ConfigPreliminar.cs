using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PreliminarCobro.Models
{
  internal class ConfigPreliminar
  {
    public bool LimiteCreditoCobro { get; set; }
    public bool LiquidaCompleto { get; set; }
    public bool ValidaSesion { get; set; }
    public bool ValidaTarjeta { get; set; }
    public bool ValidaNipCompra { get; set; }
  }

}
