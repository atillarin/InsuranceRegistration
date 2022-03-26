using InsuranceRegistration.Dto.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceRegistration.Dto.Concrete
{
    public class ProductDto : IBaseDto

    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public int Premium { get; set; }
    }
}
