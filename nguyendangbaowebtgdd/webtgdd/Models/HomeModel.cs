using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using webtgdd.Context;

namespace webtgdd.Models
{
    public class HomeModel
    {
       public List<Product> ListProducts { get; set; }
       public List<Category> ListCategory { get; set; }

    }

}