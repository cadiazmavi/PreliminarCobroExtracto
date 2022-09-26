using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PreliminarCobro
{
  internal class ColoresApp
  {
    public static Color FiltrosBackColor
    {
      get
      {
        if (Global.conexionSql.GetBaseDatosConexion().ToUpper() == Properties.Settings.Default.BaseDatosM.ToUpper())
          return Color.Green;
        else
          return Color.SteelBlue;
      }
    }

    public static Color DatosClienteBackColor
    {
      get
      {
        if (Global.conexionSql.GetBaseDatosConexion().ToUpper() == Properties.Settings.Default.BaseDatosM.ToUpper())
          return Color.PaleGreen;
        else
          return Color.White;
      }
    }

    public static Color HeaderGridBackColor
    {
      get
      {
        if (Global.conexionSql.GetBaseDatosConexion().ToUpper() == Properties.Settings.Default.BaseDatosM.ToUpper())
          return Color.Green;
        else
          return Color.SteelBlue;
      }
    }

    public static Color CellSelectionBackColor
    {
      get
      {
        if (Global.conexionSql.GetBaseDatosConexion().ToUpper() == Properties.Settings.Default.BaseDatosM.ToUpper())
          return Color.LimeGreen;
        else
          return Color.DeepSkyBlue;
      }
    }









  }

}
