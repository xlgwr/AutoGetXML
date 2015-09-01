using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace AutoGetXML.Model
{
    public class m_Parameter
    {
        [Key]
        [StringLength(16)]
        public string paramkey { get; set; }

        [Required]
        [StringLength(16)]
        public string paramvalue { get; set; }
        public string remark { get; set; }

        public int paramtype { get; set; }
        public string adduser { get; set; }
        public string upduser { get; set; }
        public DateTime addtime { get; set; }
        public DateTime updtime { get; set; }
        public string org_no { get; set; }



    }
}
