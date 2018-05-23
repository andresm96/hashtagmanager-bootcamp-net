using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace Business
{
    public class Entry
    {
        HashtagManagerModel _db;

        public Entry(HashtagManagerModel DBinstance)
        {
            _db = DBinstance;
        }

        /// <summary>
        /// Get all the entries in the DB
        /// </summary>
        /// <returns>A List with all the entries.</returns>
        public List<Model.Entry> GetAll()
        {
            var query = _db.Entries.SqlQuery("pub_GetAllEntries");
            return query.ToList();
        }

        /// <summary>
        /// Add a new entry.
        /// </summary>
        /// <param name="entry">Entry to be stored.</param>
        /// <returns>Returns the same entry stored.</returns>
        public Model.Entry AddEntry(Model.Entry entry)
        {
            int id = this.GetLastId();
            entry.ID = id + 1;
            entry.date = DateTime.Now;
            _db.Entries.Add(entry);
            _db.SaveChanges();
            return entry;
        }

        /// <summary>
        /// Get the last Entry ID in the DB.
        /// </summary>
        /// <returns>An int with the id.</returns>
        public int GetLastId()
        {
            var query = _db.Entries.OrderByDescending(e => e.ID).FirstOrDefault();
            return query.ID;
        }

        /// <summary>
        /// Get the entries that contains the hashtag.
        /// </summary>
        /// <param name="hashtagName">The name of the hashtag</param>
        /// <returns>List of entries that contains the hashtag.</returns>
        public List<Model.Entry> GetEntriesByHashtagName(String hashtagName)
        {
            var name = new SqlParameter("@Param1", hashtagName);
            var query = _db.Entries.SqlQuery("pub_GetEntriesByHashtagName @Param1", name);
            return query.ToList();
        }

        /// <summary>
        /// Chech if the message has hashtags
        /// </summary>
        /// <param name="message">The entry's message</param>
        /// <returns>A boolean that specify if the entry has hashtags.</returns>
        public bool HasHashtags(string message)
        {
            int position = message.IndexOf("#");
            if (position == -1)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// Extracts the hashtags from the entry message.
        /// </summary>
        /// <param name="message">The entry's message</param>
        /// <returns>A List of Hashtags</returns>
        public List<Model.Hashtag> GetHashtags(string message)
        {
            string[] words;
            List<Model.Hashtag> hashtags = new List<Model.Hashtag>();
            words = message.Split(new string[] { " " }, StringSplitOptions.RemoveEmptyEntries);
            int position;
            Model.Hashtag hashtag;
            for (int i = 0; i < words.Length; i++)
            {
                position = words[i].IndexOf("#");
                if (position == 0)
                {
                    hashtag = new Model.Hashtag();
                    hashtag.name = words[i];
                    hashtags.Add(hashtag);
                }
            }
            return hashtags;
        }
    }
}
