using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using Business;

namespace UIWeb.Controllers
{
    public class EntryController : Controller
    {
        private HashtagManager hashtagManager;
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult NewEntry(Model.Entry NewEntry)
        {
            if (Session["user"] != null)
            {
                Model.User user = (Model.User)Session["user"];
                hashtagManager.AddEntry(NewEntry.message, user);
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("Index", "Login");
        }

        public EntryController()
        {
            hashtagManager = new HashtagManager();
        }
    }
}