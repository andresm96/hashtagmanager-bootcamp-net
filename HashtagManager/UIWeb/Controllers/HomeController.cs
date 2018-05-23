using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Business;
using Model;

namespace UIWeb.Controllers
{
    public class HomeController : Controller
    {
        private HashtagManager hashtagManager;

        public ActionResult Index()
        {
            List<Model.Entry> entries = hashtagManager.GetAllEntries();
            return View(entries);
        }

        public ActionResult Search(Model.Hashtag hashtag)
        {
            List<Model.Entry> entries = hashtagManager.GetEntriesByHashtagName(hashtag.name);
            return View("Index", entries);
        }

        public HomeController()
        {
            hashtagManager = new HashtagManager();
        }
    }
}