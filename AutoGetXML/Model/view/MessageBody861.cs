using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AutoGetXML.Model.view
{
    public class MessageBody861
    {
        public StorageHead861 storageHead { get; set; }
        public IList<StorageList861> storageLists { get; set; }
    }
}
