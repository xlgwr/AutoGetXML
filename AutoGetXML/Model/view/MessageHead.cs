using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AutoGetXML.Model.view
{
    public class MessageHead
    {
        /// <summary>
        /// 报文唯一编号 C..48 用于唯一标识报文，
        /// "CWRE945"+"15位组代"+"yyyyMMddHHmmssSSS"+"4位流水号"
        /// </summary>
        public string MessageID { get; set; }
        /// <summary>
        /// <MessageType>
        /// 报文类型	
        /// C6	CWRE945-入库单	是
        /// </summary>
        public string MessageType { get; set; }
        /// <summary>
        /// <OrgCode >	企业组织机构代码
        /// C..20	CWRE15090100001	是
        /// </summary>
        public string OrgCode { get; set; }
        /// <summary>
        /// <SenderID>	发送方	C..18		是
        /// </summary>
        public string SenderID { get; set; }
        /// <summary>
        /// <ReceiverID>	接收方	C..18		是
        /// </summary>
        public string ReceiverID { get; set; }
        /// <summary>
        /// <SendTime>	发送时间	
        /// D17	格式：yyyyMMddHHmmssSSS	是
        /// </summary>
        public string SendTime { get; set; }
        /// <summary>
        /// <Version>	版本号	C3	默认“1.0”	是
        /// </summary>
        public string Version { get; set; }
        /// <summary>
        /// <SignerInfo>	证书号		保留空节点	留空
        /// </summary>
        public string SignerInfo { get; set; }
        /// <summary>
        /// <Sign>	加签信息		保留空节点	留空
        /// </summary>
        public string Sign { get; set; }
    }
}
