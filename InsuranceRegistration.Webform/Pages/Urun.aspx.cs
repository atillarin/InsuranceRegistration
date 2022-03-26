using BupaBootcamp.Webform.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BupaBootcamp.Webform
{
    public partial class Urun : System.Web.UI.Page
    {
        ProductView product;
        public Urun()
        {
            product = new ProductView();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sigortaligirisi_Click(object sender, EventArgs e)  // Önceki sayfaya (Sigortalı girişi) git.
        {
            Response.Redirect("Sigortali.aspx");
        }

        protected void prim_Click(object sender, EventArgs e) // Sonraki sayfaya (Prim seçimi) git.
        {
            if (Session["Product"] != null)
            {
                Response.Redirect("Prim.aspx");
            }
            else
            {
                Response.Write("Prim Seçimi Yapılmadı");
            }
        }

        protected void teminat_SelectedIndexChanged(object sender, EventArgs e)
        {
            product.ProductName = teminat.SelectedRow.Cells[1].Text;
            product.Premium = Convert.ToInt32(teminat.SelectedRow.Cells[2].Text);
            product.ProductID = Convert.ToInt32(teminat.SelectedRow.Cells[3].Text);

            Session["Product"] = product;
        }
    }
}