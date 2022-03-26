using InsuranceRegistration.Dto.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceRegistration.Dto.Concrete
{
    public class OfferDto : IBaseDto
    {
        public string OfferID { get; set; }
        public int ProductID { get; set; }
        public int CustomerID { get; set; }
        public int Installment { get; set; }
        public int TotalAmount { get; set; }
        public bool IsPaid { get; set; }
    }
}
