using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BupaBootcamp.Webform.Models
{
    public class CustomerView
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PersonalID { get; set; }
        public string Gender { get; set; }
        public string BirthDate { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
    }
}