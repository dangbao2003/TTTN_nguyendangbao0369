using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webtgdd.Context;

namespace webtgdd.Controllers
{
    public class ProductController : Controller
    {
        webtgddEntities objwebtgddEntities = new webtgddEntities();
        // GET: Product
        public ActionResult Detail(int Id)
        {
            var objProduct = objwebtgddEntities.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }

        public ActionResult All()
        {
            var lstProduct = objwebtgddEntities.Products.ToList();
            return View(lstProduct);
        }
        
    }
}