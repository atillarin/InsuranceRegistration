using InsuranceRegistration.Bl.Abstract;
using InsuranceRegistration.Bl.Concrete;
using InsuranceRegistration.Dto.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceRegistration.Bl
{
    public class RegisterManager : IRegisterManager
    {
        OfferDto offer;
        int customerID,offerID,ID;
        List<int> candidatesID = new List<int>();

        ICandidateService candidateService;
        ICustomerService customerService;
        IOfferService offerService;
        IOfferCandidateService offerCandidateService;

        public RegisterManager(ICustomerService customerService, ICandidateService candidateService, IOfferService offerService, IOfferCandidateService offerCandidateService)
        {
            this.customerService = customerService;
            this.candidateService = candidateService;
            this.offerService = offerService;
            this.offerCandidateService = offerCandidateService;
        }

        public bool GetRegisterForm(RegisterFormDto dtoregisterForm)            //Başvurunun tüm bilgileri burada kayıt edilmektedir.
        {

            customerID = customerService.Insert(dtoregisterForm.customer);      //Müşteri kaydı

            foreach (var candidate in dtoregisterForm.candidateList)            //Aday listesi kaydı
            {
                ID = candidateService.Insert(candidate);
                candidatesID.Add(ID);
            }
            offer = new OfferDto();
            offer.ProductID = dtoregisterForm.product.ProductID;
            offer.CustomerID = customerID;
            offer.Installment = dtoregisterForm.offer.Installment;
            offer.TotalAmount = dtoregisterForm.offer.TotalAmount;
            offer.IsPaid = false;

            offerID = offerService.Insert(offer);                               //Teklif kaydı


            foreach (var candidateID in candidatesID)                           //Teklif adayları kaydı
            {
                offerCandidateService.InsertOfferCandidate(offerID,candidateID);
            }


            return false;
        }
    }
}
