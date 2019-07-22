using Oracle.DataAccess.Client;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Transactions;

namespace Dgys.Service
{
    public class SqlHelper
    {
        #region SqlHelper
        /// <summary>
        /// SqlHelper
        /// </summary>
        /// <param name="_dbConn"></param>
        public SqlHelper(string _dbConn)
        {
            this.DbConn = _dbConn;
        }
        #endregion

        #region 变量.属性

        /// <summary>
        /// 数据库连接参数
        /// </summary>
        string DbConn { get; set; }

        #endregion

        #region 事务类型
        /// <summary>
        /// 事务类型
        /// </summary>
        public TransactionScope TransactionScope
        {
            get
            {
                TransactionOptions transOption = new TransactionOptions();
                // 隔离级别-事务期间不允许脏读
                transOption.IsolationLevel = System.Transactions.IsolationLevel.ReadCommitted;
                // Timeout-10分钟
                transOption.Timeout = new System.TimeSpan(0, 10, 0);
                return new TransactionScope(TransactionScopeOption.Required, transOption);
            }
        }
        #endregion

        #region CreateParm

        /// <summary>
        /// 创建SQL参数
        /// </summary>
        /// <returns></returns>
        public IDataParameter CreateParm(object value)
        {
            return CreateParm(1, new List<object> { value })[0];
        }

        /// <summary>
        /// 创建SQL参数
        /// </summary>
        /// <returns></returns>
        public IDataParameter[] CreateParm(int nums, List<object> lstValues)
        {
            IDataParameter[] objParm = new SqlParameter[nums];
            for (int i = 0; i < nums; i++)
            {
                objParm[i] = new SqlParameter();
                objParm[i].Value = lstValues[i];
            }
            return objParm;
        }
        #endregion

        #region 获取绑定参数
        /// <summary>
        /// 获取绑定参数
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        string GetParm(string sql)
        {
            return GetParm(sql, 0);
        }
        /// <summary>
        /// 获取绑定参数
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="loop"></param>
        /// <param name="isLog"></param>
        /// <returns></returns>
        string GetParm(string sql, int loop)
        {
            int intPara = 1;
            int i = -1;

            for (int idx = sql.IndexOf("?"); idx > 0; idx = sql.IndexOf("?"))
            {
                if (loop == 0)
                    sql = sql.Substring(0, idx) + "@" + (intPara++) + sql.Substring(idx + 1, sql.Length - idx - 1);
                else
                    sql = sql.Substring(0, idx) + "@" + ((++i) + 1 + loop * 10).ToString() + sql.Substring(idx + 1, sql.Length - idx - 1);
            }
            return sql;
        }
        #endregion

        #region SqlCommand  
        /// <summary>
        /// SqlCommand
        /// </summary>
        /// <param name="con"></param> 
        /// <returns></returns>
        internal SqlCommand GetSqlCommand(SqlConnection con)
        {
            SqlCommand cmd = new SqlCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandTimeout = 3000;
            return cmd;
        }
        #endregion

        #region 获取DataTable

        /// <summary>
        /// 获取DataTable带参数
        /// </summary> 
        /// <param name="sql"></param>
        /// <param name="objParams"></param>
        /// <returns></returns>
        public DataTable GetDataTable(string sql)
        {
            return GetDataTable(sql, null);
        }

        /// <summary>
        /// 获取DataTable带参数
        /// </summary> 
        /// <param name="sql"></param>
        /// <param name="dtRecord"></param>
        /// <param name="objParams"></param>
        /// <returns></returns>
        public DataTable GetDataTable(string sql, params IDataParameter[] objParm)
        {
            DataTable dtRecord = null;
            SqlConnection con = new SqlConnection(this.DbConn);
            SqlCommand cmd = GetSqlCommand(con);
            try
            {
                cmd.CommandText = GetParm(sql);
                if (objParm != null && objParm.Length > 0)
                {
                    for (int i = 0; i < objParm.Length; i++)
                    {
                        if (objParm[i].Value == null)
                        {
                            objParm[i].Value = System.DBNull.Value;
                        }
                        ((SqlParameter)objParm[i]).ParameterName = (i + 1).ToString();
                        cmd.Parameters.Add((SqlParameter)objParm[i]);
                    }
                }
                SqlDataReader sqlReader = cmd.ExecuteReader();
                dtRecord = new DataTable();
                dtRecord.Load(sqlReader);
                sqlReader.Close();
            }
            catch (System.Exception ex)
            {
                dtRecord = null;
                throw ex;
            }
            finally
            {
                if (cmd != null)
                {
                    cmd.Connection.Close();
                    cmd.Dispose();
                }
            }
            return dtRecord;
        }
        #endregion

