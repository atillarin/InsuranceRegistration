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
    public class CandidateProvider : ICandidateProvider
    {
        public int Insert(CandidateDto candidate)
        {
            int candidateID;
            try
            {
                using (SqlConnection connection = Database.GetConnection())
                {
                    SqlCommand command = new SqlCommand("sp_Candidate_Insert @firstName,@lastName,@personalID,@gender,@birthDate,@phone,@email,@martialStatus,@relationship,@profession,@height,@weight,@address", connection);
                    command.Parameters.Add(new SqlParameter("firstName", candidate.FirstName));
                    command.Parameters.Add(new SqlParameter("lastName", candidate.LastName));
                    command.Parameters.Add(new SqlParameter("personalID", candidate.PersonalID));
                    command.Parameters.Add(new SqlParameter("gender", candidate.Gender));
                    command.Parameters.Add(new SqlParameter("birthDate", candidate.BirthDate));
                    command.Parameters.Add(new SqlParameter("phone", candidate.Phone));
                    command.Parameters.Add(new SqlParameter("email", candidate.Email));
                    command.Parameters.Add(new SqlParameter("martialStatus", candidate.MartialStatus));
                    command.Parameters.Add(new SqlParameter("relationship", candidate.Relationship));
                    command.Parameters.Add(new SqlParameter("profession", candidate.Profession));
                    command.Parameters.Add(new SqlParameter("height", candidate.Height));
                    command.Parameters.Add(new SqlParameter("weight", candidate.Weight));
                    command.Parameters.Add(new SqlParameter("address", candidate.Address));
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
                candidateID = GetLastInsertedId();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return candidateID;
        }

        public int GetLastInsertedId()
        {
            int lastInsertedId;
            string SqlQuery = $"SELECT MAX(CandidateID) FROM dbo.Candidates";
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

        public int Update(CandidateDto dto)
        {
            throw new NotImplementedException();
        }

        public bool Delete(CandidateDto dto)
        {
            throw new NotImplementedException();
        }
    }
}
