using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using webtgdd.Context;

namespace webtgdd.Controllers
{
    public class SearchController : Controller
    {
        private webtgddEntities objwebtgddEntities = new webtgddEntities();

        // GET: Search
        public ActionResult Index(string keyword)
        {
            if (!string.IsNullOrEmpty(keyword))
            {
                var searchResults = objwebtgddEntities.Products
                    .Where(p => p.Name.Contains(keyword))
                    .ToList();

                return View(searchResults);
            }
            else
            {
                // If no keyword is provided, show all products
                var allProducts = objwebtgddEntities.Products.ToList();
                return View(allProducts);
            }
        }

        public class CartController : Controller
        {
            [HttpPost]
            public ActionResult AddToCart(int productId)
            {
                // Implement logic to add the product with productId to the shopping cart
                // You can use a session variable, database, or any other storage mechanism

                // Return a JSON response indicating the success of the operation
                return Json(new { success = true });
            }
        }

    }
}
