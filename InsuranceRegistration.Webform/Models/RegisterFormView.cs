using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BupaBootcamp.Webform.Models
{
    public class RegisterFormView
    {
        public CustomerView customer { get; set; }
        public List<CandidateView> candidateList { get; set; }
        public ProductView product { get; set; }
        public OfferView offer { get; set; }
    }
}