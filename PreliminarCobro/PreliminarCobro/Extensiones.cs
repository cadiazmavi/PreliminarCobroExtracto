using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PreliminarCobro
{
  internal static class Extensiones
  {
    /// <summary>
    /// Validar si alguna de las columnas esta en modo edición.
    /// </summary>
    /// <param name="dataGridView">DataGridView a Validar</param>
    /// <returns>Bool</returns>
    public static bool IsInEditMode(this DataGridView dataGridView)
    {
      bool resultado = false;

      if (dataGridView != null && dataGridView.Rows.Count > 0 && dataGridView.Columns.Count > 0)
      {
        for(int idxRow = 0; idxRow < dataGridView.Rows.Count; idxRow ++)
        {
          for (int idxCell = 0; idxCell < dataGridView.Rows[idxRow].Cells.Count; idxCell ++)
          {
            resultado = dataGridView.Rows[idxRow].Cells[idxCell].IsInEditMode;
            if (resultado) break;
          }
          if (resultado) break;
        }
      }

      return resultado;
    }

    public static int ToInt(this string value)
    {
      int val = 0;

      try
      {
        val = Convert.ToInt32(value);
      }
      catch { }

      return val;
    }

  }

}
