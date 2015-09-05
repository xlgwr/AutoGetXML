using log4net;
using Quartz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace AutoGetXML.Job
{
    [PersistJobDataAfterExecution]
    [DisallowConcurrentExecution]
    public class AutoGetXmlJob : IJob
    {
        private static readonly ILog logger = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        public void Execute(IJobExecutionContext context)
        {
            logger.DebugFormat("*********运行job:{0}.下次job时间：{1}.", context.JobDetail.Key, context.NextFireTimeUtc);
        }
    }
}