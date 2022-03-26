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
    public class CandidateService :  ICandidateService
    {
        private ICandidateProvider provider;

        public CandidateService(ICandidateProvider provider)
        {
            this.provider = provider;
        }

        public int Insert(CandidateDto candidate)
        {
            int result;

            result = provider.Insert(candidate);

            return result;
        }

        public int Update(CandidateDto dto)
        {
            throw new NotImplementedException();
        }
        public bool Delete(CandidateDto dto)
        {
            throw new NotImplementedException();
        }
    }
}
