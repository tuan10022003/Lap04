using Microsoft.Ajax.Utilities;
using SachOnline.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SachOnline.Models
{
    public class GioHang
    {
        public int iMaSach { get; set; }
        public string sTenSach { get; set; }
        public string sAnhBia { get; set; }
        public double dDonGia { get; set; }
        public int iSoLuong { get; set; }
        public double ThanhTien { get { return iSoLuong * dDonGia; } }
        public  dbSachOnlineDataContext data;
        private string connection;



        public GioHang(int ms)
        {
            connection = "Data Source=LAPTOP-ODTA635P\\SQLEXPRESS01;Initial Catalog=SachOnline;Integrated Security=True";
            data = new dbSachOnlineDataContext(connection);
            iMaSach = ms;
            sach s = data.saches.Single(n => n.sach_id == iMaSach);
            sTenSach = s.ten_sach;
            sAnhBia = s.anhSP;
            dDonGia = double.Parse(s.gia_tien.ToString());
            iSoLuong = 1;
        }

    }
}