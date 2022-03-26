using BupaBootcamp.Webform.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BupaBootcamp.Webform
{
    public partial class SigortaEttiren : System.Web.UI.Page
    {
        CustomerView customer;
        public SigortaEttiren()
        {
            customer = new CustomerView();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Customer"] != null)  // Müşteri varsa bilgileri forma yansıt.
            {
                customer = (CustomerView)Session["Customer"];
                adi.Text = customer.FirstName;
                soyadi.Text = customer.LastName;
                tckimlikno.Text = customer.PersonalID;
                cinsiyet.Text = customer.Gender;
                dogumtarihi.Text = customer.BirthDate;
                telefon.Text = customer.Phone;
                email.Text = customer.Email;
                adres.Text = customer.Address;
            }
        }

        
        protected void sigortaligirisi_Click(object sender, EventArgs e)
        {
            customer.FirstName = adi.Text;
            customer.LastName = soyadi.Text;
            customer.PersonalID = tckimlikno.Text;
            customer.Gender = cinsiyet.Text;
            customer.BirthDate = dogumtarihi.Text; 
            customer.Phone = telefon.Text;
            customer.Email = email.Text;
            customer.Address = adres.Text;

            Session["Customer"] = customer;        // Müşteri bilgilerini oturuma kaydet.
            Response.Redirect("Sigortali.aspx");    
        }
    }
}