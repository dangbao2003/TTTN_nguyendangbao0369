using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webtgdd.Context;
using PagedList;

namespace webtgdd.Controllers
{
    public class CategoryController : Controller
    {
        webtgddEntities objwebtgddEntities = new webtgddEntities();

        // GET: Category
        public ActionResult Index(int? page)
        {
            int pageSize = 6; // Number of products per page
            int pageNumber = (page ?? 1);

            var lstCategory = objwebtgddEntities.Categories.OrderBy(c => c.Id).ToList();

            var pagedList = lstCategory.ToPagedList(pageNumber, pageSize);

            return View(pagedList);
        }

        public ActionResult ProductCategory(int Id)
        {
            var listProduct = objwebtgddEntities.Products.Where(n => n.CategoryId == Id).ToList();
            return View(listProduct);
        }
    }
}
