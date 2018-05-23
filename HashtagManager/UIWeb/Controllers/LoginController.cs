using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using Business;

namespace UIWeb.Controllers
{
    public class LoginController : Controller
    {
        private HashtagManager hashtagManager;

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Model.User currentUser)
        {
            Model.User user = hashtagManager.Login(currentUser);
            if (user != null)
            {
                currentUser = user;
                Session["user"] = currentUser;
                return RedirectToAction("Index", "Home");

            }
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Logout()
        {
            Session["user"] = null;
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }

        public LoginController()
        {
            hashtagManager = new HashtagManager();
        }
    }
}