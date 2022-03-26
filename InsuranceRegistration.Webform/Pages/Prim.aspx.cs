using BupaBootcamp.Webform.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BupaBootcamp.Webform
{
    public partial class Prim : System.Web.UI.Page
    {
        List<CandidateView> candidates;
        int totalAmount;
        ProductView product;
        AmountView amount;
        List<AmountView> amountList;
        OfferView offerView;
        public Prim()
        {
            candidates = new List<CandidateView>();
            product = new ProductView();
            offerView = new OfferView();
        }

        protected void odemeplani_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateTable();
            SetSession();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Product"] != null)      // Sayfa ilk yüklendiğinde aday sayısı ile ürün primi çarpılarak toplam tutar hesaplanır.
            {
                candidates = (List<CandidateView>)Session["Candidates"];
                product = (ProductView)Session["Product"];
                totalAmount = product.Premium * candidates.Count();

                UpdateTable();
                SetSession();
            }
            
        }
        protected void urunsecimi_Click(object sender, EventArgs e) // Önceki sayfaya (Ürün seçimi) git.
        {
            Response.Redirect("Urun.aspx");
        }

        protected void odeme_Click(object sender, EventArgs e)  // Sonraki sayfaya (Ödeme Ekranı) git. 
        {
            Response.Redirect("Odeme.aspx");
        }

        protected void UpdateTable()   //Toplam tutar seçilen taksit sayısına bölünüp taksit tutar listesi oluşturulur. İşlemlerin sonunda liste tabloya yansıtılır.
        {
            amountList = new List<AmountView>();
            for (int i = 1; i <= Convert.ToInt32(odemeplani.SelectedValue); i++)
            {
                amount = new AmountView();
                amount.Installment = i.ToString();

                amount.InstallmentAmount = Convert.ToString(totalAmount / Convert.ToInt32(odemeplani.SelectedValue));
                amountList.Add(amount);

            }
            amount = new AmountView();
            amount.Installment = "Toplam Tutar";  // listenin son satırına Toplam Tutar eklenir.
            amount.InstallmentAmount = Convert.ToString(totalAmount);
            amountList.Add(amount);

            odemetablosu.DataSource = amountList;
            odemetablosu.DataBind();
        }
        protected void SetSession()          // Seçilen taksit ve toplam tutar oturuma kayıt edilir.
        {
            offerView.Installment = Convert.ToInt32(odemeplani.SelectedValue);
            offerView.TotalAmount = totalAmount;
            Session["Offer"] = offerView;
        }
    }
}