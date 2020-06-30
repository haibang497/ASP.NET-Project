using ProjectCaNhan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectCaNhan.Controllers
{
    public class ProductController : Controller
    {
        Model1 db = new Model1();
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Detail(int ID)
        {
            Product pro = db.Products.Where(i => i.ID == ID).SingleOrDefault();
            return View(pro);
        }
        [ChildActionOnly]
        public ActionResult Category()
        {
            List<Category> cate = db.Categories.ToList();
            return PartialView(cate);
        }
        [ChildActionOnly]
        public ActionResult SaleProduct()
        {
            List<Product> proSale = (from p in db.Products
                                     where p.Status == 1
                                     select p).ToList();
            return PartialView(proSale);
        }
        public ActionResult allProduct(int cateID)
        {
            List<Product> proList = (from m in db.Products
                                     where m.CateID == cateID
                                     select m).ToList();
            return View(proList);
        }
    }
}