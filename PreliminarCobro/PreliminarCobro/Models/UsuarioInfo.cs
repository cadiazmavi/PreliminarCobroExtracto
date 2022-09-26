using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PreliminarCobro.Models
{
  internal class UsuarioInfo
  {
    #region "Propiedades"
    public string Usuario { get; set; }
    public string Nombre { get; set; }
    public int Sucursal { get; set; }
    public string Acceso { get; set; }
    public string Estatus { get; set; }
    public string DefCtaDinero { get; set; }
    public bool SucursalGeneraCobro { get; set; }
    public bool SucursalServicioRecarga { get; set; }
    public bool SolicitaNIPDIMA { get; set; }
    public bool SucursalRDP { get; set; }
    public string DefCajero { get; set; }
    public int UEN { get; set; }
    public string Estado { get; set; }

    #endregion

  }

}

