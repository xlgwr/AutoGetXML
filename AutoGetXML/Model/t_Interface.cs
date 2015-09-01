using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace AutoGetXML.Model
{
    public class t_Interface
    {

        /// <summary>
        ///   //记录ID
        /// </summary>
        [Key]
        [Required]
        public int recd_id { get; set; }


        /// <summary>
        ///  //接口地址
        /// </summary>
        //[Required]
        [StringLength(128)]
        public string address { get; set; }


        /// <summary>
        ///  接口区分
        /// 1：入库申请 2：入库结果 3：上架结果 4:仓单获取  5：出库申请 6：出库结   
        /// </summary>
        [Required]
        public int type { get; set; }


        /// <summary>
        ///  //下载/上传时间
        /// </summary>
        [StringLength(16)]
        public string downtime { get; set; }


        /// <summary>
        ///   //下载区分 0：下载  1：上传
        /// </summary>
        [Required]
        public int downtype { get; set; }


        /// <summary>
        /// //附件地址
        /// </summary>
        [StringLength(128)]
        public string adjunct_address { get; set; }

        /// <summary>
        /// 附件值
        /// </summary>
        [StringLength(128)]
        public string adjunct_value { get; set; }

        [StringLength(256)]
        public string remark { get; set; }


        /// <summary>
        /// 0：自动 1：手动 状态
        /// </summary>
        /// 
        [Required]
        public int status { get; set; }

    }
}
