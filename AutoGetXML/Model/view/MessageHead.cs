using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AutoGetXML.Model.view
{
    public class MessageHead
    {
        public string MessageID { get; set; }
        public string MessageType { get; set; }
        public string OrgCode { get; set; }
        public string SenderID { get; set; }
        public string ReceiverID { get; set; }
        public string SendTime { get; set; }
        public string Version { get; set; }
        public string SignerInfo { get; set; }
        public string Sign { get; set; }
    }
}