        #region 执行Sql

        #region 执行SQL

        /// <summary>
        /// 执行SQL
        /// </summary> 
        /// <param name="sql"></param>
        /// <returns></returns>
        public int ExecSql(string sql)
        {
            return ExecSql(sql, 0, null);
        }
        #endregion

        #region 执行SQL带参数

        /// <summary>
        /// ExecSql
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="objParm"></param>
        /// <returns></returns>
        public int ExecSql(string sql, IDataParameter parm)
        {
            return ExecSql(sql, new List<IDataParameter>() { parm });
        }
        /// <summary>
        /// ExecSql
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="objParm"></param>
        /// <returns></returns>
        public int ExecSql(string sql, params IDataParameter[] objParm)
        {
            if (objParm == null)
                return ExecSql(sql, new List<IDataParameter>());
            else
                return ExecSql(sql, 0, objParm);
        }
        /// <summary>
        /// ExecSql
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="lstParm"></param>
        /// <returns></returns>
        public int ExecSql(string sql, List<IDataParameter> lstParm)
        {
            return ExecSql(sql, 0, ((lstParm == null || lstParm.Count == 0) ? null : lstParm.ToArray()));
        }

        /// <summary>
        /// 执行SQL带参数
        /// </summary> 
        /// <param name="sql"></param>
        /// <param name="objParams"></param>
        /// <returns></returns>
        int ExecSql(string sql, int step, params IDataParameter[] objParm)
        {
            SqlConnection con = new SqlConnection(this.DbConn);
            SqlCommand cmd = GetSqlCommand(con);
            int affectedRows = 0;

            try
            {
                cmd.Transaction = con.BeginTransaction();
                cmd.CommandText = GetParm(sql, step);
                if (objParm != null && objParm.Length > 0)
                {
                    for (int i = 0; i < objParm.Length; i++)
                    {
                        if (objParm[i].Value == null)
                        {
                            objParm[i].Value = System.DBNull.Value;
                        }
                        ((SqlParameter)objParm[i]).ParameterName = (i + 1 + step * 10).ToString();
                        cmd.Parameters.Add((SqlParameter)objParm[i]);
                    }
                }
                if (cmd.Connection.State == ConnectionState.Closed)
                {
                    cmd.Connection.Open();
                }
                affectedRows = cmd.ExecuteNonQuery();
                cmd.Transaction.Commit();
            }
            catch (System.Exception objEx)
            {
                cmd.Transaction.Rollback();
                affectedRows = -1;
                throw objEx;
            }
            finally
            {
                if (cmd != null)
                {
                    cmd.Connection.Close();
                    cmd.Dispose();
                }
            }
            return affectedRows;
        }
        #endregion

        #endregion

