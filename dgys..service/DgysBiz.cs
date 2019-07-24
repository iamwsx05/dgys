using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;

namespace Dgys.Service
{
    /// <summary>
    /// 业务类
    /// </summary>
    public class DgysBiz
    {
        #region 变量.属性

        #region 数据库连接参数
        /// <summary>
        /// 数据库连接参数.SQL Server
        /// </summary>
        string DBConnSql
        {
            get { return ConfigurationManager.AppSettings["dbConnSql"].ToString(); }
        }
        /// <summary>
        /// 数据库连接参数.Oracle
        /// </summary>
        string DBConnOra
        {
            get { return ConfigurationManager.AppSettings["dbConnOra"].ToString(); }
        }
        #endregion

        #endregion

        #region 方法

        #region 获取表结构
        /// <summary>
        /// 获取表结构
        /// </summary> 
        /// <param name="tableName"></param>
        /// <returns></returns>
        DataTable GetTableStruct(string tableName)
        {
            DataTable dtStruct = (new SqlHelper(this.DBConnSql)).GetDataTable(string.Format("select * from {0} where 1 <> 1", tableName));
            dtStruct.TableName = tableName;
            Log.Output("import: " + tableName);
            return dtStruct;
        }
        #endregion

        #region 获取列名数组
        /// <summary>
        /// 获取列名数组
        /// </summary>
        /// <param name="dtSource"></param>
        /// <returns></returns>
        List<string> GetColumnNames(DataTable dtSource)
        {
            List<string> lstColNames = new List<string>();
            foreach (DataColumn col in dtSource.Columns)
            {
                lstColNames.Add(col.ColumnName);
            }
            return lstColNames;
        }
        #endregion

        #region 生成数据
        /// <summary>
        /// 生成数据
        /// </summary>
        public void TransDataService(string transDate)
        {
            Log.Output("Data Trans beginning ...");
            // 第一阶段
            //TransDataStage1(transDate);
            // 休息3秒
            System.Threading.Thread.Sleep(3000);
            // 第二阶段
            TransDataStage2(transDate);
            Log.Output("Data Trans end .");
        }
        #endregion

        #region 计算年龄
        /// <summary>
        /// 计算年龄
        /// </summary>
        /// <param name="dtmBirth"></param>
        /// <returns></returns>
        string BrithdayToAge(DateTime dtmBirth)
        {
            string age = string.Empty;
            DateTime datNow = DateTime.Now;
            int years = datNow.Year - dtmBirth.Year;
            int months = datNow.Month - dtmBirth.Month;
            int days = datNow.Day - dtmBirth.Day;
            int hours = datNow.Hour - dtmBirth.Hour;
            int minutes = datNow.Minute - dtmBirth.Minute;

            TimeSpan compare = datNow.Date - dtmBirth.Date;

            if (minutes < 0)
            {
                hours--;
                minutes += 60;
            }

            if (hours < 0)
            {
                days--;
                hours += 24;
            }

            if (days < 0)
            {
                months--;
                days += 30;
            }

            if (months < 0)
            {
                years--;
                months += 12;
            }

            if (years >= 15)
            {
                age = years.ToString() + "岁";
            }
            else if (years >= 1)
            {
                age = years.ToString() + "岁" + months.ToString() + "月";
            }
            else if (months >= 1)
            {
                age = months.ToString() + "月" + days.ToString() + "天";
            }
            else if (days >= 1)
            {
                age = compare.Days.ToString() + "天" + hours.ToString() + "小时";
            }
            else if (hours >= 1)
            {
                age = hours.ToString() + "小时" + minutes.ToString() + "分钟";
            }
            else
            {
                age = minutes.ToString() + "分钟";
            }
            return age;
        }
        #endregion

        #region ConvertToInt
        /// <summary>
        /// ConvertToInt
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        int ConvertToInt(object obj)
        {
            int i = 0;
            if (int.TryParse(obj.ToString(), out i))
                return i;
            else
                return 0;
        }
        /// <summary>
        /// ConvertToInt
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        int ConvertToInt(string str)
        {
            int i = 0;
            if (int.TryParse(str, out i))
                return i;
            else
                return 0;
        }
        #endregion

        #region ConvertToDecimal
        /// <summary>
        /// ConvertToDecimal
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        decimal ConvertToDecimal(object obj)
        {
            decimal dec = 0;
            if (decimal.TryParse(obj.ToString(), out dec))
                return dec;
            else
                return 0;
        }
        /// <summary>
        /// ConvertToDecimal
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        decimal ConvertToDecimal(string str)
        {
            decimal dec = 0;
            if (decimal.TryParse(str, out dec))
                return dec;
            else
                return 0;
        }
        #endregion

        #region ConvertToValue
        /// <summary>
        /// ConvertToValue
        /// </summary>
        /// <param name="dtSource"></param>
        /// <param name="colName"></param>
        /// <param name="obj"></param>
        /// <returns></returns>
        object ConvertToValue(DataTable dtSource, string colName, object obj)
        {
            if (obj == null)
            {
                return " ";
            }
            else
            {
                if (dtSource.Columns[colName].DataType == typeof(string))
                {
                    return obj.ToString().Trim();
                }
                else
                {
                    return obj;
                }
            }
        }
        #endregion

