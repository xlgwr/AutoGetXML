using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AutoGetXML.Model.view
{
    public class MessageBody940
    {
        public StorageHead940 storageHead { get; set; }
        public IList<StorageList940> storageLists { get; set; }
    }
}
