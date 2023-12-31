﻿using PagedList;
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
    public class ProductController : Controller
    {
        webtgddEntities objwebtgddEntities = new webtgddEntities();
        // GET: Admin/Product
        public ActionResult Index(string currentFilter, string SearchString, int? page)
        {
            var lstProduct = new List<Product>();
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
                lstProduct = objwebtgddEntities.Products.Where(n => n.Name.Contains(SearchString)).ToList();

            }
            else
            {
                //lấy all danh sách sản phẩm trong bảng product
                lstProduct = objwebtgddEntities.Products.ToList();

            }

            ViewBag.CurrentFilter = SearchString;
            //số lượng item của 1 trang = 4
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            //Sắp xếp theo id sản phẩm lên đầu
            lstProduct = lstProduct.OrderByDescending(n => n.Id).ToList();
            return View(lstProduct.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Details(int Id)
        {
            var objProduct = objwebtgddEntities.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }

        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.CategoryList = new SelectList(objwebtgddEntities.Categories, "Id", "Name");
            ViewBag.BrandList = new SelectList(objwebtgddEntities.Brands, "Id", "Name");
            return View();
        }

        [HttpPost]
        public ActionResult Create(Product objProduct)
        {
            try
            {
                if (objProduct.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                    string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                    objProduct.Avartar = fileName;
                    objProduct.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/assets/images/products"), fileName));
                }

                // Lấy tên danh mục từ categoryId
                Category category = objwebtgddEntities.Categories.FirstOrDefault(c => c.Id == objProduct.CategoryId);
                if (category != null)
                {
                    objProduct.CategoryName = category.Name;
                }

                // Lấy tên thương hiệu từ brandId
                Brand brand = objwebtgddEntities.Brands.FirstOrDefault(b => b.id == objProduct.BrandId);
                if (brand != null)
                {
                    objProduct.BrandName = brand.Name;
                }

                objwebtgddEntities.Products.Add(objProduct);
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
            var objProduct = objwebtgddEntities.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }

        [HttpPost]
        public ActionResult Delete(Product objPro)
        {
            var objProduct = objwebtgddEntities.Products.Where(n => n.Id == objPro.Id).FirstOrDefault();
            objwebtgddEntities.Products.Remove(objProduct);
            objwebtgddEntities.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int Id)
        {
            ViewBag.CategoryList = new SelectList(objwebtgddEntities.Categories, "Id", "Name");
            ViewBag.BrandList = new SelectList(objwebtgddEntities.Brands, "Id", "Name");
            var objProduct = objwebtgddEntities.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }

        [HttpPost]
        public ActionResult Edit(Product objProduct)
        {
            try
            {
                // Lấy tên danh mục trước đó từ cơ sở dữ liệu
                string previousCategoryName = objwebtgddEntities.Products
                    .Where(p => p.Id == objProduct.Id)
                    .Select(p => p.CategoryName)
                    .FirstOrDefault();
                // Lấy tên danh mục trước đó từ cơ sở dữ liệu
                string previousBrandName = objwebtgddEntities.Products
                    .Where(p => p.Id == objProduct.Id)
                    .Select(p => p.BrandName)
                    .FirstOrDefault();

                // Lấy đường dẫn ảnh trước đó
                string previousImage = objwebtgddEntities.Products
                .Where(c => c.Id == objProduct.Id)
                .Select(c => c.Avartar)
                .FirstOrDefault();

                if (objProduct.ImageUpload != null)
                {
                    // Xóa ảnh trước đó (nếu có)
                    if (!string.IsNullOrEmpty(previousImage))
                    {
                        string previousImagePath = Path.Combine(Server.MapPath("~/Content/assets/images/products"), previousImage);
                        if (System.IO.File.Exists(previousImagePath))
                        {
                            System.IO.File.Delete(previousImagePath);
                        }
                    }

                    // Lưu ảnh mới
                    string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                    string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                    objProduct.Avartar = fileName;
                    objProduct.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/assets/images/products"), fileName));
                }
                else
                {
                    // Sử dụng đường dẫn ảnh trước đó nếu không có tệp mới
                    objProduct.Avartar = previousImage;
                }

                objwebtgddEntities.Entry(objProduct).State = EntityState.Modified;
                objwebtgddEntities.SaveChanges();

                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index");
            }


        }
    }
}