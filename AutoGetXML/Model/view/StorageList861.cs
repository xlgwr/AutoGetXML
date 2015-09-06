using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AutoGetXML.Model.view
{
    public class StorageList861
    {
        public string itemNo { get; set; }
        public string materialCode { get; set; }
        /// <summary>
        /// 净重	N18,2
        /// </summary>
        public string nwgt { get; set; }
        /// <summary>
        /// 毛重	N18,2
        /// </summary>
        public string gwgt { get; set; }
        public string qty { get; set; }
        /// <summary>
        /// 已入数量	N18,2
        /// </summary>
        public string qty2 { get; set; }
        /// <summary>
        /// 箱号	C..30
        /// </summary>
        public string ctnno { get; set; }
        /// <summary>
        /// 库位	C..30
        /// </summary>
        public string cellNo { get; set; }
        /// <summary>
        /// 录像开始时间	D17	格式：yyyyMMddHHmmssSSS	否
        /// </summary>
        public string scanBegin { get; set; }
        /// <summary>
        /// 录像结束时间	D17	格式：yyyyMMddHHmmssSSS
        /// </summary>
        public string scanEnd { get; set; }

    }
}
