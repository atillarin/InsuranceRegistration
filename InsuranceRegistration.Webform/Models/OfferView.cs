using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BupaBootcamp.Webform.Models
{
    public class OfferView
    {
        public string OfferID { get; set; }
        public int Installment { get; set; }
        public int TotalAmount { get; set; }
        public bool IsPaid { get; set; }
    }
}