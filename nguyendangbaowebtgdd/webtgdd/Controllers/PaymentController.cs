using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webtgdd.Context;
using webtgdd.Models;

namespace webtgdd.Controllers
{
    public class PaymentController : Controller
    {
        webtgddEntities objwebtgddEntities = new webtgddEntities();
        // GET: Payment
        public ActionResult Index()
        {
            if (Session["idUser"] == null)
            {
                return RedirectToAction("Login", "Home");
            }
            else
            {
                var lstCart = (List<CartModel>)Session["cart"];
                Order objOrder = new Order();
                objOrder.Name = "DonHang-" + DateTime.Now.ToString("yyyyMMddHHmmss");
                objOrder.UserId = int.Parse(Session["idUser"].ToString());
                objOrder.CreatedOnUtc = DateTime.Now;
                objOrder.Status = 1;
                objwebtgddEntities.Orders.Add(objOrder);
                objwebtgddEntities.SaveChanges();
                int intOrderId = objOrder.Id;
                List<OrderDetail> lstOrderDetail = new List<OrderDetail>();
                foreach (var order in lstCart)
                {
                    OrderDetail obj = new OrderDetail();
                    obj.OrderId = intOrderId;
                    obj.Quantity = order.Quantity;
                    obj.ProductId = order.Product.Id;
                    obj.Pice = order.Product.Pice;
                    obj.PiceDiscount = order.Product.PiceDiscount;

                    lstOrderDetail.Add(obj);
                }
                objwebtgddEntities.OrderDetails.AddRange(lstOrderDetail);
                objwebtgddEntities.SaveChanges();

            }
            return View();
        }
    }
}