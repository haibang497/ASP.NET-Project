using Newtonsoft.Json;
using ProjectCaNhan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ProjectCaNhan.Controllers
{
    public class CartController : Controller
    {
        Model1 db = new Model1();
        private const string CartSession = "CartSession";
        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }
        public ActionResult AddItem(int productId, int quantity, string name, int price)
        {
            var cart = Session[CartSession];
            if (cart != null)
            {
                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.productId == productId))
                {
                    foreach(var item in list)
                    {
                        if (item.productId == productId)
                        {
                            item.quantity += quantity;
                        }
                    }
                }
                else
                {
                    var item = new CartItem();
                    item.productId = productId;
                    item.name = name;
                    item.quantity = quantity;
                    item.price = price;
                    list.Add(item);
                }
                Session[CartSession] = list;
            }
            else
            {
                var item = new CartItem();
                item.productId = productId;
                item.name = name;
                item.quantity = quantity;
                item.price = price;
                var list = new List<CartItem>();
                list.Add(item);

                Session[CartSession] = list;
            }
            return RedirectToAction("Index");
        }
        //[HttpPost]
        //public ActionResult UpdateCart(int newQuantity, CartItem cart)
        //{
        //    CartItem updatedCart=(from c in cart.quantity
        //                         where c.quantity)

        //    return Json(cart);
        //}

        public ActionResult updatedCart(int id, int newQuantity)
        {
            // tìm carditem muon sua
            List<CartItem> cart = Session["CartSession"] as List<CartItem>;
            CartItem updatedCart = cart.FirstOrDefault(m => m.productId == id);
            if (updatedCart != null)
            {
                updatedCart.quantity = newQuantity;
            }
            return RedirectToAction("Index");

        }
        public ActionResult DeleteCart(int id)
        {
            List<CartItem> cart = Session["CartSession"] as List<CartItem>;
            CartItem deletedCart = cart.FirstOrDefault(m => m.quantity == id);
            if (deletedCart != null)
            {
                cart.Remove(deletedCart);
            }
            return RedirectToAction("Index");
        }
        public ActionResult Payment()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }
        public ActionResult OrderProccess(FormCollection f)
        {
            List<CartItem> listcart = Session["CartSession"] as List<CartItem>;
            Bill bill = new Bill()
            {
                CustomerName = f["customerName"],
                Address = f["address"],
                DayOrder = DateTime.Now,
                Status = "Proccessing...."
            };
            db.Bills.Add(bill);
            db.SaveChanges();
            foreach(CartItem cart in listcart)
            {
                BillsDetail billDetail = new BillsDetail()
                {
                    Bill_ID = bill.Bill_ID,
                    Product_ID = cart.productId,
                    Quantity = cart.quantity,
                    Price = cart.price,
                    ProName = cart.name
                };
                db.BillsDetails.Add(billDetail);
                db.SaveChanges();
            }
            Session.Remove(CartSession);
            return View("OrderProccess");
        }
    }
}