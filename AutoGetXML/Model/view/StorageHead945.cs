using AutoGetXML.Model.iview;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AutoGetXML.Model.view
{
    public class StorageHead945 : iStorageHead
    {
        /// <summary>
        /// <orderDate>	预约时间	D14		是
        /// </summary>
        public string orderDate { get; set; }
        /// <summary>
        /// <custOrder>	客户订单号	C..50		否
        /// </summary>
        public string custOrder { get; set; }
        /// <summary>
        /// <contacter>	客户联系人	C..50		否
        /// </summary>
        public string contacter { get; set; }
        /// <summary>
        /// <tel>	客户联系电话	C..50		否
        /// </summary>
        public string tel { get; set; }
        /// <summary>
        /// <mobile>	客户手机	C..50		否
        /// </summary>
        public string mobile { get; set; }
        /// <summary>
        /// <carrrier>	承运商	C..50		否
        /// </summary>
        public string carrrier { get; set; }
        /// <summary>
        /// <tanspotNo>	提运单号	C..50		否
        /// </summary>
        public string tanspotNo { get; set; }
        /// <summary>
        /// <vendorCode>	制造商代码	C..30		否
        /// </summary>
        public string vendorCode { get; set; }
        /// <summary>
        /// <gwgt>	毛重（Kg）	N18,2	
        /// 货物及其包装材料的重量之和。
        /// 计算单位为千克。	否
        /// </summary>
        public string gwgt { get; set; }
        /// <summary>
        /// <nwgt>	净重（Kg）	N18,2		否
        /// </summary>
        public string nwgt { get; set; }
        /// <summary>
        /// <coo>	原产国	C..10		否
        /// </summary>
        public string coo { get; set; }

    }
}
