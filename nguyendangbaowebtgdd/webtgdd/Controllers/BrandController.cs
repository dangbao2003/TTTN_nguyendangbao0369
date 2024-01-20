using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using webtgdd.Context;

namespace webtgdd.Controllers
{
    public class BrandController : Controller
    {
        webtgddEntities objwebtgddEntities = new webtgddEntities();
        // GET: Brand
        public ActionResult Index(int? page)
        {
            int pageSize = 6; // Number of products per page
            int pageNumber = (page ?? 1);

            var lstBrand = objwebtgddEntities.Brands.OrderBy(c => c.id).ToList();

            var pagedList = lstBrand.ToPagedList(pageNumber, pageSize);

            return View(pagedList);
        }
         public ActionResult ProductBrand(int Id)
        {
            var listProduct = objwebtgddEntities.Products.Where(n => n.BrandId == Id).ToList();
            return View(listProduct);
        }
    }
}