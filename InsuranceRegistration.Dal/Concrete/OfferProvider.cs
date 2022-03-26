using InsuranceRegistration.Dal.Abstract;
using InsuranceRegistration.Dto.Concrete;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceRegistration.Dal.Concrete
{
    
    public class OfferProvider : IOfferProvider
    {
        public int Insert(OfferDto offer)
        {
            int offerID;
            try
            {
                using (SqlConnection connection = Database.GetConnection()) 
                {
                    SqlCommand command = new SqlCommand("sp_Offer_Insert @productID,@customerID,@Installment,@TotalAmount,@IsPaid", connection);
                    command.Parameters.Add(new SqlParameter("@productID",offer.ProductID));
                    command.Parameters.Add(new SqlParameter("@customerID", offer.CustomerID));
                    command.Parameters.Add(new SqlParameter("@Installment", offer.Installment));
                    command.Parameters.Add(new SqlParameter("@TotalAmount", offer.TotalAmount));
                    command.Parameters.Add(new SqlParameter("@IsPaid", offer.IsPaid));
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
                offerID = GetLastInsertedId();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return offerID;
        }

        public int GetLastInsertedId()
        {
            int lastInsertedId;
            string SqlQuery = "SELECT MAX(OfferID) FROM dbo.Offers";
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

        public void UpdateIsPaid(OfferDto offer)
        {
            string SqlQuery = $"UPDATE Offers SET IsPaid =1 WHERE OfferID={offer.OfferID}";
            try
            {
                using (SqlConnection connection = Database.GetConnection())
                {
                    SqlCommand command = new SqlCommand(SqlQuery, connection);
                    connection.Open();
                    command.ExecuteScalar();
                    connection.Close();
                };
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            
        }

        public int Update(OfferDto dto)
        {
            throw new NotImplementedException();
        }

        public bool Delete(OfferDto dto)
        {
            throw new NotImplementedException();
        }
    }
}
