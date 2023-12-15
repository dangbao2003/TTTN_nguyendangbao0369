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
    public class CategoryController : Controller
    {
        webtgddEntities objwebtgddEntities = new webtgddEntities();
        // GET: Admin/Category
        public ActionResult Index(string currentFilter, string SearchString, int? page)
        {
            var lstCategory = new List<Category>();
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
                lstCategory = objwebtgddEntities.Categories.Where(n => n.Name.Contains(SearchString)).ToList();

            }
            else
            {
                //lấy all danh sách sản phẩm trong bảng product
                lstCategory = objwebtgddEntities.Categories.ToList();

            }
            ViewBag.CurrentFilter = SearchString;
            //số lượng item của 1 trang = 4
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            //Sắp xếp theo id sản phẩm lên đầu
            lstCategory = lstCategory.OrderByDescending(n => n.Id).ToList();
            return View(lstCategory.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Details(int Id)
        {
            var lstCategory = objwebtgddEntities.Categories.Where(n => n.Id == Id).FirstOrDefault();
            return View(lstCategory);
        }



        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }



        [HttpPost]
        public ActionResult Create(Category objCategory)
        {
            try
            {
                if (objCategory.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objCategory.ImageUpload.FileName);
                    string extension = Path.GetExtension(objCategory.ImageUpload.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                    objCategory.Avartar = fileName;
                    objCategory.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/assets/images/category"), fileName));
                }
                objwebtgddEntities.Categories.Add(objCategory);
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
            var objCategory = objwebtgddEntities.Categories.Where(n => n.Id == Id).FirstOrDefault();
            return View(objCategory);
        }

        [HttpPost]
        public ActionResult Delete(Category objCa)
        {
            var objCategory = objwebtgddEntities.Categories.Where(n => n.Id == objCa.Id).FirstOrDefault();
            objwebtgddEntities.Categories.Remove(objCategory);
            objwebtgddEntities.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int Id)
        {
            var objCategory = objwebtgddEntities.Categories.Where(n => n.Id == Id).FirstOrDefault();
            return View(objCategory);
        }

        [HttpPost]
        public ActionResult Edit(Category objCategory)
        {
            // Lấy đường dẫn ảnh trước đó
            string previousImage = objwebtgddEntities.Categories
                .Where(c => c.Id == objCategory.Id)
                .Select(c => c.Avartar)
                .FirstOrDefault();

            if (objCategory.ImageUpload != null)
            {
                // Xóa ảnh trước đó (nếu có)
                if (!string.IsNullOrEmpty(previousImage))
                {
                    string previousImagePath = Path.Combine(Server.MapPath("~/Content/assets/images/category"), previousImage);
                    if (System.IO.File.Exists(previousImagePath))
                    {
                        System.IO.File.Delete(previousImagePath);
                    }
                }

                // Lưu ảnh mới
                string fileName = Path.GetFileNameWithoutExtension(objCategory.ImageUpload.FileName);
                string extension = Path.GetExtension(objCategory.ImageUpload.FileName);
                fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                objCategory.Avartar = fileName;
                objCategory.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/assets/images/category"), fileName));
            }
            else
            {
                // Sử dụng đường dẫn ảnh trước đó nếu không có tệp mới
                objCategory.Avartar = previousImage;
            }

            objwebtgddEntities.Entry(objCategory).State = EntityState.Modified;
            objwebtgddEntities.SaveChanges();

            return RedirectToAction("Index");
        }

    }
}