// Decompiled with JetBrains decompiler
// Type: ConectaSql.ConectaSqlFn
// Assembly: ConectaSql, Version=1.2018.9.6, Culture=neutral, PublicKeyToken=null
// MVID: FC6BF1DB-070D-485D-8D0D-897C749CE49C
// Assembly location: \\172.16.202.25\Versiones\3100Capacitacion\PlugIns\moduloRecargas\ModuloRecargas\ConectaSql.dll

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text.RegularExpressions;

namespace ConectaSql

{
    public class ConectaSqlFn
    {
        ConexionSql conSql = (ConexionSql)null;
        string servidorConexion;
        string baseDatosConexion;
        string usuario;
        string password;

        public string GetServidorConexion()
        {
            return this.servidorConexion;
        }

        public string GetBaseDatosConexion()
        {
            return this.baseDatosConexion;
        }


        public SqlParameter NewSqlParameter(
          string name,
          SqlDbType type,
          object valor,
          ParameterDirection direccion)
        {
            return this.ValidaDatos() ? this.conSql.NewSqlParameter(name, type, valor, direccion) : (SqlParameter)null;
        }

        public DataSet GetDataSet(string query, List<SqlParameter> param, bool usarTransaction = true)
        {
            return this.ValidaDatos() ? this.conSql.getDataSet(query, param, usarTransaction) : (DataSet)null;
        }

        public DataTable GetDataTable(
          string query,
          List<SqlParameter> param,
          bool usarTransaction = true)
        {
            return this.ValidaDatos() ? this.conSql.getDataTable(query, param, usarTransaction) : (DataTable)null;
        }

  

        public ConectaSqlFn(string servidorConexion, string baseDatos, string usuario, string password)
        {
            this.servidorConexion = servidorConexion;
            this.baseDatosConexion = baseDatos;
            this.usuario = usuario;
            this.password = password;
            this.conSql = new ConexionSql(this.servidorConexion, this.baseDatosConexion, this.usuario, this.password);
        }



        private bool ValidaDatos()
        {
            return this.conSql != null;
        }

       

        public struct Querys
        {
            public string Query { get; set; }

            public List<SqlParameter> Parametes { get; set; }
        }
    }
}
