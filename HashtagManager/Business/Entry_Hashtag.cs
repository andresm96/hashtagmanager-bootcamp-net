using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class Entry_Hashtag
    {
        HashtagManagerModel _db;

        public Entry_Hashtag(HashtagManagerModel DBinstance)
        {
            _db = DBinstance;
        }

        /// <summary>
        /// Update the relation many-to-many (entries with hashtags) in the DB
        /// </summary>
        /// <param name="id_entry">Entry's ID</param>
        /// <param name="id_hashtag">Hashtag's ID</param>
        public void AddEntryHashtag(int id_entry, int id_hashtag)
        {
            var entry = new SqlParameter("@id_entry", id_entry);
            var hashtag = new SqlParameter("@id_hashtag", id_hashtag);
            var query = _db.Database.ExecuteSqlCommand("pub_Insert_entry_hashtag @id_entry, @id_hashtag", entry, hashtag);
        }
    }
}
