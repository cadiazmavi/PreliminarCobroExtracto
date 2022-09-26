// Decompiled with JetBrains decompiler
// Type: ConectaSql.ConexionSql
// Assembly: ConectaSql, Version=1.2018.9.6, Culture=neutral, PublicKeyToken=null
// MVID: FC6BF1DB-070D-485D-8D0D-897C749CE49C
// Assembly location: \\172.16.202.25\Versiones\3100Capacitacion\PlugIns\moduloRecargas\ModuloRecargas\ConectaSql.dll

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace ConectaSql
{
    internal class ConexionSql
    {
        private readonly SqlConnection cnn = (SqlConnection)null;
        private string svr;
        private string db;
        private string usr;
        private string pwd;

        internal ConexionSql(string server, string dataBase, string user, string password)
        {
            this.svr = server;
            this.db = dataBase;
            this.usr = user;
            this.pwd = password;
            this.cnn = new SqlConnection(this.GetConnectionString());
        }

        private string GetConnectionString()
        {
            return "Data Source=" + this.svr + ";Initial Catalog=" + this.db + ";User Id=" + this.usr + ";Password=" + this.pwd + ";Integrated Security=False; MultipleActiveResultSets=True;";
        }

        internal void OpenConnection()
        {
            if (this.cnn.State != ConnectionState.Closed)
                return;
            this.cnn.Open();
        }

        internal void CloseConnection()
        {
            if (this.cnn.State != ConnectionState.Open)
                return;
            SqlConnection.ClearPool(this.cnn);
            this.cnn.Close();
        }

        internal SqlParameter NewSqlParameter(
          string name,
          SqlDbType type,
          object valor,
          ParameterDirection direccion)
        {
            SqlParameter sqlParameter = new SqlParameter(name, valor);
            sqlParameter.Value = valor;
            sqlParameter.Direction = direccion;
            return sqlParameter;
        }

        internal DataSet getDataSet(
          string query,
          List<SqlParameter> param,
          bool usarTransaction)
        {
            if (this.cnn.State == ConnectionState.Closed)
                this.OpenConnection();
            SqlTransaction sqlTransaction = (SqlTransaction)null;
            if (usarTransaction)
                sqlTransaction = this.cnn.BeginTransaction();
            try
            {
                SqlCommand selectCommand = new SqlCommand();
                if (sqlTransaction != null)
                    selectCommand.Transaction = sqlTransaction;
                if (query.ToLower().Contains("select ") || query.ToLower().Contains("update ") || (query.ToLower().Contains("insert ") || query.ToLower().Contains("delete ")) || query.ToLower().Contains("exec "))
                    selectCommand.CommandType = CommandType.Text;
                else
                    selectCommand.CommandType = CommandType.StoredProcedure;
                selectCommand.CommandText = query;
                selectCommand.Connection = this.cnn;
                selectCommand.CommandTimeout = 900;
                selectCommand.Parameters.Clear();
                if (param != null && param.Count > 0)
                    selectCommand.Parameters.AddRange(param.ToArray());
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(selectCommand);
                DataSet dataSet = new DataSet();
                sqlDataAdapter.Fill(dataSet);
                sqlTransaction?.Commit();
                this.CloseConnection();
                return dataSet;
            }
            catch (Exception ex)
            {
                sqlTransaction?.Rollback();
                this.CloseConnection();
                throw new Exception(ex.Message, ex);
            }
        }

        internal DataTable getDataTable(
          string query,
          List<SqlParameter> param,
          bool usarTransaction)
        {
            DataSet dataSet = this.getDataSet(query, param, usarTransaction);
            return dataSet.Tables.Count > 0 ? dataSet.Tables[0] : (DataTable)null;
        }

    }
}