        #region 第一阶段
        /// <summary>
        /// 第一阶段
        /// </summary>
        /// <param name="transDate"></param>
        /// <returns></returns>
        bool TransDataStage1(string transDate)
        {
            SqlHelper sqlSvc = null;
            OraHelper oraSvc = null;

            try
            {
                #region 变量

                string Sql = string.Empty;
                string tableName = string.Empty;
                DataTable dtTemp = null;
                DataRow drData = null;
                DataTable dtData = null;
                string yptym = string.Empty;
                // 医院编码
                string hospitalNo = ConfigurationManager.AppSettings["hospitalNo"].ToString();
                List<string> lstColNames = new List<string>();
                List<DataTable> lstCommitDt = new List<DataTable>();
                DateTime dtmNow = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                sqlSvc = new SqlHelper(this.DBConnSql);
                oraSvc = new OraHelper(this.DBConnOra);
                #endregion

                #region 药品信息

                tableName = "mid_product";
                dtData = this.GetTableStruct(tableName);
                try
                {
                    Sql = @"select a.assistcode_chr as ypbm,
                                   nvl(a.mednormalname_vchr, '') as yptym,
                                   nvl(a.medspec_vchr, '') as bzgg,
                                   --nvl(a.productorid_chr, '') as scqy,
                                   nvl(a.opunit_chr, '') as bzdw
                              from t_bse_medicine a
                             inner join t_aid_medicinetype b
                                on a.medicinetypeid_chr = b.medicinetypeid_chr
                             where a.deleted_int = 0
                               and a.ifstop_int = 0
                               and b.medicinetypeid_chr in (2, 6)";

                    dtTemp = oraSvc.GetDataTable(Sql);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from {0}", tableName);
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            yptym = drData["yptym"].ToString().Replace("", "");//去掉特殊字符 （US）
                            if (drData["yptym"].ToString().StartsWith("***"))
                                continue;
                            drData["yptym"] = yptym;
                            drData["yybm"] = hospitalNo;
                            drData["scqy"] = "空";
                            drData["create_time"] = dtmNow;
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 库存信息
                tableName = "mid_inventory";
                dtData = this.GetTableStruct(tableName);
                try
                {
                    //Sql = @"select distinct nvl(c.code_vchr, '') as kfbm,
                    //               b.assistcode_chr as ypbm,
                    //               nvl(b.permitno_vchr, '') as scph,
                    //               '' as scrq,
                    //               nvl(a.validperiod_dat, '') as yxrq,
                    //               sum(nvl(a.oprealgross_int, 0)) as kcsl,
                    //               nvl(a.opunit_chr, '') as kcdw
                    //          from t_ds_storage_detail a
                    //         inner join t_bse_medicine b
                    //            on a.medicineid_chr = b.medicineid_chr
                    //           and b.deleted_int = 0
                    //         inner join t_bse_deptdesc c
                    //            on a.drugstoreid_chr = c.deptid_chr
                    //         where a.status = 1 and b.medicinetypeid_chr in (1, 2, 6)
                    //         group by c.code_vchr,
                    //                  b.assistcode_chr,
                    //                  b.permitno_vchr,
                    //                  a.validperiod_dat,
                    //                  a.opunit_chr";
                    Sql = @"select distinct b.storageid_chr as kfbm,
                                            c.assistcode_chr as ypbm,
                                                  case
                                                     when b.lotno_vchr = 'UNKNOWN' then
                                                      ''
                                                     else
                                                      b.lotno_vchr
                                                   end scph ,
                                                   nvl(b.producedate_dat, '') as scrq,
                                                   nvl(b.validperiod_dat, '') as yxrq,
                                                   sum(nvl(b.realgross_int, 0)) as kcsl,
                                                   nvl(c.opunit_chr, '') as kcdw
                                              from t_ms_storage_detail b
                                             inner join t_bse_medicine c
                                                on b.medicineid_chr = c.medicineid_chr
                                             where (b.storageid_chr = '0001')
                                               and (b.status = 1)
                                                and c.deleted_int = 0
                                                and c.ifstop_int = 0
                                                and b.realgross_int > 0
                                               and c.medicinetypeid_chr in (2,6)
                                               group by b.storageid_chr,c.assistcode_chr,b.lotno_vchr,
                                               b.producedate_dat,b.validperiod_dat,c.opunit_chr
                                             order by c.assistcode_chr asc ";

                    dtTemp = oraSvc.GetDataTable(Sql);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from {0}", tableName);
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                if (colName == "yxrq" || colName == "scrq")
                                    drData[colName] = dr[colName] == DBNull.Value ? "" : Convert.ToDateTime(dr[colName]).ToString("yyyy-MM-dd");
                                else
                                    drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);

                                if (colName == "scph")
                                    drData[colName] = dr[colName] == DBNull.Value ? "" : dr[colName].ToString();
                            }

                            if (drData["ypbm"].ToString().StartsWith("*") || drData["scph"].ToString().StartsWith("*"))
                                continue;

                            drData["yybm"] = hospitalNo;
                            drData["create_time"] = dtmNow;
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output("mid_inventory-->" + ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 药品每日用量
                tableName = "mid_drugs_consumption";
                dtData = this.GetTableStruct(tableName);
                try
                {
                    //Sql = @"select distinct nvl(c.code_vchr, '') as kfbm,
                    //               d.assistcode_chr as ypbm,
                    //               sum(b.opamount_int) as sysl,
                    //               nvl(b.opunit_chr, '') as jldw
                    //          from t_ds_outstorage a
                    //         inner join t_ds_outstorage_detail b
                    //            on a.seriesid_int = b.seriesid2_int
                    //           and b.status = 1
                    //         inner join t_bse_deptdesc c
                    //            on a.drugstoreid_chr = c.deptid_chr
                    //         inner join t_bse_medicine d
                    //            on b.medicineid_chr = d.medicineid_chr
                    //         where a.status_int > 0
                    //           and (a.makeorder_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and
                    //               to_date(?, 'yyyy-mm-dd hh24:mi:ss'))
                    //         group by c.code_vchr, d.assistcode_chr, b.opunit_chr";
                    Sql = @"select distinct d.storageid_chr as kfbm,
                                            c.assistcode_chr as ypbm,
                                            sum(nvl(b.netamount_int, 0)) as sysl,
                                            nvl(c.opunit_chr, '') as jldw,
                                            nvl(d.askdate_dat, '') as tjzq
                              from t_ms_outstorage_detail b
                             inner join t_bse_medicine c
                                on b.medicineid_chr = c.medicineid_chr
                              left join t_ms_outstorage d
                                on b.seriesid_int = d.seriesid_int
                             where (d.storageid_chr = '0001')
                               and (b.status = 1)
                               and c.deleted_int = 0
                               and c.ifstop_int = 0
                               and b.netamount_int > 0
                               and c.medicinetypeid_chr in (2, 6)
                               and (d.askdate_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and
                                   to_date(?, 'yyyy-mm-dd hh24:mi:ss'))
                             group by d.storageid_chr,
                                      c.assistcode_chr,
                                      b.netamount_int,
                                      c.opunit_chr,
                                      d.askdate_dat
                             order by c.assistcode_chr asc";

                    IDataParameter[] parms = oraSvc.CreateParm(2, new List<object>() { "2019-07-01" + " 00:00:00", DateTime.Now.ToString("yyyy-MM-dd") + " 23:59:59" });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from {0}", tableName);
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                if (colName == "tjzq")
                                    drData[colName] = dr[colName] == DBNull.Value ? "" : Convert.ToDateTime(dr[colName]).ToString("yyyy-MM-dd");
                                else
                                    drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            drData["yybm"] = hospitalNo;
                            //drData["tjzq"] = transDate;
                            drData["create_time"] = dtmNow;
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 统一提交

                int succTableNums = 0;
                int ret = sqlSvc.SqlBulkCopy(lstCommitDt, out succTableNums);
                Log.Output(string.Format("update tables: request {0} , input {1} , sucess {2} .", 3, lstCommitDt.Count, succTableNums));

                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                return true;
            }
            catch (Exception ex)
            {
                Log.Output(ex.Message);
            }
            finally
            {
                oraSvc = null;
                sqlSvc = null;
            }
            return false;
        }
        #endregion

        #region 第二阶段
        /// <summary>
        /// 第二阶段
        /// </summary>
        /// <param name="transDate"></param>
        /// <returns></returns>
        bool TransDataStage2(string transDate)
        {
            SqlHelper sqlSvc = null;
            OraHelper oraSvc = null;

            try
            {
                #region 变量

                string Sql = string.Empty;
                string tableName = string.Empty;
                DataTable dtTemp = null;
                DataRow drData = null;
                DataTable dtData = null;

                // 医院编码
                string hospitalNo = ConfigurationManager.AppSettings["hospitalNo"].ToString();
                List<string> lstColNames = new List<string>();
                List<DataTable> lstCommitDt = new List<DataTable>();
                DateTime dtmNow = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                sqlSvc = new SqlHelper(this.DBConnSql);
                oraSvc = new OraHelper(this.DBConnOra);
                IDataParameter[] parms = null;
                #endregion


                #region 住院记录信息

                dtData = this.GetTableStruct("his_eng_order");
                try
                {
                    Sql = @"select distinct 
                                    a.registerid_chr as order_id,
                                   b.sex_chr as sex,
                                   c.paytypename_vchr as pay_type,
                                   a.patientid_chr as patient_no,
                                   '' as ssid,
                                   b.lastname_vchr as name,
                                   b.contactpersonaddress_vchr as address,
                                   b.homephone_vchr as phone_no,
                                   b.idcard_chr as id_card,
                                   '' as height,
                                   '' as weight,
                                   '' as birth_weight,
                                   b.allergicdesc_vchr as allergy_list,
                                   '否' as pregnancy,
                                   0 as time_of_preg,
                                   '否' as breast_feeding,
                                   to_char(b.birth_dat, 'yyyy-mm-dd') as birthday,
                                   b.married_chr as marital,
                                   b.occupation_vchr as occpation,
                                   b.nationality_vchr as natonality,
                                   a.inpatientcount_int as entry_time,
                                   to_char(a.inpatient_dat, 'yyyy-mm-dd hh24:mi:ss') as in_date,
                                   d1.code_vchr as in_depart_id,
                                   d1.deptname_vchr as in_department,
                                   d2.code_vchr as in_area,
                                   to_char(e.outhospital_dat, 'yyyy-mm-dd hh24:mi:ss') as out_date,
                                   d3.code_vchr as out_depart_id,
                                   d3.deptname_vchr as out_department,
                                   '' as doc_group,
                                   '' as dept_group,
                                   d4.deptname_vchr as out_area
                              from t_opr_bih_register a
                             inner join t_opr_bih_registerdetail b
                                on a.registerid_chr = b.registerid_chr
                             inner join t_bse_patientpaytype c
                                on a.paytypeid_chr = c.paytypeid_chr
                             inner join t_bse_deptdesc d1
                                on a.deptid_chr = d1.deptid_chr
                             inner join t_bse_deptdesc d2
                                on a.areaid_chr = d2.deptid_chr
                             inner join t_opr_bih_leave e
                                on a.registerid_chr = e.registerid_chr
                             inner join t_bse_deptdesc d3
                                on e.outdeptid_chr = d3.deptid_chr
                             inner join t_bse_deptdesc d4
                                on e.outareaid_chr = d4.deptid_chr
                             where e.status_int = 1
                               and e.pstatus_int = 1
                               and (e.outhospital_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and
                                   to_date(?, 'yyyy-mm-dd hh24:mi:ss'))";

                    parms = oraSvc.CreateParm(2, new List<object>() { transDate + " 00:00:00", transDate + " 23:59:59" });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_eng_order where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            drData["org_code"] = hospitalNo;
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion


                #region 住院患者费用结算表

                dtData = this.GetTableStruct("his_eng_order_cost");
                try
                {
                    Sql = @"select 
                                    a.registerid_chr as order_id,
                                   d.totalsum_mny   as amount,
                                   f.typeid_chr     as typecode,
                                   f.typename_vchr  as typename
                              from t_opr_bih_register a
                             inner join t_opr_bih_leave e
                                on a.registerid_chr = e.registerid_chr
                             inner join t_opr_bih_charge b
                                on a.registerid_chr = b.registerid_chr
                             inner join t_opr_bih_chargedefinv c
                                on b.chargeno_chr = c.chargeno_chr
                             inner join t_opr_bih_invoice2de d
                                on c.invoiceno_vchr = d.invoiceno_vchr
                             inner join t_bse_chargeitemextype f
                                on d.itemcatid_chr = f.typeid_chr
                               and f.flag_int = 4
                             where e.status_int = 1
                               and e.pstatus_int = 1
                               and a.status_int = 1
                               and (e.outhospital_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and
                                   to_date(?, 'yyyy-mm-dd hh24:mi:ss'))
                          order by a.registerid_chr";

                    parms = oraSvc.CreateParm(2, new List<object>() { transDate + " 00:00:00", transDate + " 23:59:59" });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        string catCode = string.Empty;
                        decimal amount = 0;
                        EntityOrderCost vo = null;
                        List<EntityOrderCost> lstOrderCost = new List<EntityOrderCost>();
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            vo = new EntityOrderCost();
                            vo.order_id = dr["order_id"].ToString();

                            catCode = dr["typecode"].ToString();
                            amount = ConvertToDecimal(dr["amount"].ToString());
                            switch (catCode)
                            {
                                case "3009":    // X光费
                                    vo.radio_fee = amount;
                                    break;
                                case "3011":    // B超费
                                    vo.check_fee = amount;
                                    break;
                                case "3021":    // 心脑电图费
                                    vo.check_fee = amount;
                                    break;
                                case "3024":    // 检查费
                                    vo.check_fee = amount;
                                    break;
                                case "3025":    // 治疗费
                                    vo.treat_fee = amount;
                                    break;
                                case "3023":    // 护理费
                                    vo.nurse_fee = amount;
                                    break;
                                case "3022":    // 手术费
                                    vo.operation_fee = amount;
                                    break;
                                case "3001":    // 检验费
                                    vo.exam_fee = amount;
                                    break;
                                case "3006":    // 其他费
                                    vo.other_fee = amount;
                                    break;
                                case "3007":    // 放射费
                                    vo.radio_fee = amount;
                                    break;
                                case "3008":    // 西药费
                                    vo.wm_fee = amount;
                                    break;
                                case "3010":    // 中成药费
                                    vo.cpd_fee = amount;
                                    break;
                                case "3012":    // 中草药费
                                    vo.cmh_fee = amount;
                                    break;
                                case "3013":    // 输血费
                                    vo.blood_fee = amount;
                                    break;
                                case "3015":    // 床位费
                                    vo.bed_fee = amount;
                                    break;
                                case "3003":    // MRI费
                                    vo.radio_fee = amount;
                                    break;
                                case "3002":    // CT费
                                    vo.radio_fee = amount;
                                    break;
                                case "3016":    // 诊金
                                    vo.other_fee = amount;
                                    break;
                                case "3017":    // 输氧费
                                    vo.oxy_fee = amount;
                                    break;
                                case "3018":    // 特需服务
                                    vo.other_fee = amount;
                                    break;
                                case "3019":    // 材料费
                                    vo.other_fee = amount;
                                    break;
                                case "3020":    // 麻醉费
                                    vo.anesth_fee = amount;
                                    break;
                                case "3026":    // 药品让利
                                    vo.other_fee = amount;
                                    break;
                                default:
                                    vo.other_fee = amount;
                                    break;
                            }
                            vo.total_fee = amount;
                            if (lstOrderCost.Any(t => t.order_id == vo.order_id))
                            {
                                EntityOrderCost tmpVo = lstOrderCost.FirstOrDefault(t => t.order_id == vo.order_id);
                                tmpVo.bed_fee += vo.bed_fee;
                                tmpVo.nurse_fee += vo.nurse_fee;
                                tmpVo.wm_fee += vo.wm_fee;
                                tmpVo.cpd_fee += vo.cpd_fee;
                                tmpVo.cmh_fee += vo.cmh_fee;
                                tmpVo.radio_fee += vo.radio_fee;
                                tmpVo.exam_fee += vo.exam_fee;
                                tmpVo.oxy_fee += vo.oxy_fee;
                                tmpVo.blood_fee += vo.blood_fee;
                                tmpVo.operation_fee += vo.operation_fee;
                                tmpVo.check_fee += vo.check_fee;
                                tmpVo.anesth_fee += vo.anesth_fee;
                                tmpVo.treat_fee += vo.treat_fee;
                                tmpVo.other_fee += vo.other_fee;
                                tmpVo.total_fee += vo.total_fee;
                            }
                            else
                            {
                                lstOrderCost.Add(vo);
                            }
                        }

                        Sql = string.Format("delete from his_eng_order_cost where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtData);
                        foreach (EntityOrderCost item in lstOrderCost)
                        {
                            foreach (string colName in lstColNames)
                            {
                                if (colName.ToLower() == "org_code")
                                {
                                    drData[colName] = hospitalNo;
                                }
                                else
                                {
                                    switch (colName.ToLower())
                                    {
                                        case "order_id":
                                            drData[colName] = item.order_id;
                                            break;
                                        case "bed_fee":
                                            drData[colName] = item.bed_fee;
                                            break;
                                        case "nurse_fee":
                                            drData[colName] = item.nurse_fee;
                                            break;
                                        case "wm_fee":
                                            drData[colName] = item.wm_fee;
                                            break;
                                        case "cpd_fee":
                                            drData[colName] = item.cpd_fee;
                                            break;
                                        case "cmh_fee":
                                            drData[colName] = item.cmh_fee;
                                            break;
                                        case "radio_fee":
                                            drData[colName] = item.radio_fee;
                                            break;
                                        case "exam_fee":
                                            drData[colName] = item.exam_fee;
                                            break;
                                        case "oxy_fee":
                                            drData[colName] = item.oxy_fee;
                                            break;
                                        case "blood_fee":
                                            drData[colName] = item.blood_fee;
                                            break;
                                        case "operation_fee":
                                            drData[colName] = item.operation_fee;
                                            break;
                                        case "check_fee":
                                            drData[colName] = item.check_fee;
                                            break;
                                        case "anesth_fee":
                                            drData[colName] = item.anesth_fee;
                                            break;
                                        case "treat_fee":
                                            drData[colName] = item.treat_fee;
                                            break;
                                        case "other_fee":
                                            drData[colName] = item.other_fee;
                                            break;
                                        case "total_fee":
                                            drData[colName] = item.total_fee;
                                            break;
                                        default:
                                            break;
                                    }
                                }
                            }

                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));

                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion


                #region 住院患者感染及病理信息 -- 提供抢救次数、病理

                dtData = this.GetTableStruct("his_eng_order_infection");
                try
                {
                    EntityPathologic voPathogic = null;
                    List<EntityPathologic> lstPathogic = new List<EntityPathologic>();

                    Sql = @"select a.registerid_chr as order_id, d.salvetimes, d.salvesuccess
                              from t_opr_bih_register a
                             inner join t_opr_bih_leave e
                                on a.registerid_chr = e.registerid_chr
                             inner join t_bse_hisemr_relation c
                                on a.registerid_chr = c.registerid_chr
                             inner join inhospitalmainrecord_content d
                                on c.emrinpatientid = d.inpatientid
                               and c.emrinpatientdate = d.inpatientdate
                             where e.status_int = 1
                               and e.pstatus_int = 1
                               and a.status_int = 1
                               and d.status = 1
                               and (e.outhospital_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and
                                   to_date(?, 'yyyy-mm-dd hh24:mi:ss'))
                             order by a.registerid_chr";

                    parms = oraSvc.CreateParm(2, new List<object>() { transDate + " 00:00:00", transDate + " 23:59:59" });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            lstPathogic.Add(new EntityPathologic()
                            {
                                order_id = dr["order_id"].ToString(),
                                rescue_times = (dr["salvetimes"] == DBNull.Value || dr["salvetimes"].ToString().Trim() == "" ? 0 : ConvertToInt(dr["salvetimes"].ToString())),
                                rescue_succ_times = (dr["salvesuccess"] == DBNull.Value || dr["salvesuccess"].ToString().Trim() == "" ? 0 : ConvertToInt(dr["salvesuccess"].ToString()))
                            });
                        }
                    }

                    Sql = @"select a.registerid_chr as order_id, c.patientcardid_chr as cardno
                              from t_opr_bih_register a
                             inner join t_opr_bih_leave e
                                on a.registerid_chr = e.registerid_chr
                             inner join t_bse_patientcard c
                                on a.patientid_chr = c.patientid_chr
                             where e.status_int = 1
                               and e.pstatus_int = 1
                               and a.status_int = 1
                               and (e.outhospital_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and
                                   to_date(?, 'yyyy-mm-dd hh24:mi:ss'))
                             order by a.registerid_chr";

                    parms = oraSvc.CreateParm(2, new List<object>() { transDate + " 00:00:00", transDate + " 23:59:59" });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            voPathogic = new EntityPathologic() { order_id = dr["order_id"].ToString(), cardNo = "'" + dr["cardno"].ToString() + "'" };
                            if (lstPathogic.Any(t => t.order_id == voPathogic.order_id))
                            {
                                (lstPathogic.FirstOrDefault(t => t.order_id == voPathogic.order_id)).cardNo += ",'" + voPathogic.cardNo + "'";
                            }
                            else
                            {
                                lstPathogic.Add(voPathogic);
                            }
                        }
                        string connStrBl = ConfigurationManager.AppSettings["dbConnSqlBl"].ToString();
                        SqlHelper blSvc = new SqlHelper(connStrBl);
                        foreach (EntityPathologic item in lstPathogic)
                        {
                            if (string.IsNullOrEmpty(item.cardNo)) continue;

                            Sql = @"select distinct t.application_id_chr
                                      from t_opr_lis_sample t
                                     inner join t_bse_patientcard b
                                        on t.patientid_chr = b.patientid_chr
                                     where t.sampletype_vchr = '切片'
                                       and t.status_int > 0
                                       and b.patientcardid_chr = ?
                                    union all
                                    select to_char(t.appid) as application_id_chr
                                      from eafapplication t
                                     where t.cardno = ?
                                       and t.status = 1
                                       and t.classCode = '0005'";
                            parms = oraSvc.CreateParm(2, new List<object>() { item.cardNo, item.cardNo });
                            dtTemp = oraSvc.GetDataTable(Sql, parms);
                            if (dtTemp != null && dtTemp.Rows.Count > 0)
                            {
                                foreach (DataRow dr in dtTemp.Rows)
                                {
                                    item.applyId += "'" + dr["application_id_chr"].ToString() + "',";
                                }
                                item.applyId = item.applyId.TrimEnd(',');

                                Sql = @"select v.Applyid,
                                               v.Hospital_Number,
                                               v.Outpatient_Number,
                                               v.Patientid,
                                               v.PathologyID,
                                               v.ExamStatus,
                                               v.ExamSee,
                                               v.ExamResult,
                                               v.ReportDoctor,
                                               v.ReportImage,
                                               v.ReportTime as ExamTime
                                          from v_ViewToHIS v
                                         where v.Applyid in ({0})
                                           and v.ReportTime is not null
                                           and v.ExamStatus in ('已审核', '已打印', '已经发送')";
                                dtTemp = blSvc.GetDataTable(string.Format(Sql, item.applyId));
                                if (dtTemp != null && dtTemp.Rows.Count > 0)
                                {
                                    foreach (DataRow dr in dtTemp.Rows)
                                    {
                                        item.pathologicResult += "'" + dr["ExamResult"].ToString() + "',";
                                    }
                                    item.pathologicResult = item.pathologicResult.TrimEnd(',');
                                }
                            }
                        }
                    }
                    if (lstPathogic.Count > 0)
                    {
                        Sql = string.Format("delete from his_eng_order_infection where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        List<string> lstOrderId3 = new List<string>();
                        foreach (EntityPathologic item in lstPathogic)
                        {
                            if (lstOrderId3.IndexOf(item.order_id) >= 0)
                                continue;
                            else
                                lstOrderId3.Add(item.order_id);

                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            drData["org_code"] = hospitalNo;
                            drData["order_id"] = item.order_id;
                            drData["rescue_times"] = item.rescue_times;
                            drData["rescue_succ_times"] = item.rescue_succ_times;
                            drData["pathologic_diag"] = item.pathologicResult == null ? string.Empty : item.pathologicResult;
                            drData["hi_code"] = string.Empty;
                            drData["hi_name"] = string.Empty;
                            drData["hi_out_come"] = string.Empty;
                            drData["pathologic_name"] = string.Empty;
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 住院药嘱(药品部分)开具数据

                dtData = this.GetTableStruct("his_eng_order_drug");
                try
                {
                    Sql = @"select distinct b.orderid_chr as item_id,
                                            a.registerid_chr as order_id,
                                            a.patientid_chr as patient_no,
                                            d.lastname_vchr as patient_name,
                                            (case b.executetype_int
                                              when 1 then
                                               '长期'
                                              when 2 then
                                               '临时'
                                              when 3 then
                                               '出院带药'
                                            end) as type,
                                            b.startdate_dat as start_time,
                                            b.finishdate_dat as end_time,
                                            nvl(b.outgetmeddays_int, 1) as continue_day,
                                            b.createdate_dat as pres_date_time,
                                            b.recipeno_int as group_no,
                                            h.assistcode_chr as drug_id,
                                            (case
                                              when h.mednormalname_vchr is null then
                                               h.medicinename_vchr
                                              else
                                               h.mednormalname_vchr
                                            end) as drug_name,
                                            nvl(i.medicinepreptypename_vchr, '') as prep_form,
                                            nvl(b.spec_vchr, '') as spec_name,
                                            nvl(h.medicinename_vchr, '') as reg_name,
                                            nvl(h.productorid_chr, '') as manufacturer_name,
                                            b.dosetypename_chr as admin_route,
                                            b.dosage_dec as admin_dose,
                                            b.dosageunit_chr admin_dose_unit,
                                            b.execfreqname_chr as admin_frequency,
                                            '' as admin_method,
                                            (case
                                              when b.antiuse is null then
                                               ''
                                              when b.antiuse = 1 then
                                               '治疗'
                                              else
                                               '预防'
                                            end) as admin_goal,
                                            nvl(b.remark_vchr, '') as comments,
                                            j.empno_chr as doc_id,
                                            j.lastname_vchr as doc_name,
                                            j.technicalrank_chr as doc_title,
                                            k.code_vchr as pres_depart_id,
                                            k.deptname_vchr as pres_department
                              from t_opr_bih_register a
                             inner join t_opr_bih_order b
                                on a.registerid_chr = b.registerid_chr
                             inner join t_bih_opr_putmeddetail c
                                on b.orderid_chr = c.orderid_chr
                             inner join t_opr_bih_registerdetail d
                                on a.registerid_chr = d.registerid_chr
                             inner join t_opr_bih_orderchargedept f
                                on b.orderid_chr = f.orderid_chr
                             inner join t_bse_chargeitem g
                                on f.chargeitemid_chr = g.itemid_chr
                             inner join t_bse_medicine h
                                on g.itemsrcid_vchr = h.medicineid_chr
                              left join t_aid_medicinepreptype i
                                on h.medicinepreptype_chr = i.medicinepreptype_chr
                             inner join t_bse_employee j
                                on b.doctorid_chr = j.empid_chr
                             inner join t_bse_deptdesc k
                                on b.createareaid_chr = k.deptid_chr
                             inner join t_aid_medicinetype p
                                on h.medicinetypeid_chr = p.medicinetypeid_chr
                               and p.medicinetypeid_chr in (1, 2, 6, 7)
                             where a.status_int = 1
                               and (b.status_int = 2 or b.status_int = 6)
                               and c.status_int = 1
                               and c.isput_int = 1
                               and (b.createdate_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and
                                   to_date(?, 'yyyy-mm-dd hh24:mi:ss'))";

                    parms = oraSvc.CreateParm(2, new List<object>() { transDate + " 00:00:00", transDate + " 23:59:59" });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_eng_order_drug where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                if (colName == "start_time" || colName == "end_time" || colName == "pres_date_time")
                                {
                                    drData[colName] = dr[colName] == DBNull.Value ? "" : Convert.ToDateTime(dr[colName]).ToString("yyyy-MM-dd HH:mm:ss");
                                }
                                else
                                {
                                    drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                                }
                            }
                            if (dr["type"].ToString() == "长期")
                            {
                                if (dr["end_time"] == DBNull.Value)
                                    drData["continue_day"] = 1;
                                else
                                    drData["continue_day"] = (Convert.ToDateTime(Convert.ToDateTime(dr["end_time"]).ToShortDateString()).Subtract(Convert.ToDateTime(Convert.ToDateTime(dr["start_time"]).ToShortDateString()))).Days + 1;
                            }
                            drData["org_code"] = hospitalNo;
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 住院药嘱(药品部分)执行数据

                dtData = this.GetTableStruct("his_eng_order_drug_execute");
                try
                {
                    Sql = @"select distinct x.orderexecid_chr as item_exec_id,
                                   a.registerid_chr as order_id,
                                   b.orderid_chr as item_id,
                                   a.patientid_chr as patient_no,
                                   d.lastname_vchr as patient_name,
                                   (case b.executetype_int
                                     when 1 then
                                      '长期'
                                     when 2 then
                                      '临时'
                                     when 3 then
                                      '出院带药'
                                   end) as type,
                                   b.recipeno_int as group_no,
                                   h.assistcode_chr as drug_id,
                                   (case
                                         when h.mednormalname_vchr is null then
                                          h.medicinename_vchr
                                         else
                                          h.mednormalname_vchr
                                       end) as drug_name,
                                   nvl(i.medicinepreptypename_vchr, '') as prep_form,
                                   nvl(b.spec_vchr, '') as spec_name,
                                   nvl(h.productorid_chr, '') as manufacturer_name,
                                   b.dosetypename_chr as admin_route,
                                   b.dosage_dec as admin_dose,
                                   b.dosageunit_chr admin_dose_unit,
                                   b.execfreqname_chr as admin_frequency,
                                   '' as admin_method,
                                   (case
                                     when b.antiuse is null then
                                      ''
                                     when b.antiuse = 1 then
                                      '治疗'
                                     else
                                      '预防'
                                   end) as admin_goal,
                                   j.empno_chr as doc_id,
                                   j.lastname_vchr as doc_name,
                                   to_char(x.createdate_dat, 'yyyy-mm-dd hh24:mi:ss') as execute_time,
                                   k.code_vchr as execute_depart_id,
                                   k.deptname_vchr as execute_department,
                                   y.empno_chr as pharm_chk_id,
                                   y.lastname_vchr as pharm_chk_name
                              from t_opr_bih_register a
                             inner join t_opr_bih_order b
                                on a.registerid_chr = b.registerid_chr
                             inner join t_bih_opr_putmeddetail c
                                on b.orderid_chr = c.orderid_chr
                             inner join t_opr_bih_registerdetail d
                                on a.registerid_chr = d.registerid_chr
                             inner join t_opr_bih_orderchargedept f
                                on b.orderid_chr = f.orderid_chr
                             inner join t_bse_chargeitem g
                                on f.chargeitemid_chr = g.itemid_chr
                             inner join t_bse_medicine h
                                on g.itemsrcid_vchr = h.medicineid_chr
                              left join t_aid_medicinepreptype i
                                on h.medicinepreptype_chr = i.medicinepreptype_chr
                             inner join t_bse_employee j
                                on b.doctorid_chr = j.empid_chr
                             inner join t_bse_deptdesc k
                                on b.createareaid_chr = k.deptid_chr
                             inner join t_opr_bih_orderexecute x
                                on b.orderid_chr = x.orderid_chr
                             inner join t_bse_employee y
                                on x.creatorid_chr = y.empid_chr
                             inner join t_aid_medicinetype p
                                on h.medicinetypeid_chr = p.medicinetypeid_chr
                               and p.medicinetypeid_chr in (1, 2, 6, 7)
                             where a.status_int = 1
                               and (b.status_int = 2 or b.status_int = 6)
                               and c.status_int = 1
                               and c.isput_int = 1
                               and x.status_int = 1
                               and (x.createdate_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and
                                   to_date(?, 'yyyy-mm-dd hh24:mi:ss'))";

                    parms = oraSvc.CreateParm(2, new List<object>() { transDate + " 00:00:00", transDate + " 23:59:59" });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_eng_order_drug_execute where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            drData["org_code"] = hospitalNo;
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 住院药嘱(药品部分)发送数据

                dtData = this.GetTableStruct("his_eng_order_drug_send");
                try
                {
                    Sql = @"select distinct c.putmeddetailid_chr as item_send_id,
                                   m.medstorename_vchr as dispense_store,
                                   a.registerid_chr as order_id,
                                   b.orderid_chr as item_id,
                                   (case b.executetype_int
                                     when 1 then
                                      '长期'
                                     when 2 then
                                      '临时'
                                     when 3 then
                                      '出院带药'
                                   end) as type,
                                   b.recipeno_int as group_no,
                                   a.patientid_chr as patient_no,
                                   d.lastname_vchr as patient_name,
                                   h.assistcode_chr as drug_id,
                                   (case
                                         when h.mednormalname_vchr is null then
                                          h.medicinename_vchr
                                         else
                                          h.mednormalname_vchr
                                       end) as drug_name,
                                   i.medicinepreptypename_vchr as prep_form,
                                   b.spec_vchr as spec_name,
                                   h.productorid_chr as manufacturer_name,
                                   c.get_dec as qty,
                                   nvl(c.unit_vchr,'') as qty_unit,
                                   c.dosage_dec as send_dose,
                                   c.dosageunit_vchr as send_unit,
                                   to_char(c.pubdate_dat, 'yyyy-mm-dd hh24:mi:ss') as send_date_time,
                                   '' as reduce_flag,
                                   round(c.unitprice_mny, 2) as unit_price,
                                   round(c.unitprice_mny * c.get_dec, 2) as amount,
                                   j.empno_chr as doc_id,
                                   j.lastname_vchr as doc_name,
                                   k.empno_chr as pharm_pre_id,
                                   k.lastname_vchr as pharm_pre_name,
                                   k.empno_chr as pharm_chk_id,
                                   k.lastname_vchr as pharm_chk_name
                              from t_opr_bih_register a
                             inner join t_opr_bih_order b
                                on a.registerid_chr = b.registerid_chr
                             inner join t_bih_opr_putmeddetail c
                                on b.orderid_chr = c.orderid_chr
                             inner join t_opr_bih_registerdetail d
                                on a.registerid_chr = d.registerid_chr
                             inner join t_opr_bih_orderchargedept f
                                on b.orderid_chr = f.orderid_chr
                             inner join t_bse_chargeitem g
                                on f.chargeitemid_chr = g.itemid_chr
                             inner join t_bse_medicine h
                                on g.itemsrcid_vchr = h.medicineid_chr
                              left join t_aid_medicinepreptype i
                                on h.medicinepreptype_chr = i.medicinepreptype_chr
                             inner join t_bse_employee j
                                on b.doctorid_chr = j.empid_chr
                             inner join t_bse_medstore m
                                on c.medstoreid_chr = m.medstoreid_chr
                             inner join t_bih_opr_putmedreq n
                                on c.putmedreqid_chr = n.putmedreqid_chr
                             inner join t_bse_employee k
                                on n.creator_chr = k.empid_chr
                             inner join t_aid_medicinetype p
                                on h.medicinetypeid_chr = p.medicinetypeid_chr
                               and p.medicinetypeid_chr in (1, 2, 6, 7)
                             where a.status_int = 1
                               and (b.status_int = 2 or b.status_int = 6)
                               and c.status_int = 1
                               and c.isput_int = 1
                               and (c.pubdate_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and
                                   to_date(?, 'yyyy-mm-dd hh24:mi:ss'))";

                    parms = oraSvc.CreateParm(2, new List<object>() { transDate + " 00:00:00", transDate + " 23:59:59" });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_eng_order_drug_send where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            drData["org_code"] = hospitalNo;
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 住院收费明细数据

                dtData = this.GetTableStruct("his_eng_order_fee_detail");
                try
                {
                    Sql = @"select distinct a.registerid_chr as order_id,
                                   b.pchargeid_chr as cost_id,
                                   (case
                                     when b.pchargeidorg_chr is null then
                                      '1'
                                     else
                                      '2'
                                   end) as pay_flag,
                                   nvl(b.orderid_chr, '') as order_item_id,
                                   a.patientid_chr as patient_no,
                                   c.lastname_vchr as patient_name,
                                   to_char(b.chargeactive_dat, 'yyyy-mm-dd hh24:mi:ss') as charge_time,
                                   nvl(x.typename_vchr, '') as item_type,
                                   (case
                                     when p.assistcode_chr is null then
                                      m.itemcode_vchr
                                     else
                                      p.assistcode_chr
                                   end) as item_code,
                                   b.chargeitemname_chr as item_name,
                                   b.amount_dec as item_qty,
                                   nvl(b.unit_vchr, '') as item_qty_unit,
                                   b.unitprice_dec as item_unit_price,
                                   round(b.unitprice_dec * b.amount_dec, 2) as item_amount,
                                   d.empno_chr as doc_id,
                                   d.lastname_vchr as doc_name,
                                   d1.code_vchr as depart_id,
                                   d1.deptname_vchr as department,
                                   nvl(d2.code_vchr, '') as execute_depart_id,
                                   nvl(d2.deptname_vchr, '') as execute_department
                              from t_opr_bih_register a
                             inner join t_opr_bih_patientcharge b
                                on a.registerid_chr = b.registerid_chr
                             inner join t_opr_bih_registerdetail c
                                on a.registerid_chr = c.registerid_chr
                             inner join t_bse_employee d
                                on b.chargedoctorid_chr = d.empid_chr
                             inner join t_bse_deptdesc d1
                                on b.createarea_chr = d1.deptid_chr
                             inner join t_bse_deptdesc d2
                                on b.clacarea_chr = d2.deptid_chr
                             inner join t_bse_chargeitem m
                                on b.chargeitemid_chr = m.itemid_chr
                              left join t_bse_medicine p
                                on m.itemsrcid_vchr = p.medicineid_chr
                              left join t_bse_chargeitemextype x
                                on m.itembihctype_chr = x.typeid_chr
                               and x.flag_int = 5
                             where a.status_int = 1
                               and (b.chargeactive_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and
                                   to_date(?, 'yyyy-mm-dd hh24:mi:ss'))
                             order by a.registerid_chr";

                    parms = oraSvc.CreateParm(2, new List<object>() { transDate + " 00:00:00", transDate + " 23:59:59" });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_eng_order_fee_detail where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            drData["org_code"] = hospitalNo;
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }

                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 住院患者诊断数据

                dtData = this.GetTableStruct("his_eng_order_diagnose");
                try
                {
                    Sql = @"select distinct a.registerid_chr as order_id,
                                   to_char(a.inpatient_dat, 'yyyy-mm-dd hh24:mi:ss') as diag_date,
                                   nvl(a.icd10diagtext_vchr, '') as diag_name,
                                   '在院' as diag_type,
                                   (case e.type_int
                                     when 1 then
                                      '治愈'
                                     when 2 then
                                      '转院'
                                     when 3 then
                                      '其它'
                                     when 4 then
                                      '死亡'
                                     when 5 then
                                      '好转'
                                     when 6 then
                                      '24小时死亡'
                                     else
                                      ''
                                   end) as dscharge_type,
                                   nvl(a.icd10diagid_vchr, '') as icd10
                              from t_opr_bih_register a
                             inner join t_opr_bih_leave e
                                on a.registerid_chr = e.registerid_chr
                             where e.status_int = 1
                               and e.pstatus_int = 1
                               and (e.outhospital_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and
                                   to_date(?, 'yyyy-mm-dd hh24:mi:ss'))";

                    parms = oraSvc.CreateParm(2, new List<object>() { transDate + " 00:00:00", transDate + " 23:59:59" });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_eng_order_diagnose where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            drData["org_code"] = hospitalNo;
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 手术医嘱

                dtData = this.GetTableStruct("his_eng_order_operation");
                try
                {
                    Sql = @"select distinct a.registerid_chr as order_id,
                                   '' as code,
                                   b.operationname_chr as name,
                                   to_char(b.operationdate_dat, 'yyyy-mm-dd hh24:mi:ss') as start_time,
                                   '' as end_time,
                                   b.incisionlev_chr as incision_type,
                                   '' as incision_status,
                                   '' as inplant
                              from t_opr_bih_register a
                             inner join t_ana_requisition b
                                on a.registerid_chr = b.registerid_chr
                             inner join t_opr_bih_leave e
                                on a.registerid_chr = e.registerid_chr
                             where e.status_int = 1
                               and e.pstatus_int = 1
                               and (e.outhospital_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and
                                   to_date(?, 'yyyy-mm-dd hh24:mi:ss'))";

                    parms = oraSvc.CreateParm(2, new List<object>() { transDate + " 00:00:00", transDate + " 23:59:59" });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_eng_order_operation where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            drData["org_code"] = hospitalNo;
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 住院检验结果

                dtData = this.GetTableStruct("his_eng_order_exam");
                try
                {
                    Sql = @"select distinct a.registerid_chr as order_id,
                                            t2.apply_unit_id_chr as lis_group_code,
                                            t2.apply_unit_name_vchr as lis_group_name,
                                            t0.check_item_id_chr as exam_item_id,
                                            t0.check_item_name_vchr as exam_item_name,
                                            t0.refrange_vchr as reference_range,
                                            t0.result_vchr as result,
                                            to_char(c.createdate_dat, 'yyyy-mm-dd hh24:mi:ss') as send_time,
                                            t0.abnormal_flag_chr as abnormal_indicator,
                                            to_char(t3.confirm_dat, 'yyyy-mm-dd hh24:mi:ss') as lis_time,
                                            a.patientid_chr as patient_no
                              from t_opr_bih_register a
                             inner join t_opr_bih_leave e
                                on a.registerid_chr = e.registerid_chr
                             inner join t_opr_bih_order c
                                on a.registerid_chr = c.registerid_chr
                               and (c.status_int = 2 or c.status_int = 6)
                             inner join t_opr_attachrelation d
                                on c.orderid_chr = d.sourceitemid_vchr
                               and d.sysfrom_int = 1
                             inner join t_opr_lis_sample f
                                on f.application_id_chr = d.attachid_vchr
                             inner join t_opr_lis_check_result t0
                                on t0.sample_id_chr = f.sample_id_chr
                               and t0.status_int > 0
                             inner join t_aid_lis_apply_unit_detail t1
                                on t0.check_item_id_chr = t1.check_item_id_chr
                             inner join t_aid_lis_apply_unit t2
                                on t1.apply_unit_id_chr = t2.apply_unit_id_chr
                             inner join t_opr_lis_app_report t3
                                on f.application_id_chr = t3.application_id_chr
                             where (c.status_int = 2 or c.status_int = 6)
                               and e.status_int = 1
                               and e.pstatus_int = 1
                               and f.patient_type_chr = '1'
                               and f.status_int = 6
                               and t3.status_int = 2
                               and (e.outhospital_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and to_date(?, 'yyyy-mm-dd hh24:mi:ss'))";

                    parms = oraSvc.CreateParm(2, new List<object>() { transDate + " 00:00:00", transDate + " 23:59:59" });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        EntityIpLisResult vo = null;
                        List<EntityIpLisResult> lstVo = new List<EntityIpLisResult>();

                        Sql = string.Format("delete from his_eng_order_exam where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            //vo = new EntityIpLisResult();
                            //vo.order_id = dr["order_id"].ToString();
                            //vo.lis_group_code = dr["lis_group_code"].ToString();
                            //vo.exam_item_id = dr["exam_item_id"].ToString();
                            //vo.lis_time = dr["lis_time"].ToString();
                            //if (lstVo.Any(t => t.order_id == vo.order_id && t.lis_group_code == vo.lis_group_code && t.exam_item_id == vo.exam_item_id && t.lis_time == vo.lis_time))
                            //{
                            //    continue;
                            //}
                            //else
                            //{
                            //    lstVo.Add(vo);
                            //}

                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            drData["org_code"] = hospitalNo;
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 挂号信息

                dtData = this.GetTableStruct("his_register");
                try
                {
                    Sql = @"select distinct c.patientcardid_chr || to_char(a.recorddate_dat, 'yyyymmdd') as visit_no,
                                   b.patientid_chr as patient_no,
                                   b.lastname_vchr as name,
                                   b.idcard_chr as id_card,
                                   d.code_vchr as depart_id,
                                   d.deptname_vchr as department,
                                   e.empno_chr as doc_id,
                                   e.lastname_vchr as doc_name,
                                   to_char(a.recorddate_dat, 'yyyy-mm-dd hh24:mi:ss') as reg_date
                              from t_opr_outpatientrecipe a
                             inner join t_bse_patient b
                                on a.patientid_chr = b.patientid_chr
                             inner join t_bse_patientcard c
                                on b.patientid_chr = c.patientid_chr
                             inner join t_bse_deptdesc d
                                on a.diagdept_chr = d.deptid_chr
                             inner join t_bse_employee e
                                on a.diagdr_chr = e.empid_chr
                             where (a.pstauts_int = -2 or a.pstauts_int = 2)        -- or a.pstauts_int = 4)
                               and a.recipeflag_int = 1
                               and (a.recorddate_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and to_date(?, 'yyyy-mm-dd hh24:mi:ss'))";

                    parms = oraSvc.CreateParm(2, new List<object>() { transDate + " 00:00:00", transDate + " 23:59:59" });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_register where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);

                        EntityOpRegister opRegVo = null;
                        List<EntityOpRegister> lstReg = new List<EntityOpRegister>();
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            drData["org_code"] = hospitalNo;
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));

                            opRegVo = new EntityOpRegister() { visit_no = drData["visit_no"].ToString(), depart_id = drData["depart_id"].ToString(), doc_id = drData["doc_id"].ToString() };
                            if (lstReg.Any(t => t.visit_no == opRegVo.visit_no && t.depart_id == opRegVo.depart_id && t.doc_id == opRegVo.doc_id))
                            {
                                continue;
                            }
                            else
                            {
                                lstReg.Add(opRegVo);
                            }
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 门诊处方

                dtData = this.GetTableStruct("his_eng_cf");
                try
                {
                    Sql = @"select a.outpatrecipeid_chr as cfid,
                                   d.patientcardid_chr || to_char(a.recorddate_dat, 'yyyymmdd') as visit_no,
                                   e.code_vchr as depart_id,
                                   e.deptname_vchr as department,
                                   '' as age,
                                   f.typename_vchr as pres_type,
                                   to_char(a.recorddate_dat, 'yyyy-mm-dd hh24:mi:ss') as pres_date_time,
                                   b.sex_chr as sex,
                                   g.paytypename_vchr as pay_type,
                                   a.patientid_chr as patient_no,
                                   a.outpatrecipeid_chr as pres_no,
                                   b.lastname_vchr as name,
                                   b.homeaddress_vchr as address,
                                   b.homephone_vchr as phone_no,
                                   b.idcard_chr as id_card,
                                   '' as height,
                                   (case
                                     when b.weight is null then
                                      ''
                                     else
                                      b.weight || 'cm'
                                   end) as weight,
                                   '' as birth_weight,
                                   '' as ccr,
                                   b.allergicdesc_vchr as allergy_list,
                                   c.diag_vchr as diagnose,
                                   '否' as pregnancy,
                                   0 as time_of_preg,
                                   '否' as breast_feeding,
                                   '否' as dialysis,
                                   '' as prox_name,
                                   '' prox_id_card,
                                   h.empno_chr as doc_id,
                                   h.lastname_vchr as doc_name,
                                   h.technicalrank_chr as doc_title,
                                   '' as dept_group,
                                   rm.recipesum as total_amount,
                                   (case a.diagdept_chr
                                     when '0000244' then
                                      '急诊'
                                     else
                                      '门诊'
                                   end) as pres_source,
                                   '' as corres_cf_presno,
                                   '2' as recipe_type,
                                   '*' as pharm_chk_id,
                                   '*' as pharm_chk_name,
                                   b.birth_dat
                              from t_opr_outpatientrecipe a
                             inner join t_bse_patient b
                                on a.patientid_chr = b.patientid_chr
                             inner join t_opr_outpatientcasehis c
                                on a.casehisid_chr = c.casehisid_chr
                             inner join t_bse_patientcard d
                                on a.patientid_chr = d.patientid_chr
                             inner join t_bse_deptdesc e
                                on a.diagdept_chr = e.deptid_chr
                             inner join t_aid_recipetype f
                                on a.type_int = f.type_int
                             inner join t_bse_patientpaytype g
                                on a.paytypeid_chr = g.paytypeid_chr
                             inner join t_bse_employee h
                                on a.diagdr_chr = h.empid_chr
                             inner join (select t1.outpatrecipeid_chr,
                                                sum(round(nvl(t2.unitprice_mny, 0) * nvl(t2.tolqty_dec, 0),
                                                          2) + round(nvl(t2.toldiffprice_mny, 0), 2)) recipesum
                                           from t_opr_outpatientrecipe t1
                                          inner join t_opr_outpatientpwmrecipede t2
                                             on t1.outpatrecipeid_chr = t2.outpatrecipeid_chr
                                          where t1.pstauts_int = 2
                                            and (t1.recorddate_dat between
                                                to_date(?, 'yyyy-mm-dd hh24:mi:ss') and to_date(?, 'yyyy-mm-dd hh24:mi:ss'))
                                          group by t1.outpatrecipeid_chr) rm
                                on a.outpatrecipeid_chr = rm.outpatrecipeid_chr
                             where (a.pstauts_int = -2 or a.pstauts_int = 2)
                               and (a.recorddate_dat between
                                   to_date(?, 'yyyy-mm-dd hh24:mi:ss') and to_date(?, 'yyyy-mm-dd hh24:mi:ss'))
                            union all
                            select a.outpatrecipeid_chr as cfid,
                                   d.patientcardid_chr || to_char(a.recorddate_dat, 'yyyymmdd') as visit_no,
                                   e.code_vchr as depart_id,
                                   e.deptname_vchr as department,
                                   '' as age,
                                   f.typename_vchr as pres_type,
                                   to_char(a.recorddate_dat, 'yyyy-mm-dd hh24:mi:ss') as pres_date_time,
                                   b.sex_chr as sex,
                                   g.paytypename_vchr as pay_type,
                                   a.patientid_chr as patient_no,
                                   a.outpatrecipeid_chr as pres_no,
                                   b.lastname_vchr as name,
                                   b.homeaddress_vchr as address,
                                   b.homephone_vchr as phone_no,
                                   b.idcard_chr as id_card,
                                   '' as height,
                                   (case
                                     when b.weight is null then
                                      ''
                                     else
                                      b.weight || 'cm'
                                   end) as weight,
                                   '' as birth_weight,
                                   '' as ccr,
                                   b.allergicdesc_vchr as allergy_list,
                                   c.diag_vchr as diagnose,
                                   '否' as pregnancy,
                                   0 as time_of_preg,
                                   '否' as breast_feeding,
                                   '否' as dialysis,
                                   '' as prox_name,
                                   '' prox_id_card,
                                   h.empno_chr as doc_id,
                                   h.lastname_vchr as doc_name,
                                   h.technicalrank_chr as doc_title,
                                   '' as dept_group,
                                   rm.recipesum as total_amount,
                                   (case a.diagdept_chr
                                     when '0000244' then
                                      '急诊'
                                     else
                                      '门诊'
                                   end) as pres_source,
                                   '' as corres_cf_presno,
                                   '1' as recipe_type,
                                   '*' as pharm_chk_id,
                                   '*' as pharm_chk_name,
                                   b.birth_dat
                              from t_opr_outpatientrecipe a
                             inner join t_bse_patient b
                                on a.patientid_chr = b.patientid_chr
                             inner join t_opr_outpatientcasehis c
                                on a.casehisid_chr = c.casehisid_chr
                             inner join t_bse_patientcard d
                                on a.patientid_chr = d.patientid_chr
                             inner join t_bse_deptdesc e
                                on a.diagdept_chr = e.deptid_chr
                             inner join t_aid_recipetype f
                                on a.type_int = f.type_int
                             inner join t_bse_patientpaytype g
                                on a.paytypeid_chr = g.paytypeid_chr
                             inner join t_bse_employee h
                                on a.diagdr_chr = h.empid_chr
                             inner join (select t1.outpatrecipeid_chr,
                                                sum(round(nvl(t2.unitprice_mny, 0) * nvl(t2.qty_dec * t2.times_int, 0),
                                                          2) + round(nvl(t2.toldiffprice_mny, 0), 2)) recipesum
                                           from t_opr_outpatientrecipe t1
                                          inner join t_opr_outpatientcmrecipede t2
                                             on t1.outpatrecipeid_chr = t2.outpatrecipeid_chr
                                          where t1.pstauts_int = 2
                                            and (t1.recorddate_dat between
                                                to_date(?, 'yyyy-mm-dd hh24:mi:ss') and to_date(?, 'yyyy-mm-dd hh24:mi:ss'))
                                          group by t1.outpatrecipeid_chr) rm
                                on a.outpatrecipeid_chr = rm.outpatrecipeid_chr
                             where (a.pstauts_int = -2 or a.pstauts_int = 2)
                               and (a.recorddate_dat between
                                   to_date(?, 'yyyy-mm-dd hh24:mi:ss') and to_date(?, 'yyyy-mm-dd hh24:mi:ss')) ";

                    parms = oraSvc.CreateParm(8, new List<object>() { transDate + " 00:00:00", transDate + " 23:59:59", transDate + " 00:00:00", transDate + " 23:59:59",
                                                                      transDate + " 00:00:00", transDate + " 23:59:59", transDate + " 00:00:00", transDate + " 23:59:59" });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_eng_cf where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        List<string> lstRecipeId = new List<string>();
                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                if (colName != "birth_dat")
                                {
                                    drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                                }
                            }
                            // 存在一张处方同时开了西药/中草药
                            if (lstRecipeId.IndexOf(dr["cfid"].ToString()) < 0)
                                lstRecipeId.Add(dr["cfid"].ToString());
                            else
                                continue;

                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            drData["org_code"] = hospitalNo;
                            if (dr["birth_dat"] != DBNull.Value)
                                drData["age"] = BrithdayToAge(Convert.ToDateTime(dr["birth_dat"]));
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 门诊处方明细

                dtData = this.GetTableStruct("his_eng_cf_item");
                try
                {
                    Sql = @"select b.outpatrecipedeid_chr as item_id,
                                   a.outpatrecipeid_chr as cfid,
                                   d.assistcode_chr as drug_id,
                                   (case
                                         when d.mednormalname_vchr is null then
                                          d.medicinename_vchr
                                         else
                                          d.mednormalname_vchr
                                       end) as drug_name,
                                   d.medicinename_vchr as reg_name,
                                   nvl(d.productorid_chr,'') as manufacturer_name,
                                   nvl(b.days_int,1) as continue_day,
                                   nvl(b.itemspec_vchr,'') as spec,
                                   nvl(b.tolqty_dec,0) as quantity,
                                   nvl(b.unitid_chr,'') as dispense_unit,
                                   nvl(b.unitprice_mny,0) as unit_price,
                                   round(b.tolqty_dec * b.unitprice_mny, 2) + round(nvl(b.toldiffprice_mny, 0), 2) as amount,
                                   nvl(b.rowno_chr,'') as group_no,
                                   '是' as first_use,
                                   nvl(i.medicinepreptypename_vchr, '') as prep_form,
                                   nvl(j.usagename_vchr,'') as admin_route,
                                   '' as admin_area,
                                   nvl(k.freqname_chr, '') as admin_frequency,
                                   nvl(b.dosage_dec,0) as admin_dose,
                                   nvl(b.dosageunit_chr,'') as admin_dose_unit,
                                   nvl(b.qty_dec,0) as total_admin_dose,
                                   nvl(b.dosageunit_chr,'') as total_admin_dose_unit,
                                   '' as admin_method,
                                   nvl(b.desc_vchr,'') as special_promote,
                                   '' as skin_test,
                                   '' as comments
                              from t_opr_outpatientrecipe a
                             inner join t_opr_outpatientpwmrecipede b
                                on a.outpatrecipeid_chr = b.outpatrecipeid_chr
                             inner join t_bse_chargeitem c
                                on b.itemid_chr = c.itemid_chr
                             inner join t_bse_medicine d
                                on c.itemsrcid_vchr = d.medicineid_chr
                              left join t_aid_medicinepreptype i
                                on d.medicinepreptype_chr = i.medicinepreptype_chr
                              left join t_bse_usagetype j
                                on b.usageid_chr = j.usageid_chr
                              left join t_aid_recipefreq k
                                on b.freqid_chr = k.freqid_chr
                             where (a.pstauts_int = -2 or a.pstauts_int = 2)
                               and (a.recorddate_dat between
                                   to_date(?, 'yyyy-mm-dd hh24:mi:ss') and to_date(?, 'yyyy-mm-dd hh24:mi:ss'))
                            union all
                            select b.outpatrecipedeid_chr as item_id,
                                   a.outpatrecipeid_chr as cfid,
                                   d.assistcode_chr as drug_id,
                                   (case
                                         when d.mednormalname_vchr is null then
                                          d.medicinename_vchr
                                         else
                                          d.mednormalname_vchr
                                       end) as drug_name,
                                   d.medicinename_vchr as reg_name,
                                   nvl(d.productorid_chr,'') as manufacturer_name,
                                   1 as continue_day,
                                   nvl(b.itemspec_vchr,'') as spec,
                                   nvl((b.qty_dec * b.times_int),0) as quantity,
                                   nvl(b.unitid_chr,'') as dispense_unit,
                                   nvl(b.unitprice_mny,0) as unit_price,
                                   round(b.qty_dec * b.times_int * b.unitprice_mny, 2) + round(nvl(b.toldiffprice_mny, 0), 2) as amount,
                                   '' as group_no,
                                   '是' as first_use,
                                   nvl(i.medicinepreptypename_vchr, '') as prep_form,
                                   nvl(j.usagename_vchr,'') as admin_route,
                                   '' as admin_area,
                                   '' as admin_frequency,
                                   nvl(b.qty_dec,0) as admin_dose,
                                   nvl(b.unitid_chr,'') as admin_dose_unit,
                                   0 as total_admin_dose,
                                   '' as total_admin_dose_unit,
                                   nvl(b.sumusage_vchr,'') as admin_method,
                                   '' as special_promote,
                                   '' as skin_test,
                                   '' as comments
                              from t_opr_outpatientrecipe a
                             inner join t_opr_outpatientcmrecipede b
                                on a.outpatrecipeid_chr = b.outpatrecipeid_chr
                             inner join t_bse_chargeitem c
                                on b.itemid_chr = c.itemid_chr
                             inner join t_bse_medicine d
                                on c.itemsrcid_vchr = d.medicineid_chr
                              left join t_aid_medicinepreptype i
                                on d.medicinepreptype_chr = i.medicinepreptype_chr
                              left join t_bse_usagetype j
                                on b.usageid_chr = j.usageid_chr
                             where (a.pstauts_int = -2 or a.pstauts_int = 2)
                               and (a.recorddate_dat between
                                   to_date(?, 'yyyy-mm-dd hh24:mi:ss') and to_date(?, 'yyyy-mm-dd hh24:mi:ss'))";

                    parms = oraSvc.CreateParm(4, new List<object>() { transDate + " 00:00:00", transDate + " 23:59:59", transDate + " 00:00:00", transDate + " 23:59:59" });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_eng_cf_item where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            drData["org_code"] = hospitalNo;
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 门诊收费明细

                dtData = this.GetTableStruct("his_eng_cf_item_fee");
                try
                {
                    Sql = @"select b.outpatrecipedeid_chr as cost_id,
                                   (case a.pstauts_int
                                     when 2 then
                                      1
                                     else
                                      2
                                   end) as refund_flag,
                                   d.patientcardid_chr || to_char(a.recorddate_dat, 'yyyymmdd') as visit_no,
                                   a.outpatrecipeid_chr as cfid,
                                   b.outpatrecipedeid_chr as cf_item_id,
                                   a.patientid_chr as patient_no,
                                   c.lastname_vchr as patient_name,
                                   f.typename_vchr as item_type,
                                   to_char(i.recorddate_dat, 'yyyy-mm-dd hh24:mi:ss') as fee_date,
                                   (case
                                     when m.assistcode_chr is null then
                                      e.itemid_chr
                                     else
                                      m.assistcode_chr
                                   end) as item_id,
                                   b.itemname_vchr as item_name,
                                   b.unitid_chr as item_unit,
                                   b.unitprice_mny as item_unitprice,
                                   b.tolqty_dec as item_quantity,
                                   round(b.tolqty_dec * b.unitprice_mny, 2) +
                                   round(nvl(b.toldiffprice_mny, 0), 2) as item_amount,
                                   x.empno_chr as doc_id,
                                   x.lastname_vchr as doc_name,
                                   y.code_vchr as depart_id,
                                   y.deptname_vchr as department
                              from t_opr_outpatientrecipe a
                             inner join t_opr_outpatientpwmrecipede b
                                on a.outpatrecipeid_chr = b.outpatrecipeid_chr
                             inner join t_bse_patient c
                                on a.patientid_chr = c.patientid_chr
                             inner join t_bse_patientcard d
                                on a.patientid_chr = d.patientid_chr
                             inner join t_bse_chargeitem e
                                on b.itemid_chr = e.itemid_chr
                             inner join t_bse_chargeitemextype f
                                on e.itemopinvtype_chr = f.typeid_chr
                               and f.flag_int = 2
                             inner join t_opr_outpatientrecipeinv i
                                on a.outpatrecipeid_chr = i.outpatrecipeid_chr
                               and i.status_int = 1
                              left join t_bse_medicine m
                                on e.itemsrcid_vchr = m.medicineid_chr
                             inner join t_bse_employee x
                                on a.diagdr_chr = x.empid_chr
                             inner join t_bse_deptdesc y
                                on a.diagdept_chr = y.deptid_chr
                             where (a.pstauts_int = -2 or a.pstauts_int = 2)
                               and (a.recorddate_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and to_date(?, 'yyyy-mm-dd hh24:mi:ss'))
                            union all
                            select b.outpatrecipedeid_chr as cost_id,
                                   (case a.pstauts_int
                                     when 2 then
                                      1
                                     else
                                      2
                                   end) as refund_flag,
                                   d.patientcardid_chr || to_char(a.recorddate_dat, 'yyyymmdd') as visit_no,
                                   a.outpatrecipeid_chr as cfid,
                                   b.outpatrecipedeid_chr as cf_item_id,
                                   a.patientid_chr as patient_no,
                                   c.lastname_vchr as patient_name,
                                   f.typename_vchr as item_type,
                                   to_char(i.recorddate_dat, 'yyyy-mm-dd hh24:mi:ss') as fee_date,
                                   (case
                                     when m.assistcode_chr is null then
                                      e.itemid_chr
                                     else
                                      m.assistcode_chr
                                   end) as item_id,
                                   b.itemname_vchr as item_name,
                                   b.unitid_chr as item_unit,
                                   b.unitprice_mny as item_unitprice,
                                   (b.qty_dec * b.times_int) as item_quantity,
                                   round(b.qty_dec * b.times_int * b.unitprice_mny, 2) +
                                   round(nvl(b.toldiffprice_mny, 0), 2) as item_amount,
                                   x.empno_chr as doc_id,
                                   x.lastname_vchr as doc_name,
                                   y.code_vchr as depart_id,
                                   y.deptname_vchr as department
                              from t_opr_outpatientrecipe a
                             inner join t_opr_outpatientcmrecipede b
                                on a.outpatrecipeid_chr = b.outpatrecipeid_chr
                             inner join t_bse_patient c
                                on a.patientid_chr = c.patientid_chr
                             inner join t_bse_patientcard d
                                on a.patientid_chr = d.patientid_chr
                             inner join t_bse_chargeitem e
                                on b.itemid_chr = e.itemid_chr
                             inner join t_bse_chargeitemextype f
                                on e.itemopinvtype_chr = f.typeid_chr
                               and f.flag_int = 2
                             inner join t_opr_outpatientrecipeinv i
                                on a.outpatrecipeid_chr = i.outpatrecipeid_chr
                               and i.status_int = 1
                              left join t_bse_medicine m
                                on e.itemsrcid_vchr = m.medicineid_chr
                             inner join t_bse_employee x
                                on a.diagdr_chr = x.empid_chr
                             inner join t_bse_deptdesc y
                                on a.diagdept_chr = y.deptid_chr
                             where (a.pstauts_int = -2 or a.pstauts_int = 2)
                               and (a.recorddate_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and to_date(?, 'yyyy-mm-dd hh24:mi:ss'))
                            union all
                            select b.outpatrecipedeid_chr as cost_id,
                                   (case a.pstauts_int
                                     when 2 then
                                      1
                                     else
                                      2
                                   end) as refund_flag,
                                   d.patientcardid_chr || to_char(a.recorddate_dat, 'yyyymmdd') as visit_no,
                                   a.outpatrecipeid_chr as cfid,
                                   b.outpatrecipedeid_chr as cf_item_id,
                                   a.patientid_chr as patient_no,
                                   c.lastname_vchr as patient_name,
                                   f.typename_vchr as item_type,
                                   to_char(i.recorddate_dat, 'yyyy-mm-dd hh24:mi:ss') as fee_date,
                                   e.itemid_chr as item_id,
                                   b.itemname_vchr as item_name,
                                   b.itemunit_vchr as item_unit,
                                   b.price_mny as item_unitprice,
                                   b.qty_dec as item_quantity,
                                   round(b.qty_dec * b.price_mny, 2) as item_amount,
                                   x.empno_chr as doc_id,
                                   x.lastname_vchr as doc_name,
                                   y.code_vchr as depart_id,
                                   y.deptname_vchr as department
                              from t_opr_outpatientrecipe a
                             inner join t_opr_outpatientchkrecipede b
                                on a.outpatrecipeid_chr = b.outpatrecipeid_chr
                             inner join t_bse_patient c
                                on a.patientid_chr = c.patientid_chr
                             inner join t_bse_patientcard d
                                on a.patientid_chr = d.patientid_chr
                             inner join t_bse_chargeitem e
                                on b.itemid_chr = e.itemid_chr
                             inner join t_bse_chargeitemextype f
                                on e.itemopinvtype_chr = f.typeid_chr
                               and f.flag_int = 2
                             inner join t_opr_outpatientrecipeinv i
                                on a.outpatrecipeid_chr = i.outpatrecipeid_chr
                               and i.status_int = 1
                             inner join t_bse_employee x
                                on a.diagdr_chr = x.empid_chr
                             inner join t_bse_deptdesc y
                                on a.diagdept_chr = y.deptid_chr
                             where (a.pstauts_int = -2 or a.pstauts_int = 2)
                               and (a.recorddate_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and to_date(?, 'yyyy-mm-dd hh24:mi:ss'))
                            union all
                            select b.outpatrecipedeid_chr as cost_id,
                                   (case a.pstauts_int
                                     when 2 then
                                      1
                                     else
                                      2
                                   end) as refund_flag,
                                   d.patientcardid_chr || to_char(a.recorddate_dat, 'yyyymmdd') as visit_no,
                                   a.outpatrecipeid_chr as cfid,
                                   b.outpatrecipedeid_chr as cf_item_id,
                                   a.patientid_chr as patient_no,
                                   c.lastname_vchr as patient_name,
                                   f.typename_vchr as item_type,
                                   to_char(i.recorddate_dat, 'yyyy-mm-dd hh24:mi:ss') as fee_date,
                                   e.itemid_chr as item_id,
                                   b.itemname_vchr as item_name,
                                   b.itemunit_vchr as item_unit,
                                   b.price_mny as item_unitprice,
                                   b.qty_dec as item_quantity,
                                   round(b.qty_dec * b.price_mny, 2) as item_amount,
                                   x.empno_chr as doc_id,
                                   x.lastname_vchr as doc_name,
                                   y.code_vchr as depart_id,
                                   y.deptname_vchr as department
                              from t_opr_outpatientrecipe a
                             inner join t_opr_outpatientTestrecipede b
                                on a.outpatrecipeid_chr = b.outpatrecipeid_chr
                             inner join t_bse_patient c
                                on a.patientid_chr = c.patientid_chr
                             inner join t_bse_patientcard d
                                on a.patientid_chr = d.patientid_chr
                             inner join t_bse_chargeitem e
                                on b.itemid_chr = e.itemid_chr
                             inner join t_bse_chargeitemextype f
                                on e.itemopinvtype_chr = f.typeid_chr
                               and f.flag_int = 2
                             inner join t_opr_outpatientrecipeinv i
                                on a.outpatrecipeid_chr = i.outpatrecipeid_chr
                               and i.status_int = 1
                             inner join t_bse_employee x
                                on a.diagdr_chr = x.empid_chr
                             inner join t_bse_deptdesc y
                                on a.diagdept_chr = y.deptid_chr
                             where (a.pstauts_int = -2 or a.pstauts_int = 2)
                               and (a.recorddate_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and to_date(?, 'yyyy-mm-dd hh24:mi:ss'))
                            union all
                            select b.outpatrecipedeid_chr as cost_id,
                                   (case a.pstauts_int
                                     when 2 then
                                      1
                                     else
                                      2
                                   end) as refund_flag,
                                   d.patientcardid_chr || to_char(a.recorddate_dat, 'yyyymmdd') as visit_no,
                                   a.outpatrecipeid_chr as cfid,
                                   b.outpatrecipedeid_chr as cf_item_id,
                                   a.patientid_chr as patient_no,
                                   c.lastname_vchr as patient_name,
                                   f.typename_vchr as item_type,
                                   to_char(i.recorddate_dat, 'yyyy-mm-dd hh24:mi:ss') as fee_date,
                                   e.itemid_chr as item_id,
                                   b.itemname_vchr as item_name,
                                   b.itemunit_vchr as item_unit,
                                   b.price_mny as item_unitprice,
                                   b.qty_dec as item_quantity,
                                   round(b.qty_dec * b.price_mny, 2) as item_amount,
                                   x.empno_chr as doc_id,
                                   x.lastname_vchr as doc_name,
                                   y.code_vchr as depart_id,
                                   y.deptname_vchr as department
                              from t_opr_outpatientrecipe a
                             inner join t_opr_outpatientopsrecipede b
                                on a.outpatrecipeid_chr = b.outpatrecipeid_chr
                             inner join t_bse_patient c
                                on a.patientid_chr = c.patientid_chr
                             inner join t_bse_patientcard d
                                on a.patientid_chr = d.patientid_chr
                             inner join t_bse_chargeitem e
                                on b.itemid_chr = e.itemid_chr
                             inner join t_bse_chargeitemextype f
                                on e.itemopinvtype_chr = f.typeid_chr
                               and f.flag_int = 2
                             inner join t_opr_outpatientrecipeinv i
                                on a.outpatrecipeid_chr = i.outpatrecipeid_chr
                               and i.status_int = 1
                             inner join t_bse_employee x
                                on a.diagdr_chr = x.empid_chr
                             inner join t_bse_deptdesc y
                                on a.diagdept_chr = y.deptid_chr
                             where (a.pstauts_int = -2 or a.pstauts_int = 2)
                               and (a.recorddate_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and to_date(?, 'yyyy-mm-dd hh24:mi:ss'))
                            union all
                            select b.outpatrecipedeid_chr as cost_id,
                                   (case a.pstauts_int
                                     when 2 then
                                      1
                                     else
                                      2
                                   end) as refund_flag,
                                   d.patientcardid_chr || to_char(a.recorddate_dat, 'yyyymmdd') as visit_no,
                                   a.outpatrecipeid_chr as cfid,
                                   b.outpatrecipedeid_chr as cf_item_id,
                                   a.patientid_chr as patient_no,
                                   c.lastname_vchr as patient_name,
                                   f.typename_vchr as item_type,
                                   to_char(i.recorddate_dat, 'yyyy-mm-dd hh24:mi:ss') as fee_date,
                                   (case
                                     when m.assistcode_chr is null then
                                      e.itemid_chr
                                     else
                                      m.assistcode_chr
                                   end) as item_id,
                                   b.itemname_vchr as item_name,
                                   b.unitid_chr as item_unit,
                                   b.unitprice_mny as item_unitprice,
                                   b.qty_dec as item_quantity,
                                   round(b.qty_dec * b.unitprice_mny, 2) +
                                   round(nvl(b.toldiffprice_mny, 0), 2) as item_amount,
                                   x.empno_chr as doc_id,
                                   x.lastname_vchr as doc_name,
                                   y.code_vchr as depart_id,
                                   y.deptname_vchr as department
                              from t_opr_outpatientrecipe a
                             inner join t_opr_outpatientothrecipede b
                                on a.outpatrecipeid_chr = b.outpatrecipeid_chr
                             inner join t_bse_patient c
                                on a.patientid_chr = c.patientid_chr
                             inner join t_bse_patientcard d
                                on a.patientid_chr = d.patientid_chr
                             inner join t_bse_chargeitem e
                                on b.itemid_chr = e.itemid_chr
                             inner join t_bse_chargeitemextype f
                                on e.itemopinvtype_chr = f.typeid_chr
                               and f.flag_int = 2
                             inner join t_opr_outpatientrecipeinv i
                                on a.outpatrecipeid_chr = i.outpatrecipeid_chr
                               and i.status_int = 1
                              left join t_bse_medicine m
                                on e.itemsrcid_vchr = m.medicineid_chr
                             inner join t_bse_employee x
                                on a.diagdr_chr = x.empid_chr
                             inner join t_bse_deptdesc y
                                on a.diagdept_chr = y.deptid_chr
                             where (a.pstauts_int = -2 or a.pstauts_int = 2)
                               and (a.recorddate_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and to_date(?, 'yyyy-mm-dd hh24:mi:ss'))";

                    parms = oraSvc.CreateParm(12, new List<object>() { transDate + " 00:00:00", transDate + " 23:59:59", transDate + " 00:00:00", transDate + " 23:59:59",
                                                                       transDate + " 00:00:00", transDate + " 23:59:59", transDate + " 00:00:00", transDate + " 23:59:59",
                                                                       transDate + " 00:00:00", transDate + " 23:59:59", transDate + " 00:00:00", transDate + " 23:59:59"  });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_eng_cf_item_fee where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        List<string> lstCostId3 = new List<string>();
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            if (lstCostId3.IndexOf(dr["cost_id"].ToString()) >= 0)
                                continue;
                            else
                                lstCostId3.Add(dr["cost_id"].ToString());

                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            drData["org_code"] = hospitalNo;
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 门诊发药明细

                dtData = this.GetTableStruct("his_eng_cf_drug_send");
                try
                {
                    Sql = @"select to_char(c.sid_int) as send_id,
                                   a.outpatrecipeid_chr as cfid,
                                   d.outpatrecipedeid_chr as cf_item_id,
                                   e.medstorename_vchr as dispense_store,
                                   a.patientid_chr as patient_no,
                                   x.lastname_vchr as patient_name,
                                   m.assistcode_chr as drug_id,
                                   (case
                                         when m.mednormalname_vchr is null then
                                          m.medicinename_vchr
                                         else
                                          m.mednormalname_vchr
                                       end) as drug_name,
                                   m.medicinename_vchr as reg_name,
                                   m.productorid_chr as manufacturer_name,
                                   nvl(i.medicinepreptypename_vchr, '') as prep_form,
                                   d.itemspec_vchr as spec,
                                   d.unitid_chr as qty_unit,
                                   d.dosage_dec as send_dose,
                                   d.dosageunit_chr as send_unit,
                                   to_char(c.senddate_dat, 'yyyy-mm-dd hh24:mi:ss') as send_date_time,
                                   '*' as pharm_audt_id,
                                   '*' as pharm_audt_name,
                                   t1.empno_chr as pharm_pre_id,
                                   t1.lastname_vchr as pharm_pre_name,
                                   t1.empno_chr as pharm_chk_id,
                                   t1.lastname_vchr as pharm_chk_name,
                                   t2.empno_chr as pharm_delv_id,
                                   t2.lastname_vchr as pharm_delv_name
                              from t_opr_outpatientrecipe a
                             inner join t_opr_recipesendentry b
                                on a.outpatrecipeid_chr = b.outpatrecipeid_chr
                             inner join t_opr_recipesend c
                                on b.sid_int = c.sid_int
                             inner join t_opr_outpatientpwmrecipede d
                                on a.outpatrecipeid_chr = d.outpatrecipeid_chr
                             inner join t_bse_medstore e
                                on c.medstoreid_chr = e.medstoreid_chr
                             inner join t_bse_chargeitem f
                                on d.itemid_chr = f.itemid_chr
                             inner join t_bse_medicine m
                                on f.itemsrcid_vchr = m.medicineid_chr
                              left join t_aid_medicinepreptype i
                                on m.medicinepreptype_chr = i.medicinepreptype_chr
                             inner join t_bse_patient x
                                on a.patientid_chr = x.patientid_chr
                              left join t_bse_employee t1
                                on c.treatemp_chr = t1.empid_chr
                              left join t_bse_employee t2
                                on c.sendemp_chr = t2.empid_chr
                             where a.pstauts_int = 2
                               and c.pstatus_int = 3
                               and (a.recorddate_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and to_date(?, 'yyyy-mm-dd hh24:mi:ss'))
                            union all
                            select to_char(c.sid_int) as send_id,
                                   a.outpatrecipeid_chr as cfid,
                                   d.outpatrecipedeid_chr as cf_item_id,
                                   e.medstorename_vchr as dispense_store,
                                   a.patientid_chr as patient_no,
                                   x.lastname_vchr as patient_name,
                                   m.assistcode_chr as drug_id,
                                   (case
                                         when m.mednormalname_vchr is null then
                                          m.medicinename_vchr
                                         else
                                          m.mednormalname_vchr
                                       end) as drug_name,
                                   m.medicinename_vchr as reg_name,
                                   m.productorid_chr as manufacturer_name,
                                   nvl(i.medicinepreptypename_vchr, '') as prep_form,
                                   d.itemspec_vchr as spec,
                                   d.unitid_chr as qty_unit,
                                   d.qty_dec as send_dose,
                                   d.unitid_chr as send_unit,
                                   to_char(c.senddate_dat, 'yyyy-mm-dd hh24:mi:ss') as send_date_time,
                                   '*' as pharm_audt_id,
                                   '*' as pharm_audt_name,
                                   t1.empno_chr as pharm_pre_id,
                                   t1.lastname_vchr as pharm_pre_name,
                                   t1.empno_chr as pharm_chk_id,
                                   t1.lastname_vchr as pharm_chk_name,
                                   t2.empno_chr as pharm_delv_id,
                                   t2.lastname_vchr as pharm_delv_name
                              from t_opr_outpatientrecipe a
                             inner join t_opr_recipesendentry b
                                on a.outpatrecipeid_chr = b.outpatrecipeid_chr
                             inner join t_opr_recipesend c
                                on b.sid_int = c.sid_int
                             inner join t_opr_outpatientcmrecipede d
                                on a.outpatrecipeid_chr = d.outpatrecipeid_chr
                             inner join t_bse_medstore e
                                on c.medstoreid_chr = e.medstoreid_chr
                             inner join t_bse_chargeitem f
                                on d.itemid_chr = f.itemid_chr
                             inner join t_bse_medicine m
                                on f.itemsrcid_vchr = m.medicineid_chr
                              left join t_aid_medicinepreptype i
                                on m.medicinepreptype_chr = i.medicinepreptype_chr
                             inner join t_bse_patient x
                                on a.patientid_chr = x.patientid_chr
                              left join t_bse_employee t1
                                on c.treatemp_chr = t1.empid_chr
                              left join t_bse_employee t2
                                on c.sendemp_chr = t2.empid_chr
                             where a.pstauts_int = 2
                               and c.pstatus_int = 3
                               and (a.recorddate_dat between to_date(?, 'yyyy-mm-dd hh24:mi:ss') and to_date(?, 'yyyy-mm-dd hh24:mi:ss'))";

                    parms = oraSvc.CreateParm(4, new List<object>() { transDate + " 00:00:00", transDate + " 23:59:59", transDate + " 00:00:00", transDate + " 23:59:59" });
                    dtTemp = oraSvc.GetDataTable(Sql, parms);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_eng_cf_drug_send where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            drData["org_code"] = hospitalNo;
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 药品目录

                tableName = "his_drug_catalog";
                dtData = this.GetTableStruct(tableName);
                try
                {
                    Sql = @"select a.assistcode_chr as drug_id,
                                   (case
                                     when a.mednormalname_vchr is null then
                                      a.medicinename_vchr
                                     else
                                      a.mednormalname_vchr
                                   end) as drug_name,
                                   a.medicinename_vchr as trade_name,
                                   a.medspec_vchr as spec_name,
                                   nvl(b.medicinepreptypename_vchr, '') as prep_name,
                                   a.productorid_chr as manufacturer_name,
                                   a.permitno_vchr as pzwh,
                                   a.opunit_chr as mz_unit,
                                   a.ipunit_chr as zy_unit,
                                   '' as bwm,
                                   a.transno as yp_id,
                                   c.pharmaname_vchr as pharma_type,
                                   d.medicinetypename_vchr as drug_type,
                                   (case a.ifstop_int
                                     when 1 then
                                      '是'
                                     else
                                      '否'
                                   end) as use_flag
                              from t_bse_medicine a
                              left join t_aid_medicinepreptype b
                                on a.medicinepreptype_chr = b.medicinepreptype_chr
                              left join t_bse_pharmatype c
                                on a.pharmaid_chr = c.pharmaid_chr
                             inner join t_aid_medicinetype d
                                on a.medicinetypeid_chr = d.medicinetypeid_chr
                             where a.deleted_int = 0
                               and a.ifstop_int = 0
                               and d.medicinetypeid_chr in (1, 2, 6, 7)
                             order by a.assistcode_chr";

                    dtTemp = oraSvc.GetDataTable(Sql);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_drug_catalog where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            if (drData["drug_name"].ToString().StartsWith("***"))
                                continue;
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            drData["org_code"] = hospitalNo;
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 药品单位转换比

                tableName = "his_drug_convert";
                dtData = this.GetTableStruct(tableName);
                try
                {
                    Sql = @"select a.medicineid_chr as id,
                                   a.assistcode_chr as drug_id,
                                   (case
                                     when a.mednormalname_vchr is null then
                                      a.medicinename_vchr
                                     else
                                      a.mednormalname_vchr
                                   end) as drug_name,
                                   1 as unit_num,
                                   a.opunit_chr as unit,
                                   a.packqty_dec as convert_num,
                                   a.ipunit_chr as convert_unit
                              from t_bse_medicine a
                             inner join t_aid_medicinetype d
                                on a.medicinetypeid_chr = d.medicinetypeid_chr
                             where a.deleted_int = 0
                               and a.ifstop_int = 0 
                               and d.medicinetypeid_chr in (1, 2, 6, 7)
                             order by a.assistcode_chr";

                    dtTemp = oraSvc.GetDataTable(Sql);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_drug_convert where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            if (drData["drug_name"].ToString().StartsWith("***"))
                                continue;
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            drData["org_code"] = hospitalNo;
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 科室信息

                tableName = "his_department";
                dtData = this.GetTableStruct(tableName);
                try
                {
                    Sql = @"select a.shortno_chr as dept_id,
                                   a.deptname_vchr as dept_name,
                                   a.deptname_vchr as dept_abbr,
                                   (case a.inpatientoroutpatient_int
                                     when 0 then
                                      '门诊'
                                     when 1 then
                                      '住院'
                                     when 2 then
                                      '检验'
                                     else
                                      '其他'
                                   end) as dept_type,
                                   '总院' as hosp_area
                              from t_bse_deptdesc a
                             order by a.deptname_vchr";

                    dtTemp = oraSvc.GetDataTable(Sql);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_department where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            drData["org_code"] = hospitalNo;
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 医生信息

                tableName = "his_doctor";
                dtData = this.GetTableStruct(tableName);
                try
                {
                    Sql = @"select a.empno_chr as doc_id,
                                   a.lastname_vchr as doc_name,
                                   nvl(a.technicalrank_chr, '') as doc_title,
                                   (case
                                     when opIp is null then
                                      '其他'
                                     when opIp = 1 then
                                      '门诊'
                                     when opIp = 2 then
                                      '住院'
                                     else
                                      '其他'
                                   end) as work_scope,
                                   nvl(bb.code_vchr, '') as depart_id,
                                   nvl(bb.deptname_vchr, '') as department
                              from t_bse_employee a
                              left join (select a.empid_chr, b.code_vchr, b.deptname_vchr, 1 as opIp
                                           from t_bse_deptemp a
                                          inner join t_bse_deptdesc b
                                             on a.deptid_chr = b.deptid_chr
                                          where a.default_dept_int = 1
                                         union all
                                         select a.empid_chr, b.code_vchr, b.deptname_vchr, 2 as opIp
                                           from t_bse_deptemp a
                                          inner join t_bse_deptdesc b
                                             on a.deptid_chr = b.deptid_chr
                                          where a.default_inpatient_dept_int = 1) bb
                                on a.empid_chr = bb.empid_chr
                             order by a.empno_chr";

                    dtTemp = oraSvc.GetDataTable(Sql);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_doctor where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            drData["org_code"] = hospitalNo;
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 给药途径

                tableName = "his_admin_route";
                dtData = this.GetTableStruct(tableName);
                try
                {
                    Sql = @"select a.usageid_chr    as route_id,
                                   a.usercode_chr   as route_code,
                                   a.usagename_vchr as route_name
                              from t_bse_usagetype a";

                    dtTemp = oraSvc.GetDataTable(Sql);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_admin_route where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            drData["org_code"] = hospitalNo;
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion

                #region 给药频率

                tableName = "his_admin_frequency";
                dtData = this.GetTableStruct(tableName);
                try
                {
                    Sql = @"select a.freqid_chr   as freq_id,
                                   a.usercode_chr as freq_code,
                                   a.freqname_chr as freq_name
                              from t_aid_recipefreq a";

                    dtTemp = oraSvc.GetDataTable(Sql);
                    if (dtTemp != null && dtTemp.Rows.Count > 0)
                    {
                        Sql = string.Format("delete from his_admin_frequency where create_time >= {0}  and create_time<= {1}", "'" + transDate + " 00:00:00'", "'" + transDate + " 23:59:59'");
                        sqlSvc.ExecSql(Sql);

                        drData = dtData.NewRow();
                        dtData.BeginLoadData();
                        lstColNames = this.GetColumnNames(dtTemp);
                        foreach (DataRow dr in dtTemp.Rows)
                        {
                            foreach (string colName in lstColNames)
                            {
                                drData[colName] = ConvertToValue(dtTemp, colName, dr[colName]);
                            }
                            drData["creator"] = "0001";
                            drData["create_time"] = Convert.ToDateTime(transDate + " " + dtmNow.ToString("HH:mm:ss"));
                            drData["org_code"] = hospitalNo;
                            dtData.LoadDataRow(drData.ItemArray, true);
                        }
                        dtData.EndLoadData();
                        lstCommitDt.Add(dtData);
                    }
                }
                catch (Exception ex)
                {
                    Log.Output(ex.Message);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Threading.Thread.Sleep(1000);
                #endregion


                #region 过敏药物

                #endregion

                #region 统一提交

                int succTableNums = 0;
                int ret = sqlSvc.SqlBulkCopy(lstCommitDt, out succTableNums);
                Log.Output(string.Format("update tables: request {0} , input {1} , sucess {2} .", 22, lstCommitDt.Count, succTableNums));

                #endregion

                return true;
            }
            catch (Exception ex)
            {
                Log.Output(ex.Message);
            }
            finally
            {
                oraSvc = null;
                sqlSvc = null;
            }
            return false;
        }
        #endregion

        #endregion

        #region 实体

        #region 住院患者费用
        /// <summary>
        /// 住院患者费用
        /// </summary>
        public class EntityOrderCost
        {
            /// <summary>
            /// registerId
            /// </summary>
            public string order_id { get; set; }
            /// <summary>
            /// 床位费
            /// </summary>
            public decimal bed_fee { get; set; }
            /// <summary>
            /// 护理费
            /// </summary>
            public decimal nurse_fee { get; set; }
            /// <summary>
            /// 西药费
            /// </summary>
            public decimal wm_fee { get; set; }
            /// <summary>
            /// 中成药费 
            /// </summary>
            public decimal cpd_fee { get; set; }
            /// <summary>
            /// 中草药费 
            /// </summary>
            public decimal cmh_fee { get; set; }
            /// <summary>
            /// 放射费
            /// </summary>
            public decimal radio_fee { get; set; }
            /// <summary>
            /// 化验费
            /// </summary>
            public decimal exam_fee { get; set; }
            /// <summary>
            /// 输氧费
            /// </summary>
            public decimal oxy_fee { get; set; }
            /// <summary>
            /// 输血费
            /// </summary>
            public decimal blood_fee { get; set; }
            /// <summary>
            /// 手术费
            /// </summary>
            public decimal operation_fee { get; set; }
            /// <summary>
            /// 检查费
            /// </summary>
            public decimal check_fee { get; set; }
            /// <summary>
            /// 麻醉费
            /// </summary>
            public decimal anesth_fee { get; set; }
            /// <summary>
            /// 治疗费
            /// </summary>
            public decimal treat_fee { get; set; }
            /// <summary>
            /// 其他费用
            /// </summary>
            public decimal other_fee { get; set; }
            /// <summary>
            /// 住院费用总计
            /// </summary>
            public decimal total_fee { get; set; }
        }
        #endregion

        #region 住院患者病理信息
        /// <summary>
        /// 住院患者病理信息
        /// </summary>
        public class EntityPathologic
        {
            /// <summary>
            /// registerId
            /// </summary>
            public string order_id { get; set; }
            /// <summary>
            /// 卡号
            /// </summary>
            public string cardNo { get; set; }
            /// <summary>
            /// 申请单ID（多个.合并）
            /// </summary>
            public string applyId { get; set; }
            /// <summary>
            /// 病理结果(多个.合并)
            /// </summary>
            public string pathologicResult { get; set; }
            /// <summary>
            /// 抢救次数
            /// </summary>
            public int rescue_times { get; set; }
            /// <summary>
            /// 抢救成功次数
            /// </summary>
            public int rescue_succ_times { get; set; }
        }
        #endregion

        #region 住院检验结果
        /// <summary>
        /// 住院检验结果
        /// </summary>
        public class EntityIpLisResult
        {
            public string order_id { get; set; }
            public string lis_group_code { get; set; }
            public string exam_item_id { get; set; }
            public string lis_time { get; set; }
        }
        #endregion

        #region 门诊挂号
        /// <summary>
        /// 门诊挂号
        /// </summary>
        public class EntityOpRegister
        {
            public string visit_no { get; set; }
            public string depart_id { get; set; }
            public string doc_id { get; set; }
        }
        #endregion

        #endregion
    }
}
