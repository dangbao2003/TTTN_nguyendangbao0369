using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using webtgdd.Context;

namespace webtgdd.Controllers
{
    public class ProductController : Controller
    {
        private webtgddEntities objwebtgddEntities = new webtgddEntities();
        private const int PageSize = 10; // Number of products per page

        // GET: Product/Detail/Id
        public ActionResult Detail(int Id)
        {
            var objProduct = objwebtgddEntities.Products.FirstOrDefault(n => n.Id == Id);
            return View(objProduct);
        }

        // GET: Product/All?page=1
        public ActionResult All(int? page)
        {
            var pageNumber = page ?? 1;
            var lstProduct = objwebtgddEntities.Products.ToList().ToPagedList(pageNumber, PageSize);

            return View(lstProduct);
        }
        public ActionResult AllBrand(int? page)
        {
            var pageNumber = page ?? 1;
            var lstProduct = objwebtgddEntities.Products.ToList().ToPagedList(pageNumber, PageSize);

            return View(lstProduct);
        }
    }
}
