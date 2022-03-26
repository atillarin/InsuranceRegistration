using BupaBootcamp.Webform.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BupaBootcamp.Webform
{
    public partial class Odeme : System.Web.UI.Page
    {
        OfferView offer;
        RegisterFormView registerForm;
        public Odeme()
        {
            offer = new OfferView();
            registerForm = new RegisterFormView();
        }
        protected void Page_Load(object sender, EventArgs e)    //Sayfa yüklendiğinde tüm oturum bilgileri registerform nesnesine eklenerek post edilir. 
        {
            if (Session["Customer"] != null)
            {
                registerForm.customer = (CustomerView)Session["Customer"];
                registerForm.candidateList = (List<CandidateView>)Session["Candidates"];
                registerForm.product = (ProductView)Session["Product"];
                registerForm.offer = (OfferView)Session["Offer"];

                Session.Clear();

                string registerFormJson = JsonConvert.SerializeObject(registerForm);
                StringContent data = new StringContent(registerFormJson, Encoding.UTF8, "application/json");

                try
                {
                    using (HttpClient client = new HttpClient())
                    {
                        var result = client.PostAsync("http://localhost:23217/api/register", data).Result;
                    }

                    using (HttpClient client2 = new HttpClient())          //Kayıt işlemi tamamlandığında teklif numarası ekrana yansıtılır.
                    {
                        client2.BaseAddress = new Uri("http://localhost:23217");
                        HttpResponseMessage response2 = client2.GetAsync("api/Offer/LastOfferID").Result;
                        offerid.Text = response2.Content.ReadAsStringAsync().Result;
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }

                
            }
        }

        protected void odemeyap_Click(object sender, EventArgs e)    //Ödeme yapıldığında teklif numarasından ödendi bilgisi gönderilir.
        {
            offer.OfferID = offerid.Text;
            string offerSerialized = JsonConvert.SerializeObject(offer);
            StringContent data = new StringContent(offerSerialized, Encoding.UTF8, "application/json");
            try
            {
                using (HttpClient client3 = new HttpClient())
                {
                    var result = client3.PostAsync("http://localhost:23217/api/Offer", data).Result;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            
            odemedurumu.Visible = true;
            odemeyap.Enabled = false;
        }

        protected void sonlandir_Click(object sender, EventArgs e)  //Form sonu yeni işlem için ilk sayfaya dönülür. 
        {
            Response.Redirect("SigortaEttiren.aspx");
        }
    }
}