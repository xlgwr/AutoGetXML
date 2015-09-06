using AutoGetXML.Model.iview;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AutoGetXML.Model.view
{
    public class StorageHead940 : iStorageHead
    {
        public string orderDate { get; set; }
        public string custOrder { get; set; }
        public string contacter { get; set; }
        public string tel { get; set; }
        public string mobile { get; set; }
        /// <summary>
        /// 提货人身份证号	C..30		否
        /// </summary>
        public string pickIdentity { get; set; }
        /// <summary>
        /// 提货人兑付码	C..30		否
        /// </summary>
        public string checkCode { get; set; }

        public string carrrier { get; set; }
        public string tanspotNo { get; set; }
        public string vendorCode { get; set; }
        public string gwgt { get; set; }
        public string nwgt { get; set; }
        public string coo { get; set; }

    }
}
