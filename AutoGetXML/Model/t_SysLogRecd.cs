using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
namespace AutoGetXML.Model
{
  public  class t_SysLogRecd
    {
      [Key]
      [Required]
      public int log_id { get; set; }
    }
}
