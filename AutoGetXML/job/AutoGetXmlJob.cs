using AutoGetXML.Basic;
using AutoGetXML.DAL;
using AutoGetXML.Model.view;
using log4net;
using Quartz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Xml;
using System.IO;

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

            //init 
            var tmp945 = new inbound945();
            try
            {
                using (MysqlDbContext dbcontext = new MysqlDbContext())
                {
                    var tmpInterface = dbcontext.t_Interface.ToList();
                    if (tmpInterface.Count > 0)
                    {
                        //1：入库申请 2：入库结果 3：上架结果 4:仓单获取 
                        //5：出库申请 6：出库结果 7：调货视频  8：库位视频
                        logger.Debug("1：入库申请 2：入库结果 3：上架结果 4：仓单获取 5：出库申请 6：出库结果 7：调货视频  8：库位视频");

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
                                #region file path

                                var tmpFilePath = item.adjunct_address;

                                if (!string.IsNullOrEmpty(tmpFilePath))
                                {
                                    tmpFilePath = AppDomain.CurrentDomain.BaseDirectory + @"\" + tmpFilePath;
                                }
                                else
                                {
                                    tmpFilePath = AppDomain.CurrentDomain.BaseDirectory + @"\tmp";
                                }
                                if (!Directory.Exists(tmpFilePath))
                                {
                                    Directory.CreateDirectory(tmpFilePath);
                                }
                                #endregion



                                switch (item.type)
                                {
                                    #region case 1：入库申请945
                                    case 1:
                                        tmpcurrType = "1：入库申请945";

                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {

                                            logger.DebugFormat("**********##########当前接口:{0}, **开始下载** Url:{1}。", tmpcurrType, item.address);

                                            string Url = item.address;
                                            try
                                            {
                                                var ret = HttpClientHelper.GetResponse(Url);
                                                if (ret != null)
                                                {
                                                    logger.DebugFormat("***GetResponse:{0}", ret);

                                                    XmlDocument doc = new XmlDocument();
                                                    doc.LoadXml(ret);
                                                    //root=CWRE945Message
                                                    XmlNode xnroot = doc.SelectSingleNode("CWRE945Message");

                                                    //get all child node
                                                    XmlNodeList xnlist = xnroot.ChildNodes;
                                                    tmp945.messageHead = new MessageHead();
                                                    tmp945.messageBody = new MessageBody945();
                                                    tmp945.messageBody.storageHead = new StorageHead945();
                                                    tmp945.messageBody.storageLists = new List<StorageList945>();


                                                    foreach (XmlNode ix in xnlist)
                                                    {
                                                        XmlElement xe = (XmlElement)ix;
                                                        switch (xe.Name.ToLower())
                                                        {
                                                            case "messagehead":
                                                                var tmphead = tmp945.messageHead;
                                                                tmphead = comm.setXmlElementToT<MessageHead>(tmphead, xe);
                                                                break;
                                                            case "messagebody":
                                                                var tmpbody = tmp945.messageBody;
                                                                XmlNodeList xnlistbody = xe.ChildNodes;
                                                                foreach (XmlNode xbody in xnlistbody)
                                                                {
                                                                    XmlElement xebody = (XmlElement)xbody;
                                                                    switch (xebody.Name.ToLower())
                                                                    {
                                                                        case "storagehead":
                                                                            var tmpheadstore = tmpbody.storageHead;
                                                                            //set value for head
                                                                            tmpheadstore = comm.setXmlElementToT<StorageHead945>(tmpheadstore, xebody);
                                                                            break;
                                                                        case "storagelist":
                                                                            var tmpListstore = new StorageList945();
                                                                            tmpListstore = comm.setXmlElementToT<StorageList945>(tmpListstore, xebody);
                                                                            tmpbody.storageLists.Add(tmpListstore);
                                                                            break;
                                                                        default:
                                                                            break;
                                                                    }
                                                                }
                                                                break;
                                                            default:
                                                                break;
                                                        }
                                                    }
                                                    //save data to DB
                                                    //save xml to file 
                                                    var savexmlName = tmpFilePath + @"\";
                                                    if (!string.IsNullOrEmpty(tmp945.messageHead.MessageID))
                                                    {
                                                        var len = tmp945.messageHead.MessageID.Length;
                                                        savexmlName += "CWRE_" + tmp945.messageHead.MessageType + "_" + tmp945.messageHead.SenderID +
                                                            "_" + tmp945.messageHead.ReceiverID + "_" +
                                                            tmp945.messageHead.MessageID.Substring(len - 21) + ".xml";

                                                    }
                                                    else
                                                    {
                                                        savexmlName += "error_CWRE_945_" + DateTime.Now.ToString("yyyyMMddmmss") + ".xml";
                                                    }
                                                    //save
                                                    doc.Save(savexmlName);
                                                    logger.DebugFormat("*********##########当前接口:{0},保存接收xml文件成功:{1}", tmpcurrType, savexmlName);
                                                }
                                                else
                                                {
                                                    logger.DebugFormat("**********##########当前接口:{0},没有获取任何内容：{1}。", tmpcurrType, ret);
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
                                            logger.DebugFormat("**********##########当前接口:{0}, #开始上传 Url:{1}。", tmpcurrType, item.address);
                                        }
                                        break;
                                    #endregion

                                    case 2:
                                        tmpcurrType = "2：入库结果861";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0}, **开始下载** Url:{1}。", tmpcurrType, item.address);
                                        }
                                        else
                                        {
                                            var apppath = AppDomain.CurrentDomain.BaseDirectory + @"\\goods_receipt_CWRE861Message.xml";
                                            logger.DebugFormat("**********##########当前接口:{0}, Url:{1} #开始上传...", tmpcurrType, item.address);
                                            logger.DebugFormat("**********##########当前接口:{0}, #开始上传 FilePath:{1}", tmpcurrType, apppath);

                                            string Url = item.address;
                                            try
                                            {
                                                XmlDocument doc = new XmlDocument();
                                                //XmlReaderSettings settings = new XmlReaderSettings();
                                                //settings.IgnoreComments = true;//忽略文档里面的注释
                                                //XmlReader reader = XmlReader.Create(ret, settings);
                                                doc.Load(apppath);

                                                //reader.Close();

                                                var ret = HttpClientHelper.PostResponse(Url, doc.InnerXml);
                                                if (ret != null)
                                                {
                                                    logger.DebugFormat("***PostResponse:{0}", ret);
                                                }
                                                else
                                                {
                                                    logger.DebugFormat("**********##########当前接口:{0},没有获取任何内容：{1}。", tmpcurrType, ret);
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
                                            logger.DebugFormat("**********##########当前接口:{0}, **开始下载** Url:{1}。", tmpcurrType, item.address);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0}, #开始上传 Url:{1}。", tmpcurrType, item.address);
                                        }
                                        break;
                                    case 4:
                                        tmpcurrType = "4：仓单获取";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0}, **开始下载** Url:{1}。", tmpcurrType, item.address);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0}, #开始上传 Url:{1}。", tmpcurrType, item.address);
                                        }
                                        break;
                                    case 5:
                                        tmpcurrType = "5：出库申请";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0}, **开始下载** Url:{1}。", tmpcurrType, item.address);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0}, #开始上传 Url:{1}。", tmpcurrType, item.address);
                                        }
                                        break;
                                    case 6:
                                        tmpcurrType = "6：出库结果";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0}, **开始下载** Url:{1}。", tmpcurrType, item.address);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0}, #开始上传 Url:{1}。", tmpcurrType, item.address);
                                        }
                                        break;
                                    case 7:
                                        tmpcurrType = "7：调货视频";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0}, **开始下载** Url:{1}。", tmpcurrType, item.address);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0}, #开始上传 Url:{1}。", tmpcurrType, item.address);
                                        }
                                        break;
                                    case 8:
                                        tmpcurrType = "8：库位视频";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0}, **开始下载** Url:{1}。", tmpcurrType, item.address);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0}, #开始上传 Url:{1}。", tmpcurrType, item.address);
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