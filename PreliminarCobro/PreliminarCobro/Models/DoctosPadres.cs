using System;
using System.Collections.Generic;

namespace PreliminarCobro.Models
{
  internal class DoctosPadres
  {
    #region "Propiedades"
    public string Empresa { get; set; }
    public string Cliente { get; set; }
    public int ClienteEnviarA { get; set; }
    public string Categoria { get; set; }
    public int ID { get; set; }
    public string PadreMAVI { get; set; }
    public string PadreIDMAVI { get; set; }
    public DateTime FechaEmision { get; set; }
    public string Condicion { get; set; }
    public DateTime PrimerVencimiento { get; set; }
    public string FormaPagoTipo { get; set; }
    public string DAPeriodo { get; set; }
    public int DANumeroDocumentos { get; set; }
    public string DescripcionArt { get; set; }
    public decimal ImporteVta { get; set; }
    public decimal Enganche { get; set; }
    public decimal Monedero { get; set; }
    public int SucursalOrigen { get; set; }
    public string CobroXPolitica { get; set; }
    public DateTime UltimoPago { get; set; }
    public int DiasInactivos { get; set; }
    public string CteFinal { get; set; }
    public string NomCteFinal { get; set; }
    public string RfcCteFinal { get; set; }
    public int IdVta { get; set; }
    public int DVCxcMavi { get; set; }
    public int DICxcMavi { get; set; }
    public decimal PagoLiquida { get; set; }
    public decimal SaldoCapital { get; set; }
    public decimal Moratorios { get; set; }
    public decimal SaldoVencido { get; set; }
    public decimal SaldoTotal { get; set; }
    public decimal ImpApoyo { get; set; }
    public int CheckApoyo { get; set; }
    public decimal SaldoApoyo { get; set; }
    public DateTime DiaPago { get; set; }
    public decimal PagoParaEstaralCorriente { get; set; }
    public int DiasVencidos { get; set; }
    public decimal ImportePagar { get; set; }
    public decimal ACondonar { get; set; }
    public bool SolicitarApoyo { get; set; }
    /// <summary>
    /// Es el id que tiene la pestaña en la que se debe mostrar (Tag del TabPage)
    /// </summary>
    public List<int> IdTagPestaña { get; set; }
    public string TieneBonificacion { get; set; }
    public string TieneLCT { get; set; }
    public int TieneRD { get; set; }

    #endregion

    #region "Propiedades solo lectura"
    public string Movimiento
    {
      get
      {
        return PadreMAVI + " " + PadreIDMAVI;
      }
    }

    private decimal pago = 0;
    public decimal Pago
    {
      get
      {
        if (pago == 0)
        {
          pago = Decimal.Round(((ImporteVta - (Enganche + Monedero)) / (decimal)(DANumeroDocumentos == 0 ? 1 : DANumeroDocumentos)), 2);
        }
        return pago;
      }
    }

    private string montoPago = "";
    public string MontoPago
    {
      get
      {
        if (montoPago == "")
        {
          if (FormaPagoTipo == null || FormaPagoTipo == "")
          {
            if (DANumeroDocumentos > 0)
            {
              montoPago = (ImporteVta / (decimal)DANumeroDocumentos).ToString("C2") + " " + DAPeriodo.ToUpper();
            }
          }
          else if (FormaPagoTipo.ToUpper() == "MENSUAL" && DAPeriodo.ToUpper() == "MENSUAL")
          {
            montoPago = ((ImporteVta - (Enganche + Monedero)) / (decimal)DANumeroDocumentos).ToString("C2") + " " + FormaPagoTipo.ToUpper();
          }
          else if (FormaPagoTipo.ToUpper() == "MENSUAL" && DAPeriodo.ToUpper() == "QUINCENAL")
          {
            montoPago = (((ImporteVta - (Enganche + Monedero)) / (decimal)DANumeroDocumentos) * (decimal)2).ToString("C2") + " " + FormaPagoTipo.ToUpper();
          }
          else if (FormaPagoTipo.ToUpper() == "SEMANAL")
          {
            montoPago = ((ImporteVta - (Enganche + Monedero)) / ((((decimal)DANumeroDocumentos * (decimal)365) / ((decimal)12 * (decimal)7)))).ToString("C2") + " " + FormaPagoTipo.ToUpper();
          }
          else if (FormaPagoTipo.ToUpper() == "QUINCENAL" && DAPeriodo.ToUpper() == "QUINCENAL")
          {
            montoPago = ((ImporteVta - (Enganche + Monedero)) / (decimal)DANumeroDocumentos).ToString("C2") + " " + FormaPagoTipo.ToUpper();
          }
          else if (FormaPagoTipo.ToUpper() == "QUINCENAL" && DAPeriodo.ToUpper() == "MENSUAL")
          {
            montoPago = ((ImporteVta - (Enganche + Monedero)) / ((decimal)DANumeroDocumentos * (decimal)2)).ToString("C2") + " " + FormaPagoTipo.ToUpper();
          }
          else if (FormaPagoTipo.ToUpper() == "MAYOREO" && DANumeroDocumentos > 0)
          {
            montoPago = ((ImporteVta - (Enganche + Monedero)) / (decimal)DANumeroDocumentos).ToString("C2") + " MENSUAL";
          }

        }

        return montoPago;
      }
    }

    #endregion

  }
}
