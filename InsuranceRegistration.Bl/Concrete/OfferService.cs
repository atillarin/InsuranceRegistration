using InsuranceRegistration.Bl.Abstract;
using InsuranceRegistration.Dal.Abstract;
using InsuranceRegistration.Dal.Concrete;
using InsuranceRegistration.Dto.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceRegistration.Bl.Concrete
{
    public class OfferService : IOfferService
    {
        int result;
        private IOfferProvider provider;

        public OfferService(IOfferProvider provider)
        {
            this.provider = provider;
        }

        public int Insert(OfferDto offer)
        {
            

            result = provider.Insert(offer);

            return result;
        }

        public int GetLastOfferID()
        {
            return result = provider.GetLastInsertedId();
        }

        public void UpdateIsPaid(OfferDto offer)
        {
            provider.UpdateIsPaid(offer);
        }

        public int Update(OfferDto dto)
        {
            throw new NotImplementedException();
        }

        public bool Delete(OfferDto dto)
        {
            throw new NotImplementedException();
        }
    }
}
