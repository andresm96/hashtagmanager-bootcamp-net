using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace BusinessTest
{
    public class UserTest
    {
        public void LoginTest()
        {
            //arrange
            Business.User userBusiness = new User(HashtagManagerModel.Instance);
            Model.User loginUser = new Model.User();
            loginUser.ID = 1;
            loginUser.userName = "admin";
            loginUser.password = "admin";
            Model.User u = new Model.User();

            //act
            u = userBusiness.Login(loginUser);

            //assert
            Assert.AreEqual(loginUser.ID, u.ID);

        }
    }
}
