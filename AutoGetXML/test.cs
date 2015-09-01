using AutoGetXML.Basic;
using AutoGetXML.DAL;
using log4net;
using Quartz;
using Quartz.Impl;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
namespace AutoGetXML
{
    public class Test
    {
        private readonly ILog logger;
        public static IScheduler scheduler;
        private readonly WinLogWirter winlogger;
        public Test()
        {
            winlogger = new WinLogWirter();
            AppDomain.CurrentDomain.UnhandledException += new UnhandledExceptionEventHandler(CurrentDomain_UnhandledException);
            logger = LogManager.GetLogger(GetType());
            scheduler = StdSchedulerFactory.GetDefaultScheduler();
        }
        public void AllMsg(string message)
        {
            logger.Debug(message);
            logger.Info(message);
            //test
            logger.Debug("执行清理任务!!!!!!!!!!!!!!!");
            using (MysqlDbContext dbcontext = new MysqlDbContext())
            {
                try
                {
                    logger.DebugFormat("test!");
                    var dd = dbcontext.t_Interface.ToList();
                    logger.Debug(dd.Count);
                }
                catch (Exception ex)
                {
                    logger.Error("test", ex);
                }
            }
        }
        void CurrentDomain_UnhandledException(object sender, UnhandledExceptionEventArgs e)
        {
            try
            {

                Exception ex = e.ExceptionObject as Exception;
                winlogger.LogEvent("来自“AutoGetXML.Service”的全局异常。" + ex.Message + "详细信息如下："
                                    + Environment.NewLine + "［InnerException］" + ex.InnerException
                                    + Environment.NewLine + "［Source］" + ex.Source
                                    + Environment.NewLine + "［TargetSite］" + ex.TargetSite
                                    + Environment.NewLine + "［StackTrace］" + ex.StackTrace);
            }
            catch { }
        }

        public void OnStart()
        {
            scheduler.Start();
            AllMsg("Quartz服务成功启动.");
        }

        public void OnStop()
        {
            try
            {
                scheduler.Shutdown();
                logger.Info("Quartz服务成功终止");
            }
            finally { }
        }
        public void OnPause()
        {
            scheduler.PauseAll();
        }

        public void OnContinue()
        {
            scheduler.ResumeAll();
        }
    }
}
