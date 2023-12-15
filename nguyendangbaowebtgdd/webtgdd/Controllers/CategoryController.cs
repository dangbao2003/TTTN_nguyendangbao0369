using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webtgdd.Context;

namespace webtgdd.Controllers
{
    public class CategoryController : Controller
    {
        webtgddEntities objwebtgddEntities = new webtgddEntities();
        // GET: Category
        public ActionResult Index()
        {
            var lstCategory = objwebtgddEntities.Categories.ToList();
            return View(lstCategory);
        }
        public ActionResult ProductCategory(int Id)
        {
            var listProduct = objwebtgddEntities.Products.Where(n => n.CategoryId == Id).ToList();
            return View(listProduct);
        }
    }
}