        #region SqlBulkCopy
        /// <summary>
        /// SqlBulkCopy
        /// </summary> 
        /// <param name="tables"></param>
        /// <returns></returns>
        public int SqlBulkCopy(List<DataTable> tables, out int succTableNums)
        {
            succTableNums = 0;
            int intAffectedRows = 0;
            using (TransactionScope ts = this.TransactionScope)
            {
                SqlConnection con = new SqlConnection(this.DbConn);
                SqlBulkCopy bulk = new SqlBulkCopy(con);
                try
                {
                    con.Open();
                    foreach (DataTable dt in tables)
                    {
                        bulk.DestinationTableName = dt.TableName;
                        bulk.BatchSize = dt.Rows.Count;
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            bulk.WriteToServer(dt);
                            intAffectedRows += dt.Rows.Count;
                            Log.Output(string.Format("sql bulk cope write : tablename = {0}, rows = {1} 。", dt.TableName, dt.Rows.Count));
                            succTableNums++;
                        }
                    }
                    ts.Complete();
                }
                catch (System.Exception ex)
                {
                    Log.Output(bulk.DestinationTableName + System.Environment.NewLine + ex.Message);
                    intAffectedRows = -1;
                    throw ex;
                }
                finally
                {
                    if (con != null)
                    {
                        con.Close();
                        if (bulk != null)
                        {
                            bulk.Close();
                        }
                        con.Dispose();
                    }
                }
            }
            return intAffectedRows;
        }
        #endregion
    }

    public class OraHelper
    {
        #region OraHelper
        /// <summary>
        /// OraHelper
        /// </summary>
        /// <param name="_dbConn"></param>
        public OraHelper(string _dbConn)
        {
            this.DbConn = _dbConn;
        }
        #endregion

        #region 变量.属性

        /// <summary>
        /// 数据库连接参数
        /// </summary>
        string DbConn { get; set; }

        #endregion

        #region CreateParm
        /// <summary>
        /// 创建SQL参数
        /// </summary>
        /// <returns></returns>
        public IDataParameter CreateParm(object value)
        {
            return CreateParm(1, new List<object> { value })[0];
        }

        /// <summary>
        /// 创建SQL参数
        /// </summary>
        /// <returns></returns>
        public IDataParameter[] CreateParm(int nums, List<object> lstValues)
        {
            IDataParameter[] objParm = new OracleParameter[nums];
            for (int i = 0; i < nums; i++)
            {
                objParm[i] = new OracleParameter();
                objParm[i].Value = lstValues[i];
            }
            return objParm;
        }
        #endregion

        #region 获取绑定参数
        /// <summary>
        /// 获取绑定参数
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        string GetParam(string sql)
        {
            int intPara = 1;
            for (int idx = sql.IndexOf("?"); idx > 0; idx = sql.IndexOf("?"))
            {
                sql = sql.Substring(0, idx) + ":" + (intPara++) + sql.Substring(idx + 1, sql.Length - idx - 1);
            }
            Log.Output(sql);
            return sql;
        }

        /// <summary>
        /// 获取绑定参数
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="loop"></param>
        /// <returns></returns>
        string GetParam(string sql, int loop)
        {
            int intPara = 1;
            for (int idx = sql.IndexOf("?"); idx > 0; idx = sql.IndexOf("?"))
            {
                sql = sql.Substring(0, idx) + ":" + loop.ToString() + (intPara++) + sql.Substring(idx + 1, sql.Length - idx - 1);
            }
            Log.Output(sql);
            return sql;
        }
        #endregion

        #region SqlCommand
        /// <summary>
        /// SqlCommand
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        internal OracleCommand GetSqlCommand()
        {
            OracleConnection con = new OracleConnection(this.DbConn);
            OracleCommand cmd = new OracleCommand();
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandTimeout = 3000;
            return cmd;
        }
        #endregion

        #region 获取DataTable 

        /// <summary>
        /// 获取DataTable带参数
        /// </summary>
        /// <param name="conn"></param>
        /// <param name="sql"></param>
        /// <param name="objParams"></param>
        /// <returns></returns>
        public DataTable GetDataTable(string sql)
        {
            return GetDataTable(sql, null);
        }

        /// <summary>
        /// 获取DataTable带参数
        /// </summary>
        /// <param name="conn"></param>
        /// <param name="sql"></param>
        /// <param name="dtRecord"></param>
        /// <param name="objParams"></param>
        /// <returns></returns>
        public DataTable GetDataTable(string sql, params IDataParameter[] objParams)
        {
            OracleCommand cmd = GetSqlCommand();
            DataTable dtRecord = null;
            try
            {
                cmd.CommandText = GetParam(sql);
                if (objParams != null && objParams.Length > 0)
                {
                    for (int i = 0; i < objParams.Length; i++)
                    {
                        if (objParams[i].Value == null)
                        {
                            objParams[i].Value = System.DBNull.Value;
                        }
                        ((OracleParameter)objParams[i]).ParameterName = (i + 1).ToString();
                        cmd.Parameters.Add((OracleParameter)objParams[i]);
                    }
                }
                OracleDataReader oraReader = cmd.ExecuteReader();
                dtRecord = new DataTable();
                dtRecord.Load(oraReader);
                oraReader.Close();
                for (int i = 0; i < dtRecord.Columns.Count; i++)
                {
                    dtRecord.Columns[i].ColumnName = dtRecord.Columns[i].ColumnName.ToLower();
                }
            }
            catch (System.Exception ex)
            {
                Log.Output(ex.Message);
                throw ex;
            }
            finally
            {
                if (cmd != null)
                {
                    cmd.Connection.Close();
                    cmd.Dispose();
                }
            }
            return dtRecord;
        }
        #endregion
    }
}
