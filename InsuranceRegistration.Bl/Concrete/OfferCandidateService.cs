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
    public class OfferCandidateService : IOfferCandidateService
    {
        int result;
        private IOfferCandidateProvider provider;

        public OfferCandidateService(IOfferCandidateProvider provider)
        {
            this.provider = provider;
        }
        public int InsertOfferCandidate(int offerID,int candidateID)
        {
            result = provider.Insert(offerID, candidateID);
            return result;
        }

        public int Insert(OfferCandidateDto dto)
        {
            throw new NotImplementedException();
        }
        public int Update(OfferCandidateDto dto)
        {
            throw new NotImplementedException();
        }
        public bool Delete(OfferCandidateDto dto)
        {
            throw new NotImplementedException();
        }
    }
}
