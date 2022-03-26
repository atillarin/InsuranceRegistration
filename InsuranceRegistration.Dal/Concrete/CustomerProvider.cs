using InsuranceRegistration.Dal.Abstract;
using InsuranceRegistration.Dto.Concrete;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceRegistration.Dal.Concrete
{
    public class CustomerProvider :  ICustomerProvider
    {
        public int Insert(CustomerDto customer)
        {
            int customerID;
            try
            {
                using (SqlConnection connection = Database.GetConnection())
                {
                    SqlCommand command = new SqlCommand("sp_Customer_Insert @firstName,@lastName,@personalID,@gender,@birthDate,@phone,@email,@address", connection);
                    command.Parameters.Add(new SqlParameter("firstName", customer.FirstName));
                    command.Parameters.Add(new SqlParameter("lastName", customer.LastName));
                    command.Parameters.Add(new SqlParameter("personalID", customer.PersonalID));
                    command.Parameters.Add(new SqlParameter("gender", customer.Gender));
                    command.Parameters.Add(new SqlParameter("birthDate", customer.BirthDate));
                    command.Parameters.Add(new SqlParameter("phone", customer.Phone));
                    command.Parameters.Add(new SqlParameter("email", customer.Email));
                    command.Parameters.Add(new SqlParameter("address", customer.Address));
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
                customerID = GetLastInsertedId();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return customerID;
        }

        public int GetLastInsertedId()
        {
            int lastInsertedId;
            string SqlQuery = $"SELECT MAX(CustomerID) FROM dbo.customers";
            try
            {
                using (SqlConnection connection = Database.GetConnection())
                {
                    SqlCommand command = new SqlCommand(SqlQuery, connection);
                    connection.Open();
                    var returnValue = command.ExecuteScalar();
                    lastInsertedId = (int)returnValue;
                    connection.Close();
                };
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return lastInsertedId;

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
