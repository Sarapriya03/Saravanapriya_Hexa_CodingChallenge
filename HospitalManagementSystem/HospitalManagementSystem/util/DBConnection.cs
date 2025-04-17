using Microsoft.Data.SqlClient;

namespace HospitalManagementSystem.util
{
    public class DBConnection
    {
        public static SqlConnection GetConnection(string connectionString)
        {
            return new SqlConnection(connectionString);
        }
    }
}
