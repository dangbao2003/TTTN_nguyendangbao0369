using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using webtgdd.Context;

namespace webtgdd.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        webtgddEntities objwebtgddEntities = new webtgddEntities();
        // GET: Admin/User
        public ActionResult Index(string currentFilter, string SearchString, int? page)
        {
            var lstUser = new List<User>();
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
                //lấy ds sản phẩm theo từ khóa tìm kiếm
                lstUser = objwebtgddEntities.Users.Where(n => n.FirstName.Contains(SearchString)).ToList();

            }
            else
            {
                //lấy all danh sách sản phẩm trong bảng product
                lstUser = objwebtgddEntities.Users.ToList();

            }
            ViewBag.CurrentFilter = SearchString;
            //số lượng item của 1 trang = 4
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            //Sắp xếp theo id sản phẩm lên đầu
            lstUser = lstUser.OrderByDescending(n => n.Id).ToList();
            return View(lstUser.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Details(int Id)
        {
            var objUser = objwebtgddEntities.Users.Where(n => n.Id == Id).FirstOrDefault();
            return View(objUser);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(User objUser)
        {
            try
            {
                objwebtgddEntities.Users.Add(objUser);
                objwebtgddEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index");
            }

        }

        [HttpGet]
        public ActionResult Delete(int Id)
        {
            var objUser = objwebtgddEntities.Users.Where(n => n.Id == Id).FirstOrDefault();
            return View(objUser);
        }

        [HttpPost]
        public ActionResult Delete(User objUs)
        {
            var objUser = objwebtgddEntities.Users.Where(n => n.Id == objUs.Id).FirstOrDefault();
            objwebtgddEntities.Users.Remove(objUser);
            objwebtgddEntities.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int Id)
        {
            var objUser = objwebtgddEntities.Users.Where(n => n.Id == Id).FirstOrDefault();
            return View(objUser);
        }

        [HttpPost]
        public ActionResult Edit(User objUser)
        {
            
            objwebtgddEntities.Entry(objUser).State = EntityState.Modified;
            objwebtgddEntities.SaveChanges();

            return RedirectToAction("Index");
        }

    }
}