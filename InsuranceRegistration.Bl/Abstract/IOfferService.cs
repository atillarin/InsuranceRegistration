using InsuranceRegistration.Dto.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceRegistration.Bl.Abstract
{
    public interface IOfferService: IGenericService<OfferDto>
    {
        int GetLastOfferID();
        void UpdateIsPaid(OfferDto offer);
    }
}
