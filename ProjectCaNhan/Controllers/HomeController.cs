using ProjectCaNhan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectCaNhan.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            Model1 db = new Model1();
            List<Product> listPro = db.Products.Take(9).ToList();
            return View(listPro);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}