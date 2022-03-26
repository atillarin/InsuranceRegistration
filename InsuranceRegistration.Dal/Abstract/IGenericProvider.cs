using InsuranceRegistration.Dto.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceRegistration.Dal.Abstract
{
    public interface IGenericProvider<T> where T : IBaseDto
    {
        int Insert(T dto);
        int Update(T dto);
        bool Delete(T dto);
    }
}
