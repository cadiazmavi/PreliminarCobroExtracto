using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PreliminarCobro.Models
{
  internal class DoctosHijos
  {
    #region "Propiedades"
    public string Cliente { get; set; }
    public int ID { get; set; }
    public string Mov { get; set; }
    public string MovID { get; set; }
    public DateTime Vencimiento { get; set; }
    public decimal ImporteTotal { get; set; }
    public decimal Saldo { get; set; }
    public decimal Moratorios { get; set; }
    public string Estatus { get; set; }
    public int DiasVencidos { get; set; }
    public string PadreMAVI { get; set; }
    public string PadreIDMAVI { get; set; }
    public decimal BonifPP { get; set; }
    public decimal BonifCC { get; set; }
    public decimal ImpApoyoDima { get; set; }
    public decimal SaldoApoyoDima { get; set; }
    public int CobroCteFinal { get; set; }
    public int ClienteEnviarA { get; set; }
    public int SucursalOrigen { get; set; }
    public string Concepto { get; set; }

    #endregion

    #region "Propiedades solo lectura"
    public string Movimiento
    {
      get
      {
        return Mov + " " + MovID;
      }
    }

    public string Origen
    {
      get
      {
        return PadreMAVI + " " + PadreIDMAVI;
      }
    }

    public decimal BonifPP_Round
    {
      get
      {
        return Math.Ceiling(BonifPP) + 1;
      }
    }

    #endregion

  }
}
