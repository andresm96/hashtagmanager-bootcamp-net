using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Entry_Hashtag
    {
        public int id_entry { get; set; }
        public int id_hashtag { get; set; }

        public Entry_Hashtag()
        { }

        public Entry_Hashtag(int id_entry, int id_hashtag)
        {
            this.id_entry = id_entry;
            this.id_hashtag = id_hashtag;
        }
    }
}
