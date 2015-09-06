using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AutoGetXML.Model.view
{
    public class StorageList945
    {
        /// <summary>
        /// <itemNo>	入库序号	C..20		是
        /// </summary>
        public string itemNo { get; set; }
        /// <summary>
        /// <materialCode>	企业商品货号
        /// C..20	20位以内的企业自定义唯一编号	是
        /// </summary>
        public string materialCode { get; set; }
        /// <summary>
        /// <pc>	批次	C..30	商品生产批次号	否
        /// </summary>
        public string pc { get; set; }
        /// <summary>
        /// <unit>	计量单位	C..10		是
        /// </summary>
        public string unit { get; set; }
        /// <summary>
        /// <qty>	数量	N18,2		是
        /// </summary>
        public string qty { get; set; }
        /// <summary>
        /// <quanlity>	品质	C..30		否
        /// </summary>
        public string quanlity { get; set; }
        /// <summary>
        /// <ctnno>	箱号	C..30		否
        /// </summary>
        public string ctnno { get; set; }
        /// <summary>
        /// <package>	包装种类	C..5		否
        /// </summary>
        public string package { get; set; }

    }
}
