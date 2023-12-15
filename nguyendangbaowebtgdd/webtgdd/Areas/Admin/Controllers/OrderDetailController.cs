using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using webtgdd.Context;

namespace webtgdd.Areas.Admin.Controllers
{
    public class OrderDetailController : Controller
    {
        webtgddEntities objwebtgddEntities = new webtgddEntities();
        // GET: Admin/OrderDetail
        public ActionResult Index(string currentFilter, string SearchString, int? page)
        {
            var lstOrderDetail = new List<OrderDetail>();

            if (SearchString != null)
            {
                page = 1;
            }
            else
            {
                SearchString = currentFilter;
            }

            if (!string.IsNullOrEmpty(SearchString))
            {
                // Lấy danh sách sản phẩm theo từ khóa tìm kiếm (kiểu int)
                int searchInt;
                if (int.TryParse(SearchString, out searchInt))
                {
                    lstOrderDetail = objwebtgddEntities.OrderDetails.Where(n => n.Id == searchInt).ToList();
                }
            }
            else
            {
                // Lấy toàn bộ danh sách sản phẩm từ bảng "Orders"
                lstOrderDetail = objwebtgddEntities.OrderDetails.ToList();
            }

            ViewBag.CurrentFilter = SearchString;

            // Số lượng sản phẩm trên mỗi trang
            int pageSize = 4;
            int pageNumber = (page ?? 1);

            // Sắp xếp theo trường "Id" giảm dần
            lstOrderDetail = lstOrderDetail.OrderByDescending(n => n.Id).ToList();

            return View(lstOrderDetail.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Details(int Id)
        {
            var objOrderDetail = objwebtgddEntities.OrderDetails.Where(n => n.Id == Id).FirstOrDefault();
            return View(objOrderDetail);
        }

        [HttpGet]
        public ActionResult Delete(int Id)
        {
            var objOrderDetails = objwebtgddEntities.OrderDetails.Where(n => n.Id == Id).FirstOrDefault();
            return View(objOrderDetails);
        }

        [HttpPost]
        public ActionResult Delete(OrderDetail objOrdetail)
        {
            var objOrderDetails = objwebtgddEntities.OrderDetails.Where(n => n.Id == objOrdetail.Id).FirstOrDefault();
            objwebtgddEntities.OrderDetails.Remove(objOrderDetails);
            objwebtgddEntities.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}