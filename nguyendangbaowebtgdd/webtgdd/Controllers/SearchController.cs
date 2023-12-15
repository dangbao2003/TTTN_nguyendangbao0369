using System.Linq;
using System.Web.Mvc;
using webtgdd.Context;

namespace webtgdd.Controllers
{
    public class SearchController : Controller
    {
        webtgddEntities objwebtgddEntities = new webtgddEntities();

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
                // Nếu không có từ khóa, hiển thị tất cả sản phẩm
                var allProducts = objwebtgddEntities.Products.ToList();
                return View(allProducts);
            }

        }

    }
}