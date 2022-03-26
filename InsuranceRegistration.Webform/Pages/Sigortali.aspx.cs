using BupaBootcamp.Webform.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BupaBootcamp.Webform
{
    public partial class Sigortali : System.Web.UI.Page
    {
        private CandidateView candidate;
        private List<CandidateView> candidateList;
        private CustomerView customer;

        public Sigortali()
        {
            customer = new CustomerView();
            candidateList = new List<CandidateView>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateTable();
        }

        protected void sigortaliekle_Click(object sender, EventArgs e)
        {
            sigortalitasi.Checked = false;
            candidate = new CandidateView();
            candidate.FirstName = adi.Text;
            candidate.LastName = soyadi.Text;
            candidate.PersonalID = tckimlikno.Text;
            candidate.Gender = cinsiyet.Text;
            candidate.BirthDate = dogumtarihi.Text; 
            candidate.Phone = telefon.Text;
            candidate.Email = email.Text;
            candidate.MartialStatus = medenidurum.Text;
            candidate.Relationship = yakinlik.Text;
            candidate.Profession = meslek.Text;
            candidate.Height = Int32.Parse(boy.Text);
            candidate.Weight = Int32.Parse(kilo.Text);
            candidate.Address = adres.Text;

            if (Session["Candidates"] != null)    //Adaylistesi doluysa listeyi oturumdan al, yeni adayı listeye ekleyip tabloyu ve oturumu güncelle.
            {
                candidateList = (List<CandidateView>)Session["Candidates"];  
            }
            candidateList.Add(candidate);
            adaytablosu.DataSource = candidateList;
            adaytablosu.DataBind();

            Session["Candidates"] = candidateList;
            ClearTextBoxes();
        }

        protected void urunsecimi_Click(object sender, EventArgs e)    // Sonraki sayfaya (Ürün seçimi) git.
        {
            if (Session["Candidates"] != null){Response.Redirect("Urun.aspx");}
        }

        protected void sigortaettiren_Click(object sender, EventArgs e)  // Önceki sayfaya (Müşteri girişi) git.
        {
                Response.Redirect("SigortaEttiren.aspx");
        }


        protected void sil_Click(object sender, EventArgs e)
        {
            candidateList = (List<CandidateView>)Session["Candidates"];
            if (candidateList.Count >0)                                     //Listede aday varsa, tabloda seçili olan adayın index i ile sil.
            {
                candidateList.RemoveAt(adaytablosu.SelectedRow.RowIndex);
                adaytablosu.DataSource = candidateList;
                adaytablosu.DataBind();
                Session["Candidates"] = candidateList;
            }
        }

        protected void sigortalitasi_CheckedChanged(object sender, EventArgs e)
        {
            if (sigortalitasi.Checked==true && Session["Customer"] != null)    //Sigorta ettiren aynı anda sigortalı ise, bilgileri ekrana yansıt.
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
            else
            {
                ClearTextBoxes();
            }
        }

        protected void ClearTextBoxes()
        {
            adi.Text = string.Empty;
            soyadi.Text = string.Empty;
            tckimlikno.Text = string.Empty;
            cinsiyet.Text = string.Empty;
            dogumtarihi.Text = string.Empty;
            telefon.Text = string.Empty;
            email.Text = string.Empty;
            medenidurum.Text = string.Empty;
            yakinlik.Text = string.Empty;
            meslek.Text = string.Empty;
            boy.Text = string.Empty;
            kilo.Text = string.Empty;
            adres.Text = string.Empty;
        }

        protected void UpdateTable()
        {
            if (Session["Candidates"] != null)
            {
                candidateList = (List<CandidateView>)Session["Candidates"];
            }
            adaytablosu.DataSource = candidateList;
            adaytablosu.DataBind();
        }
    }
}