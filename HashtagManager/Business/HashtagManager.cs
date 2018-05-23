using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace Business
{
    public class HashtagManager
    {
        private HashtagManagerModel _db = HashtagManagerModel.Instance;
        private Entry entryBusiness;
        private User userBusiness;
        private Hashtag hashtagBusiness;
        private Entry_Hashtag entryHashtagBusiness;

        private List<Model.User> users;

        public HashtagManager()
        {
            entryBusiness = new Entry(_db);
            userBusiness = new User(_db);
            hashtagBusiness = new Hashtag(_db);
            entryHashtagBusiness = new Entry_Hashtag(_db);

            users = new List<Model.User>();
        }

        /// <summary>
        /// Get all entries from the DB.
        /// </summary>
        /// <returns>A list of entry</returns>
        public List<Model.Entry> GetAllEntries()
        {
            return entryBusiness.GetAll();
        }

        /// <summary>
        /// Add a new entry to the DB
        /// </summary>
        /// <param name="message">Entry's message</param>
        /// <param name="user">User who created the new entry</param>
        public void AddEntry(string message, Model.User user)
        {
            Model.Entry currentEntry = new Model.Entry();
            currentEntry.message = message;
            currentEntry.User = user;
            entryBusiness.AddEntry(currentEntry);
            if (entryBusiness.HasHashtags(message))
            {
                List<Model.Hashtag> hashtags = new List<Model.Hashtag>();
                hashtags = entryBusiness.GetHashtags(message);
                List<Model.Hashtag> newHashtags = new List<Model.Hashtag>();
                List<Model.Entry_Hashtag> entry_hashtags = new List<Model.Entry_Hashtag>();
                int lastId = hashtagBusiness.GetLastId() + 1;
                foreach (var hash in hashtags)
                {
                    if (!(hashtagBusiness.Exists(hash.name)))
                    {
                        hash.ID = lastId;
                        newHashtags.Add(hash);
                        lastId++;
                    }
                    else
                    {
                        hash.ID = hashtagBusiness.GetHashtagIdByHashtagName(hash.name);
                    }
                }
                hashtags.AddRange(hashtagBusiness.AddHashtag(newHashtags));
                foreach (var hash in hashtags)
                {
                    entryHashtagBusiness.AddEntryHashtag(currentEntry.ID, hash.ID);
                }
            }
        }

        /// <summary>
        /// Get all the entries linked with a specific hashtag
        /// </summary>
        /// <param name="hashtagName">Hashtag's name</param>
        /// <returns>A list of entry</returns>
        public List<Model.Entry> GetEntriesByHashtagName(String hashtagName)
        {
            return entryBusiness.GetEntriesByHashtagName(hashtagName);
        }

        public Model.User Login(Model.User user)
        {
            return userBusiness.Login(user);
        }
    }
}
