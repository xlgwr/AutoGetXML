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

                                switch (item.type)
                                {
                                    #region case 1：入库申请945
                                    case 1:
                                        tmpcurrType = "1：入库申请945";

                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0},Url:{1}  开始下载。", tmpcurrType, item.address);

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
                                                    XmlNode xn = doc.SelectSingleNode("CWRE945Message");

                                                    //get all child node
                                                    XmlNodeList xnlist = xn.ChildNodes;
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
                                                                //tmphead.MessageID = xe.GetElementsByTagName("MessageID").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                //tmphead.MessageType = xe.GetElementsByTagName("MessageType").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                //tmphead.OrgCode = xe.GetElementsByTagName("OrgCode").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                //tmphead.ReceiverID = xe.GetElementsByTagName("ReceiverID").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                //tmphead.SenderID = xe.GetElementsByTagName("SenderID").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                //tmphead.SendTime = xe.GetElementsByTagName("SendTime").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                //tmphead.Sign = xe.GetElementsByTagName("Sign").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                //tmphead.SignerInfo = xe.GetElementsByTagName("SignerInfo").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                //tmphead.Version = xe.GetElementsByTagName("Version").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                //init
                                                                //tmp945.messageHead = tmphead;
                                                                tmphead = comm.setXmlElementToT<MessageHead>(tmphead, xe);
                                                                break;
                                                            case "messagebody":
                                                                var tmpbody = tmp945.messageBody;// new MessageBody945();
                                                                XmlNodeList xnlistbody = xe.ChildNodes;
                                                                foreach (XmlNode xbody in xnlistbody)
                                                                {
                                                                    XmlElement xebody = (XmlElement)xbody;
                                                                    switch (xebody.Name.ToLower())
                                                                    {
                                                                        case "storagehead":
                                                                            var tmpheadstore = tmpbody.storageHead;// new StorageHead();
                                                                            tmpheadstore.appNO = xe.GetElementsByTagName("appNO").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.appStatus = xe.GetElementsByTagName("appStatus").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.appTime = xe.GetElementsByTagName("appTime").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.appType = xe.GetElementsByTagName("appType").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.appUid = xe.GetElementsByTagName("appUid").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.appUname = xe.GetElementsByTagName("appUname").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.carrrier = xe.GetElementsByTagName("carrrier").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.contacter = xe.GetElementsByTagName("contacter").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.coo = xe.GetElementsByTagName("coo").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.custOrder = xe.GetElementsByTagName("custOrder").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.gwgt = xe.GetElementsByTagName("gwgt").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.mobile = xe.GetElementsByTagName("mobile").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.note = xe.GetElementsByTagName("note").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.nwgt = xe.GetElementsByTagName("nwgt").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.orderDate = xe.GetElementsByTagName("orderDate").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.tanspotNo = xe.GetElementsByTagName("tanspotNo").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.tel = xe.GetElementsByTagName("tel").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpheadstore.vendorCode = xe.GetElementsByTagName("vendorCode").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            //set value for head
                                                                            // tmpbody.storageHead = tmpheadstore;
                                                                            break;
                                                                        case "storagelist":
                                                                            var tmpListstore = new StorageList945();
                                                                            tmpListstore.ctnno = xe.GetElementsByTagName("ctnno").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpListstore.itemNo = xe.GetElementsByTagName("itemNo").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpListstore.materialCode = xe.GetElementsByTagName("materialCode").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpListstore.package = xe.GetElementsByTagName("package").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpListstore.pc = xe.GetElementsByTagName("pc").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpListstore.qty = xe.GetElementsByTagName("qty").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpListstore.quanlity = xe.GetElementsByTagName("quanlity").Item(0).InnerText.Replace("\n\r", "").Trim();
                                                                            tmpListstore.unit = xe.GetElementsByTagName("unit").Item(0).InnerText.Replace("\n\r", "").Trim();

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
                                            logger.DebugFormat("**********##########当前接口:{0},Url:{1}  开始上传。", tmpcurrType, item.address);
                                        }
                                        break;
                                    #endregion

                                    case 2:
                                        tmpcurrType = "2：入库结果861";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0},Url:{1}  开始下载。", tmpcurrType, item.address);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0},Url:{1}  开始上传。", tmpcurrType, item.address);

                                            string Url = item.address;
                                            try
                                            {
                                                XmlDocument doc = new XmlDocument();
                                                //XmlReaderSettings settings = new XmlReaderSettings();
                                                //settings.IgnoreComments = true;//忽略文档里面的注释
                                                //XmlReader reader = XmlReader.Create(ret, settings);
                                                var apppath = AppDomain.CurrentDomain.BaseDirectory + @"\\goods_receipt_CWRE861Message.xml";
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
                                            logger.DebugFormat("**********##########当前接口:{0},Url:{1}  开始下载。", tmpcurrType, item.address);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0},Url:{1}  开始上传。", tmpcurrType, item.address);
                                        }
                                        break;
                                    case 4:
                                        tmpcurrType = "4：仓单获取";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0},Url:{1}  开始下载。", tmpcurrType, item.address);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0},Url:{1}  开始上传。", tmpcurrType, item.address);
                                        }
                                        break;
                                    case 5:
                                        tmpcurrType = "5：出库申请";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0},Url:{1}  开始下载。", tmpcurrType, item.address);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0},Url:{1}  开始上传。", tmpcurrType, item.address);
                                        }
                                        break;
                                    case 6:
                                        tmpcurrType = "6：出库结果";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0},Url:{1}  开始下载。", tmpcurrType, item.address);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0},Url:{1}  开始上传。", tmpcurrType, item.address);
                                        }
                                        break;
                                    case 7:
                                        tmpcurrType = "7：调货视频";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0},Url:{1}  开始下载。", tmpcurrType, item.address);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0},Url:{1}  开始上传。", tmpcurrType, item.address);
                                        }
                                        break;
                                    case 8:
                                        tmpcurrType = "8：库位视频";
                                        //0：下载  1：上传
                                        if (item.downtype == 0)
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0},Url:{1}  开始下载。", tmpcurrType, item.address);
                                        }
                                        else
                                        {
                                            logger.DebugFormat("**********##########当前接口:{0},Url:{1}  开始上传。", tmpcurrType, item.address);
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