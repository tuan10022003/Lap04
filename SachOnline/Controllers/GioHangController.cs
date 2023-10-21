using SachOnline.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace SachOnline.Controllers
{
    public class GioHangController : Controller
    {
        public dbSachOnlineDataContext data;
        private string connection;

        public GioHangController()
        {
            connection = "Data Source=LAPTOP-ODTA635P\\SQLEXPRESS01;Initial Catalog=SachOnline;Integrated Security=True";
            data = new dbSachOnlineDataContext(connection);
        }

        public List<GioHang> LayGioHang()
        {
            List<GioHang> lst = Session["GioHang"] as List<GioHang>;
            if (lst == null)
            {
                lst = new List<GioHang>();
                Session["GioHang"] = lst;
            }
            return lst;
        }

        public ActionResult ThemGioHang(int ms, string url)
        {
            if (Session["TaiKhoan"] != null && !string.IsNullOrEmpty(Session["TaiKhoan"].ToString()))
            {
                List<GioHang> lst = LayGioHang();
                GioHang gh = lst.Find(n => n.iMaSach == ms);
                if (gh == null)
                {
                    gh = new GioHang(ms);
                    lst.Add(gh);
                }
                else
                {
                    gh.iSoLuong++;
                }
                return Redirect(url);
            }
            return RedirectToAction("TaiKhoan", "User");
        }

        public int TongSoLuong()
        {
            int tsl = 0;
            List<GioHang> lst = Session["GioHang"] as List<GioHang>;
            if (lst != null)
            {
                tsl = lst.Sum(n => n.iSoLuong);
            }
            return tsl;
        }

        private double TongTien()
        {
            double tt = 0;
            List<GioHang> lst = Session["GioHang"] as List<GioHang>;
            if (lst != null)
            {
                tt = lst.Sum(n => n.ThanhTien);
            }
            return tt;
        }

        public ActionResult GioHang()
        {
            List<GioHang> lst = LayGioHang();
            if (lst.Count == 0)
            {
                return RedirectToAction("Index", "SachOnline");
            }
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(lst);
        }

        public ActionResult GioHangPartial()
        {
            ViewBag.TongSoLuong1 = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return PartialView();
        }

        public ActionResult XoaSpKhoiGioHang(int iMaSach)
        {
            List<GioHang> lst = LayGioHang();
            GioHang sp = lst.SingleOrDefault(n=>n.iMaSach == iMaSach);
            if(sp != null)
            {
                lst.RemoveAll(n => n.iMaSach == iMaSach);
                if(lst.Count == 0)
                {
                    return RedirectToAction("Index", "SachOnline");
                }
            }
            return RedirectToAction("GioHang");
        }

        public ActionResult CapNhatGioHang(int iSachID, FormCollection f)
        {
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sp = lstGioHang.SingleOrDefault(n => n.iMaSach == iSachID);
            if (sp != null)
            {
                sp.iSoLuong = int.Parse(f["txtSoLuong"].ToString());
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult XoaGioHang()
        {
            List<GioHang> lst = LayGioHang();
            lst.Clear();
            return RedirectToAction("Index", "SachOnline");
        }

        [HttpGet]
        public ActionResult DatHang()
        {
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return RedirectToAction("DangNhap", "User");
            }
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "SachOnline");
            }
            List<GioHang> lst = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(lst);
        }

        [HttpPost]
        public ActionResult DatHang(FormCollection f)
        {
            don_dat_hang ddh = new don_dat_hang();
            khach_hang kh = (khach_hang)Session["TaiKhoan"];
            List<GioHang> lst = LayGioHang();
            ddh.khach_hang_id = kh.khach_hang_id;
            ddh.ngay_dat = DateTime.Now;
            var NgayGiao = String.Format("{0:MM/dd/yyy}",f["NgayGiao"]);
            ddh.ngay_giao_hang = DateTime.Parse(NgayGiao);
            ddh.tinh_trang_giao_hang = 1;
            ddh.da_thanh_toan = 0;
            data.don_dat_hangs.InsertOnSubmit(ddh);
            data.SubmitChanges();

            foreach (var i in lst)
            {
                chi_tiet_dat_hang ctdh = new chi_tiet_dat_hang();
                ctdh.don_dat_hang_id = ddh.don_dat_hang_id;
                ctdh.sach_id = i.iMaSach;
                ctdh.so_luong = i.iSoLuong;
                ctdh.don_gia = i.dDonGia;
                data.chi_tiet_dat_hangs.InsertOnSubmit(ctdh);
            }
            data.SubmitChanges();
            Session["GioHang"] = null;
            return RedirectToAction("XacNhanDonHang", "GioHang");
        }

        public ActionResult XacNhanDonHang ()
        {
            return View();
        }
    }

}

