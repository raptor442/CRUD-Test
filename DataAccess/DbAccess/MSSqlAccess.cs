using Dapper;
using DataAccess.CS.Interfaces;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace DataAccess.CS.DbAccess
{
    public class MSSqlAccess : ISqlAccess
    {
        private readonly string connectionId;
        public MSSqlAccess(string connectionId)
        {
            this.connectionId = connectionId;
        }

        public async Task<List<T>> LoadData<T, U>(
            string sqlcommand,
            U parameters)
        {
            IEnumerable<T> results;

            using (IDbConnection connection = new SqlConnection(GetConnectionString(connectionId)))
            {
                results = await connection.QueryAsync<T>(sqlcommand, parameters);
            }

            return results.ToList();
        }

        public async Task SaveData<T>(
            string sqlcommand,
            T parameters)
        {
            using (IDbConnection connection = new SqlConnection(GetConnectionString(connectionId)))
            {
                await connection.ExecuteAsync(sqlcommand, parameters);
            }
        }

        private static string GetConnectionString(string id = "Default")
        {
            return ConfigurationManager.ConnectionStrings[id].ConnectionString;
        }
    }
}
