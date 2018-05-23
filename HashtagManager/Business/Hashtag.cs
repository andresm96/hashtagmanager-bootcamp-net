using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data.Entity;

namespace Business
{
    public class Hashtag
    {
        HashtagManagerModel _db;

        public Hashtag(HashtagManagerModel DBinstance)
        {
            _db = DBinstance;
        }

        /// <summary>
        /// Store a new hashtag in the DB.
        /// </summary>
        /// <param name="hashtag">The new Hashtag</param>
        /// <returns>The new ID</returns>
        public int AddHashtag(Model.Hashtag hashtag)
        {
            hashtag.ID = this.GetLastId() + 1;
            _db.Hashtags.Add(hashtag);
            _db.SaveChanges();
            return hashtag.ID;
        }

        /// <summary>
        /// Store a list of hashtags in the DB.
        /// </summary>
        /// <param name="hashtags">A list of Hashtags</param>
        public List<Model.Hashtag> AddHashtag(List<Model.Hashtag> hashtags)
        {
            _db.Hashtags.AddRange(hashtags);
            _db.SaveChanges();
            return hashtags;
        }

        /// <summary>
        /// Get the hashtag's ID searching by name
        /// </summary>
        /// <param name="hashtagName">Hashtag's name</param>
        /// <returns>The Id</returns>
        public int GetHashtagIdByHashtagName(String hashtagName)
        {
            return _db.Hashtags.Where(x => x.name == hashtagName).Select(x => x.ID).FirstOrDefault();
        }

        /// <summary>
        /// Check if the hashtags exists in the DB
        /// </summary>
        /// <param name="hashtagName">The hashtag's name</param>
        /// <returns>True if the hashtag is in the DB</returns>
        public bool Exists(string hashtagName)
        {
            return _db.Hashtags.Any(x => x.name == hashtagName);
        }

        /// <summary>
        /// Get the last hashtag's ID in the DB
        /// </summary>
        /// <returns>The id</returns>
        public int GetLastId()
        {
            var query = _db.Hashtags.OrderByDescending(h => h.ID).FirstOrDefault();
            return query.ID;
        }
    }
}
