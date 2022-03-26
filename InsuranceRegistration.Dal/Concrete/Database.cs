using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceRegistration.Dal.Concrete
{
    public class Database
    {
        


        public static SqlConnection GetConnection()
        {
           
            return new SqlConnection("Data Source = DESKTOP-A4R9AH5\\SQLEXPRESS; Initial Catalog = Insurance; Integrated Security = True");
            
        }
    }
}
