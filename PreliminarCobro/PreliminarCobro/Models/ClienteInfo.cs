using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PreliminarCobro.Models
{
  internal class ClienteInfo
  {
    #region "Propiedades"
    public string Nombre { get; set; }
    public string Rfc { get; set; }
    public string Cliente { get; set; }
    public string TelefonoPart { get; set; }
    public string TelefonoMov { get; set; }
    public string Direccion { get; set; }
    public string DireccionNumero { get; set; }
    public string DireccionNumeroInt { get; set; }
    public string Colonia { get; set; }
    public string CodigoPostal { get; set; }
    public string Estado { get; set; }
    public string Delegacion { get; set; }
    public string Poblacion { get; set; }
    public decimal CalificacionGlobal { get; set; }
    public string RutaCobro { get; set; }
    public decimal CompraMay { get; set; }
    public decimal SaldoNC { get; set; }
    public decimal SaldoFavor { get; set; }
    public bool SinBonifDIMA { get; set; }
    public string NIP_COBRO { get; set; }
    public string CteFinal { get; set; }
    public string NombreFinal { get; set; }
    public string Division { get; set; }
    public string IdCatalogoTarjetas { get; set; }
    public string TieneSaldo { get; set; }
    public string NipVenta { get; set; }
    public bool ValidaTel { get; set; }
    public int IDMagento { get; set; }
    #endregion

    #region "Propiedades solo lectura"
    private string domicilio = "";
    public string Domicilio
    {
      get
      {
        if (domicilio == "")
          domicilio = (DireccionNumeroInt == "" || DireccionNumeroInt == null) ? Direccion + " " + DireccionNumero : Direccion + " " + DireccionNumero + "-" + DireccionNumeroInt;
        return domicilio;
      }
    }

    #endregion


  }
}
