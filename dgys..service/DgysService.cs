using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.ServiceProcess;
using System.Timers;

namespace Dgys.Service
{
    public partial class DgysService : ServiceBase
    {
        public DgysService()
        {
            InitializeComponent();
        }

        /// <summary>
        /// 执行时间点
        /// </summary>
        static List<string> ExecTimePoint { get; set; }
        static List<string> ExecTimePointMed { get; set; }

        /// <summary>
        /// 执行中
        /// </summary>
        static bool IsDoing { get; set; }

        protected override void OnStart(string[] args)
        {
            Log.Output("Service begin running ...");
            string execTimePointMed = ConfigurationManager.AppSettings["execTimePointMed"].ToString();
            string execTimePoint = ConfigurationManager.AppSettings["execTimePoint"].ToString();
            if (execTimePoint == null || execTimePoint.Trim() == string.Empty)
            {
                execTimePoint = "02:00";
            }
            ExecTimePoint = execTimePoint.Split(';').ToList();
            for (int i = 0; i < ExecTimePoint.Count; i++)
            {
                ExecTimePoint[i] = ExecTimePoint[i] + ":00";
            }
            if (execTimePointMed == null || execTimePointMed.Trim() == string.Empty)
            {
                execTimePointMed = "02:00;10:00;12:00;14:00;17:00;18:00";
            }

            ExecTimePointMed = execTimePointMed.Split(';').ToList();
            for (int i = 0; i < ExecTimePointMed.Count; i++)
            {
                ExecTimePointMed[i] = ExecTimePointMed[i] + ":00";
            }

            System.Timers.Timer timer = new System.Timers.Timer();
            timer.Elapsed += new ElapsedEventHandler(OnTimedEvent);
            // 每秒执行
            timer.Interval = 1000;
            timer.Enabled = true;
            //
            System.Timers.Timer timerMed = new System.Timers.Timer();
            timerMed.Elapsed += new ElapsedEventHandler(OnTimedEventMed);
            // 每秒执行
            timerMed.Interval = 1000;
            timerMed.Enabled = true;

            // Keep the timer alive until the end of service.
            GC.KeepAlive(timerMed);
            GC.KeepAlive(timer);
        }

        protected override void OnStop()
        {

        }

        private static void OnTimedEvent(object source, ElapsedEventArgs e)
        {

            if (ExecTimePoint.IndexOf(DateTime.Now.ToString("HH:mm:ss")) >= 0)
            {
                try
                {
                    if (IsDoing) return;
                    IsDoing = true;
                    // 下载日期: 当前时间前一天
                    DateTime dtmDown = DateTime.Now.AddDays(-1);
                    DgysBiz biz = new DgysBiz();
                    biz.TransDataService(dtmDown.ToString("yyyy-MM-dd"));

                    // 补漏下载
                    string execDates = ConfigurationManager.AppSettings["execDate"].ToString();
                    if (execDates != null && execDates.Trim() != string.Empty)
                    {
                        List<string> lstDate = execDates.Split(';').ToList();
                        if (lstDate.Count > 0)
                        {
                            foreach (string date in lstDate)
                            {
                                biz.TransDataService(date);
                            }
                        }
                    }

                    biz = null;
                }
                finally
                {
                    IsDoing = false; 
                }
            }
        }

        //上传药品目录  药品库存
        private static void OnTimedEventMed(object source, ElapsedEventArgs e)
        {

            if (ExecTimePointMed.IndexOf(DateTime.Now.ToString("HH:mm:ss")) >= 0)
            {
                try
                {
                    if (IsDoing) return;
                    IsDoing = true;
                    // 下载日期: 当前时间前一天
                    DateTime dtmDown = DateTime.Now.AddDays(-1);
                    DgysBiz biz = new DgysBiz();
                    biz.TransDataServiceMed(dtmDown.ToString("yyyy-MM-dd"));

                    // 补漏下载
                    string execDates = ConfigurationManager.AppSettings["execDate"].ToString();
                    if (execDates != null && execDates.Trim() != string.Empty)
                    {
                        List<string> lstDate = execDates.Split(';').ToList();
                        if (lstDate.Count > 0)
                        {
                            foreach (string date in lstDate)
                            {
                                biz.TransDataServiceMed(date);
                            }
                        }
                    }

                    biz = null;
                }
                finally
                {
                    IsDoing = false;
                }
            }
        }
    }
}
