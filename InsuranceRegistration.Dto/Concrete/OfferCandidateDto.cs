using InsuranceRegistration.Dto.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceRegistration.Dto.Concrete
{
    public class OfferCandidateDto : IBaseDto
    {
        public int OfferID { get; set; }
        public int CandidateID { get; set; }
    }
}
