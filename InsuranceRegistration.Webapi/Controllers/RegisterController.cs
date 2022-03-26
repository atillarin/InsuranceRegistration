using InsuranceRegistration.Bl;
using InsuranceRegistration.Bl.Abstract;
using InsuranceRegistration.Dto.Concrete;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InsuranceRegistration.Webapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegisterController : ControllerBase
    {
        private readonly IRegisterManager registerManager;

        public RegisterController(IRegisterManager registerManager)
        {
            this.registerManager = registerManager;
        }

        [HttpPost]
        public bool PostRegisterForm(RegisterFormDto dtoregisterForm)
        {
            bool result=registerManager.GetRegisterForm(dtoregisterForm);
            return result;
        }

        
    }
}
