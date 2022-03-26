using InsuranceRegistration.Dto.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceRegistration.Dal.Abstract
{
    public interface IOfferProvider: IGenericProvider<OfferDto>
    {
        int GetLastInsertedId();
        void UpdateIsPaid(OfferDto offer);

    }
}
