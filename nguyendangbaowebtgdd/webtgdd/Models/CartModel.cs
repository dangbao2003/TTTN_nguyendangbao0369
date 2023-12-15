using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using webtgdd.Context;

namespace webtgdd.Models
{
    public class CartModel
    {
        public Product Product { get; set; }
        public int Quantity { get; set; }
    }
}