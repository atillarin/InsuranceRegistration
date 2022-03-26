using InsuranceRegistration.Bl.Abstract;
using InsuranceRegistration.Bl.Concrete;
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
    public class OfferController : ControllerBase
    {
        IOfferService service;

        public OfferController(IOfferService service)
        {
            this.service = service;
        }

        [HttpGet("LastOfferID")]
        public int GetLastOfferID()
        {
            return service.GetLastOfferID();
        }
        [HttpPost]
        public void UpdateIsPaid(OfferDto offer)
        {
            service.UpdateIsPaid(offer);
        }
    }
}
