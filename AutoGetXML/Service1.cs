using AutoGetXML.Basic;
using AutoGetXML.DAL;
using AutoGetXML.Job;
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
    public partial class Service1 : ServiceBase
    {
        private readonly ILog logger;
        public static IScheduler scheduler;
        private readonly WinLogWirter winlogger;
        public Service1()
        {
            InitializeComponent();
            winlogger = new WinLogWirter();
            AppDomain.CurrentDomain.UnhandledException += new UnhandledExceptionEventHandler(CurrentDomain_UnhandledException);
            logger = LogManager.GetLogger(GetType());
            scheduler = StdSchedulerFactory.GetDefaultScheduler();
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

        protected override void OnStart(string[] args)
        {
            try
            {
                scheduler.Start();
                AllMsg("Quartz服务成功启动.");

                DateTimeOffset runTime = DateBuilder.EvenSecondDate(DateTimeOffset.Now);

                //get
                #region satrtAutoGetXml job

                taskMin = setTaskMin();

                IJobDetail AutoGetXml_job = JobBuilder.Create<AutoGetXmlJob>().WithIdentity("autoGetXMLjob", "autoGetXMLGroup").Build();

                ITrigger AutoGetXml_trigger = TriggerBuilder.Create()
                    .WithIdentity("autoGetXMLTrigger", "autoGetXMLGroup")
                    .StartAt(runTime)
                    .WithSimpleSchedule(x => x.WithIntervalInMinutes(taskMin).RepeatForever())
                    .Build();


                // Tell quartz to schedule the job using our trigger
                scheduler.ScheduleJob(AutoGetXml_job, AutoGetXml_trigger);
                #endregion
            }
            catch (Exception ex)
            {
                logger.Error(ex.Message);
            }
        }

        protected override void OnStop()
        {
            try
            {
                scheduler.Shutdown();
                logger.Info("Quartz服务成功终止");
            }
            finally { }
        }
        protected override void OnPause()
        {
            scheduler.PauseAll();
        }

        protected override void OnContinue()
        {
            scheduler.ResumeAll();
        }


        public int taskMin { get; set; }
        private int setTaskMin()
        {
            using (MysqlDbContext dbcontext = new MysqlDbContext())
            {
                int ttaskMin = 5;
                try
                {
                    logger.DebugFormat("test!");
                    var tmptaskMin = dbcontext.m_Parameter.Where(m => m.paramkey.Equals("autoGetXMLMin")).Select(m => m.paramvalue).SingleOrDefault();
                    logger.DebugFormat("**获取远行job分钟：{0}", tmptaskMin);
                    if (!string.IsNullOrEmpty(tmptaskMin))
                    {
                        if (int.TryParse(tmptaskMin, out ttaskMin))
                        {
                            logger.DebugFormat("**获取job分钟成功：{0}，currMin:{1}", tmptaskMin, ttaskMin);

                            if (ttaskMin < 10)
                            {
                                ttaskMin = 10;
                            }
                        }
                    }
                    else
                    {
                        logger.DebugFormat("**job运行失败，获取分钟：{0}，默认值：{1}", tmptaskMin, ttaskMin);
                    }
                }
                catch (Exception ex)
                {
                    logger.Error("**##Mysql Error:", ex);
                }
                return ttaskMin;
            }
        }
        public void AllMsg(string message)
        {
            logger.Debug(message);
            logger.Info(message);
            //test
            //logger.Debug("执行任务!!!!!!!!!!!!!!!");
            //using (MysqlDbContext dbcontext = new MysqlDbContext())
            //{
            //    try
            //    {
            //        logger.DebugFormat("test!");
            //        var dd = dbcontext.t_Interface.ToList();
            //        logger.Debug(dd.Count);
            //    }
            //    catch (Exception ex)
            //    {
            //        logger.Error("test", ex);
            //    }
            //}
        }
    }
}
