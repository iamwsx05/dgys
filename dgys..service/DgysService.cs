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

        /// <summary>
        /// 执行中
        /// </summary>
        static bool IsDoing { get; set; }

        protected override void OnStart(string[] args)
        {
            Log.Output("Service begin running ...");
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
            System.Timers.Timer timer = new System.Timers.Timer();
            timer.Elapsed += new ElapsedEventHandler(OnTimedEvent);
            // 每秒执行
            timer.Interval = 1000;
            timer.Enabled = true;
            // Keep the timer alive until the end of service.
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
    }
}
