using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectCaNhan.Models
{
    public class CartItem
    {
        public int productId { set; get; }
        public string name { set; get; }
        public int quantity { set; get; }
        public string image { set; get; }
        public int price { set; get; }
        public double total
        {
            get { return quantity * price; }
        }

    }
    public class CartItem1
    {
        public int productId { set; get; }
        public int quantity { set; get; }
    }
}