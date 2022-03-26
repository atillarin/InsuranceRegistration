using InsuranceRegistration.Dto.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceRegistration.Bl.Abstract
{
    public interface IGenericService<T> where T : IBaseDto
    {
        int Insert(T dto);
        int Update(T dto);
        bool Delete(T dto);
    }
}
