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
    public class CustomerService : ICustomerService
    {
        private ICustomerProvider provider;

        public CustomerService(ICustomerProvider provider)
        {
            this.provider = provider;
        }

        public int Insert(CustomerDto customer)
        {
            int result;

            result = provider.Insert(customer);

            return result;
        }

        public int Update(CustomerDto dto)
        {
            throw new NotImplementedException();
        }
        public bool Delete(CustomerDto dto)
        {
            throw new NotImplementedException();
        }
    }
}
