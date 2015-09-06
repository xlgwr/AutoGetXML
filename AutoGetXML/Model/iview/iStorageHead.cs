using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AutoGetXML.Model.iview
{
    public class iStorageHead
    {
        /// <summary>
        /// <appType>	申报类型	C1	
        /// 申报类型：1-新增 2-变更，
        /// 默认为1（变更可以作为上架）	是
        /// </summary>
        public string appType { get; set; }
        /// <summary>
        /// <appTime>	申报时间	
        /// D14	格式：yyyyMMddHHmmss	是
        /// </summary>
        public string appTime { get; set; }
        /// <summary>
        /// <appStatus>	业务状态	C1	
        /// 业务状态：1-暂存，2-申报，默认为2	是
        /// </summary>
        public string appStatus { get; set; }
        /// <summary>
        /// <appUid>	用户编号	
        /// C..48	申请人代码	是
        /// </summary>
        public string appUid { get; set; }
        /// <summary>
        /// <appUname>	用户名称	
        /// C..20	申请人名称	是
        /// </summary>
        public string appUname { get; set; }
        /// <summary>
        /// <appNO>	预约申请单号	C12		是
        /// </summary>
        public string appNO { get; set; }    

        /// <summary>
        /// <note>	备注	C..1000		否
        /// </summary>
        public string note { get; set; }

    }
}
