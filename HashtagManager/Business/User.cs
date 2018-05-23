using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data.SqlClient;

namespace Business
{
    public class User
    {
        HashtagManagerModel _db;

        public User(HashtagManagerModel DBinstance)
        {
            _db = DBinstance;
        }

        /// <summary>
        /// User Authentication
        /// </summary>
        /// <param name="user">User to be validated</param>
        /// <returns>The user if login succeds</returns>
        public Model.User Login(Model.User user)
        {
            var userName = new SqlParameter("@User", user.userName);
            var pass = new SqlParameter("@Password", user.password);
            var query = _db.Users.SqlQuery("pub_ValidateUser @User, @Password", userName, pass);
            return query.FirstOrDefault();
        }

    }
}
