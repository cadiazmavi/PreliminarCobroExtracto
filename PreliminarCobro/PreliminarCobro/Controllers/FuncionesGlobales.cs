using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PreliminarCobro.Controllers
{
  internal class FuncionesGlobales
  {


    /// <summary>
    /// Retorna la conversión de un datatable a una lista de clases.
    /// </summary>
    /// <typeparam name="T">Clase a la que se va a convertir</typeparam>
    /// <param name="tbl">Tabla con los datos a convertir</param>
    /// <returns></returns>
    public static List<T> GetDatosDataTable<T>(DataTable tbl)
    {
      List<T> listResult = new List<T>();
      List<PropertyInfo> props = (from PropertyInfo _prop_2 in typeof(T).GetProperties() where _prop_2.CanWrite && tbl.Columns.Contains(_prop_2.Name.ToString()) select _prop_2).ToList();

      foreach (DataRow row in tbl.Rows)
      {
        var _item = Activator.CreateInstance<T>();
        foreach (PropertyInfo _prop in props)
        {
          if (row[_prop.Name.ToString()] != DBNull.Value)
          {
            object _value = row[_prop.Name.ToString()].ToString().Trim();
            Type _type_val = _prop.PropertyType;

            if (_prop.PropertyType.IsEnum)
              _value = Enum.Parse(_type_val, _value.ToString());
            else
              _value = Convert.ChangeType(_value, _type_val);

            _prop.SetValue(_item, _value, null);
          }
        }
        listResult.Add(_item);
      }

      return listResult;
    }



    /// <summary>
    /// Para solo poder capturar numeros.
    /// </summary>
    /// <param name="txt">TextBox</param>
    /// <param name="e">KeyPressEventArgs</param>
    public static void TextBox_SoloNum(TextBox txt, KeyPressEventArgs e)
    {
      if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
      {
        e.Handled = true;
      }
    }

    /// <summary>
    /// Para solo poder capturar letras.
    /// </summary>
    /// <param name="txt">TextBox</param>
    /// <param name="e">KeyPressEventArgs</param>
    public static void TextBox_SoloLetra(TextBox txt, KeyPressEventArgs e)
    {
      if (!char.IsControl(e.KeyChar) && !(e.KeyChar == 32 || (e.KeyChar >= 65 && e.KeyChar <= 90) || (e.KeyChar >= 97 && e.KeyChar <= 122) || e.KeyChar == 209 || e.KeyChar == 241))
      {
        e.Handled = true;
      }
    }

    /// <summary>
    /// Para solo poder capturar letras y numeros.
    /// </summary>
    /// <param name="txt">TextBox</param>
    /// <param name="e">KeyPressEventArgs</param>
    public static void TextBox_SoloLetraNum(TextBox txt, KeyPressEventArgs e)
    {
      if (!char.IsControl(e.KeyChar) && 
          !(e.KeyChar == 32 || (e.KeyChar >= 65 && e.KeyChar <= 90) || (e.KeyChar >= 97 && e.KeyChar <= 122) || e.KeyChar == 209 || e.KeyChar == 241) && 
          !char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
      {
        e.Handled = true;
      }
    }

    /// <summary>
    /// Para solo poder capturar decimales.
    /// </summary>
    /// <param name="txt">TextBox</param>
    /// <param name="e">KeyPressEventArgs</param>
    public static void TextBox_Decimales(TextBox txt, KeyPressEventArgs e)
    {
      if (!char.IsControl(e.KeyChar))
      {
        try
        {
          Convert.ToDecimal((txt.Text + e.KeyChar.ToString()).Replace("$", ""));
          e.Handled = false;
        }
        catch (Exception ex)
        {
          e.Handled = true;
        }

      }
    }



    /// <summary>
    /// Ordena los datos de una lista de clases.
    /// </summary>
    /// <typeparam name="T">Clase a la que se va a convertir</typeparam>
    /// <param name="datos">Lista de clase que contiene los datos a ordenar</param>
    /// <param name="propiedad">Propiedad a ordenar</param>
    /// <param name="direccion">Dirección en la que debe ordenar</param>
    public static void OrdenarDatos<T>(ref List<T> datos, string propiedad, System.Windows.Forms.SortOrder direccion)
    {
      if (direccion == System.Windows.Forms.SortOrder.Ascending)
        datos = datos.OrderBy(item => item.GetType().GetProperty(propiedad).GetValue(item, null)).ToList();
      else
        datos = datos.OrderByDescending(item => item.GetType().GetProperty(propiedad).GetValue(item, null)).ToList();
    }


    /// <summary>
    /// Valida si una cadena es un entero
    /// </summary>
    /// <param name="valor">cadena a validar.</param>
    /// <returns></returns>
    public static bool EsEntero(object valor)
    {
      bool result = false;
      try
      {
        Int64 num = Convert.ToInt64(valor);
        result = true;
      }
      catch(Exception ex)   {      }
      return result;
    }

  }

}
