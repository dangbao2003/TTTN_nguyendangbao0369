using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webtgdd.Context;
using static webtgdd.Common;

namespace webtgdd.Areas.Admin.Controllers
{
    public class BrandController : Controller
    {
        webtgddEntities objwebtgddEntities = new webtgddEntities();
        // GET: Admin/Brand
        public ActionResult Index(string currentFilter, string SearchString, int? page)
        {
            var lstBrand = new List<Brand>();
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
                lstBrand = objwebtgddEntities.Brands.Where(n => n.Name.Contains(SearchString)).ToList();

            }
            else
            {
                //lấy all danh sách sản phẩm trong bảng product
                lstBrand = objwebtgddEntities.Brands.ToList();

            }
            ViewBag.CurrentFilter = SearchString;
            //số lượng item của 1 trang = 4
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            //Sắp xếp theo id sản phẩm lên đầu
            lstBrand = lstBrand.OrderByDescending(n => n.id).ToList();
            return View(lstBrand.ToPagedList(pageNumber, pageSize));

        }
        public ActionResult Details(int Id)
        {
            var objBrand = objwebtgddEntities.Brands.Where(n => n.id == Id).FirstOrDefault();
            return View(objBrand);
        }


        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }



        [HttpPost]
        public ActionResult Create(Brand objBrand)
        {
            try
            {
                if (objBrand.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objBrand.ImageUpload.FileName);
                    string extension = Path.GetExtension(objBrand.ImageUpload.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                    objBrand.Avartar = fileName;
                    objBrand.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/assets/images/brands"), fileName));
                }
                objwebtgddEntities.Brands.Add(objBrand);
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
            var objBrand = objwebtgddEntities.Brands.Where(n => n.id == Id).FirstOrDefault();
            return View(objBrand);
        }

        [HttpPost]
        public ActionResult Delete(Brand objBr)
        {
            var objBrand = objwebtgddEntities.Brands.Where(n => n.id == objBr.id).FirstOrDefault();
            objwebtgddEntities.Brands.Remove(objBrand);
            objwebtgddEntities.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int Id)
        {
            var objBrand = objwebtgddEntities.Brands.Where(n => n.id == Id).FirstOrDefault();
            return View(objBrand);
        }

        [HttpPost]
        public ActionResult Edit(Brand objBrand)
        {
            if (objBrand.ImageUpload != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(objBrand.ImageUpload.FileName);
                string extension = Path.GetExtension(objBrand.ImageUpload.FileName);
                fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                objBrand.Avartar = fileName;
                objBrand.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/assets/images/brands"), fileName));
            }
            objwebtgddEntities.Entry(objBrand).State = EntityState.Modified;
            objwebtgddEntities.SaveChanges();

            return RedirectToAction("Index");
        }

    }
}