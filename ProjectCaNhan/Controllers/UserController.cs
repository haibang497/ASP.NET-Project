using ProjectCaNhan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace ProjectCaNhan.Controllers
{
    public class UserController : Controller
    {
        Model1 db = new Model1();
        // GET: User
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(CustomerModel customerModel)
        {
            ViewBag.Success = "";
            if(ModelState.IsValid)
            {
                Customer cus = new Customer();
                cus.Username = customerModel.Username;
                cus.Password = customerModel.Password;
                cus.Name = customerModel.Name;
                cus.Email = customerModel.Email;
                cus.Phone = customerModel.Phone;
                cus.Address = customerModel.Address;

                SHA256 encode = new SHA256CryptoServiceProvider();
                Byte[] originalBytes = ASCIIEncoding.Default.GetBytes(cus.Password);
                Byte[] encodedBytes = encode.ComputeHash(originalBytes);
                cus.Password = BitConverter.ToString(encodedBytes);

                var checkUsername = (from p in db.Customers
                                     where p.Username == customerModel.Username
                                     select p).SingleOrDefault();
                if(checkUsername!=null)
                {
                    ViewBag.ErrorUsername = "Username has aldready exited";
                    return View();
                }

                var checkEmail = (from p in db.Customers
                                  where p.Email == customerModel.Email
                                  select p).SingleOrDefault();
                if(checkEmail!=null)
                {
                    ViewBag.ErrorEmail = "Email has aldready exited";
                    return View();
                }
                db.Customers.Add(cus);
                db.SaveChanges();
                ViewBag.Success = "Success!";
            }
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection form)
        {
            if(ModelState.IsValid)
            {
                string username = form["TxtUsername"].ToString();
                string password = form["TxtPassWord"].ToString();

                SHA256 md5 = new SHA256CryptoServiceProvider();
                Byte[] originalBytes = ASCIIEncoding.Default.GetBytes(password);
                Byte[] encodedBytes = md5.ComputeHash(originalBytes);
                password = BitConverter.ToString(encodedBytes);

                Customer cus = db.Customers.SingleOrDefault(p => p.Username == username && p.Password == password);

                if(cus!=null)
                {
                    Session["user"] = cus.Name;

                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", "Login is not unacceptable");
                    ViewBag.Error = "Username or Password don't correct";
                    return View();
                }
            }
            return View();
        }
        public ActionResult Logout()
        {
            Session["user"] = null;
            return RedirectToAction("Index", "Home");
        }
    }
}