using Dapper;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace DataAccess.DbAccess
{
    public class MSSqlAccess : ISqlAccess
    {
        private readonly string connectionId;
        public MSSqlAccess(string connectionId)
        {
            this.connectionId = connectionId;
        }

        public async Task<List<T>> LoadData<T, U>(
            string storedProcedure,
            U parameters)
        {
            IEnumerable<T> results;

            using (IDbConnection connection = new SqlConnection(GetConnectionString(connectionId)))
            {
                results = await connection.QueryAsync<T>(storedProcedure, parameters,
                commandType: CommandType.StoredProcedure);
            }

            return results.ToList();
        }

        public async Task SaveData<T>(
            string storedProcedure,
            T parameters)
        {
            using (IDbConnection connection = new SqlConnection(GetConnectionString(connectionId)))
            {
                await connection.ExecuteAsync(storedProcedure, parameters,
                                commandType: CommandType.StoredProcedure);
            }
        }

        private static string GetConnectionString(string id = "Default")
        {
            return ConfigurationManager.ConnectionStrings[id].ConnectionString;
        }
    }
}
