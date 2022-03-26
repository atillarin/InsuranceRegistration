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
    public class OfferCandidateProvider: IOfferCandidateProvider
    {
        public int Insert(int offerID, int candidateID)
        {
            int offerCandidateID;
            try
            {
                using (SqlConnection connection = Database.GetConnection())
                {
                    SqlCommand command = new SqlCommand("sp_OfferCandidate_Insert @offerId,@candidateId",connection);
                    command.Parameters.Add(new SqlParameter("offerId",offerID));
                    command.Parameters.Add(new SqlParameter("candidateId", candidateID));
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
                offerCandidateID = GetLastInsertedId();

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return offerCandidateID;
        }
        public int GetLastInsertedId()
        {
            int lastInsertedId;
            string SqlQuery = "SELECT MAX(ID) FROM dbo.OfferCandidates";
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

        public int Insert(OfferCandidateDto dto)
        {
            throw new NotImplementedException();
        }

        public int Update(OfferCandidateDto dto)
        {
            throw new NotImplementedException();
        }

        public bool Delete(OfferCandidateDto dto)
        {
            throw new NotImplementedException();
        }
    }
}
