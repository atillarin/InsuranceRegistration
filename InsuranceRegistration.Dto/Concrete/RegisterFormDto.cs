using InsuranceRegistration.Dto.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceRegistration.Dto.Concrete
{
    public class RegisterFormDto : IBaseDto
    {
        public CustomerDto customer { get; set; }
        public List<CandidateDto> candidateList { get; set; }
        public ProductDto product { get; set; }
        public OfferDto offer { get; set; }
    }
}
