using Dapper;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace DataAccess.DbAccess
{
    public class MSSqlAccess : ISqlAccess
    {
        private readonly IConfiguration _config;

        public MSSqlAccess(IConfiguration config)
        {
            _config = config;
        }

        public async Task<IEnumerable<T>> LoadData<T, U>(
            string storedProcedure,
            U parameters,
            string connectionId = "Default")
        {
            IEnumerable<T> results;

            using (IDbConnection connection = new SqlConnection(_config.GetConnectionString(connectionId)))
            {
                results = await connection.QueryAsync<T>(storedProcedure, parameters,
                commandType: CommandType.StoredProcedure);
            }

            return results;
        }

        public async Task SaveData<T>(
            string storedProcedure,
            T parameters,
            string connectionId = "Default")
        {
            using (IDbConnection connection = new SqlConnection(_config.GetConnectionString(connectionId)))
            {
                await connection.ExecuteAsync(storedProcedure, parameters,
                                commandType: CommandType.StoredProcedure);
            }
        }
    }
}
