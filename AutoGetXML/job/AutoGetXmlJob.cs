using AutoGetXML.DAL;
using log4net;
using Quartz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Xml;

namespace AutoGetXML.Job
{
    [PersistJobDataAfterExecution]
    [DisallowConcurrentExecution]
    public class AutoGetXmlJob : IJob
    {
        private static readonly ILog logger = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        public void Execute(IJobExecutionContext context)
        {
            logger.DebugFormat("*********开始运行job:{0}.下次job时间：{1}.", context.JobDetail.Key, context.NextFireTimeUtc);

            try
            {
                using (MysqlDbContext dbcontext = new MysqlDbContext())
                {
                    var tmpInterface = dbcontext.t_Interface.ToList();
                    if (tmpInterface.Count > 0)
                    {
                        //1：入库申请 2：入库结果 3：上架结果 4:仓单获取 
                        //5：出库申请 6：出库结果 7：调货视频  8：库位视频
                        logger.Debug("1：入库申请 2：入库结果 3：上架结果 4:仓单获取 5：出库申请 6：出库结果 7：调货视频  8：库位视频");
                        
                        var tmpcurrType = "";
                        foreach (var item in tmpInterface)
                        {
                            try
                            {
                                //0：自动 1：手动
                                if (item.status == 1)
                                {
                                    logger.DebugFormat("**********当前接口：{0}，为手动。URL:{1}", item.type, item.address);
                                    continue;
                                }

                                switch (item.type)
                                {
                                    case 1:
                                        tmpcurrType = "1：入库申请945";

                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********当前接口:{0},开始下载。", tmpcurrType);

                                            string Url = item.address;
                                            try
                                            {
                                                var ret = HttpClientHelper.GetResponse(Url);
                                                if (ret != null)
                                                {
                                                    logger.DebugFormat("***GetResponse:{0}", ret);

                                                    XmlDocument doc = new XmlDocument();
                                                    //XmlReaderSettings settings = new XmlReaderSettings();
                                                    //settings.IgnoreComments = true;//忽略文档里面的注释
                                                    //XmlReader reader = XmlReader.Create(ret, settings);
                                                    doc.LoadXml(ret);
                                                    //root=CWRE945Message
                                                    XmlNode xn = doc.SelectSingleNode("CWRE945Message");

                                                    //get all child node
                                                    XmlNodeList xnl = xn.ChildNodes;

                                                    

                                                    //reader.Close();
                                                }
                                                else
                                                {
                                                    logger.DebugFormat("**********当前接口:{0},没有获取任何内容：{1}。", tmpcurrType, ret);
                                                }
                                            }
                                            catch (Exception ex)
                                            {
                                                logger.DebugFormat("获得:{0}.异常,Error:{1}", tmpcurrType, ex);
                                                throw ex;
                                            }
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********当前接口:{0},开始上传。", tmpcurrType);
                                        }

                                        break;
                                    case 2:
                                        tmpcurrType = "2：入库结果861";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********当前接口:{0},开始下载。", tmpcurrType);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********当前接口:{0},开始上传。", tmpcurrType);

                                            string Url = item.address;
                                            try
                                            {
                                                XmlDocument doc = new XmlDocument();
                                                doc.Load(@".\goods_receipt_CWRE861Message.xml");

                                                var ret = HttpClientHelper.PostResponse(Url,doc.InnerXml);
                                                if (ret != null)
                                                {
                                                    logger.DebugFormat("***PostResponse:{0}", ret);                                                    
                                                }
                                                else
                                                {
                                                    logger.DebugFormat("**********当前接口:{0},没有获取任何内容：{1}。", tmpcurrType, ret);
                                                }
                                            }
                                            catch (Exception ex)
                                            {
                                                logger.DebugFormat("获得:{0}.异常,Error:{1}", tmpcurrType, ex);
                                                throw ex;
                                            }
                                        }
                                        break;
                                    case 3:
                                        tmpcurrType = "3：上架结果";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********当前接口:{0},开始下载。", tmpcurrType);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********当前接口:{0},开始上传。", tmpcurrType);
                                        }
                                        break;
                                    case 4:
                                        tmpcurrType = "4:仓单获取";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********当前接口:{0},开始下载。", tmpcurrType);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********当前接口:{0},开始上传。", tmpcurrType);
                                        }
                                        break;
                                    case 5:
                                        tmpcurrType = "5：出库申请";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********当前接口:{0},开始下载。", tmpcurrType);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********当前接口:{0},开始上传。", tmpcurrType);
                                        }
                                        break;
                                    case 6:
                                        tmpcurrType = "6：出库结果";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********当前接口:{0},开始下载。", tmpcurrType);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********当前接口:{0},开始上传。", tmpcurrType);
                                        }
                                        break;
                                    case 7:
                                        tmpcurrType = "7：调货视频";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********当前接口:{0},开始下载。", tmpcurrType);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********当前接口:{0},开始上传。", tmpcurrType);
                                        }
                                        break;
                                    case 8:
                                        tmpcurrType = "8：库位视频";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********当前接口:{0},开始下载。", tmpcurrType);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********当前接口:{0},开始上传。", tmpcurrType);
                                        }
                                        break;

                                    default:
                                        tmpcurrType = item.type.ToString();
                                        break;
                                }
                            }
                            catch (Exception ex)
                            {
                                logger.Debug("##1：入库申请 2：入库结果 3：上架结果 4:仓单获取 5：出库申请 6：出库结果 7：调货视频  8：库位视频");
                                logger.DebugFormat("*******##################Type:{0} 出错，继续下个type.Error:{1}", item.type, ex.Message);
                                continue;
                            }
                        }
                    }
                    else
                    {
                        logger.DebugFormat("****没有接口资料。");
                    }
                }
            }
            catch (Exception ex)
            {
                logger.ErrorFormat("######运行出错误：{0}", ex.Message);
            }
        }
    }
}