using Dapper;
using DataAccess.CS.Interfaces;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace DataAccess.CS.DbAccess
{
    public class MSSqlAccess : ISqlAccess
    {
        private readonly IConfigSettings configSettings;
        public MSSqlAccess(IConfigSettings configSettings)
        {
            this.configSettings = configSettings;
        }

        public async Task<List<T>> LoadData<T, U>(
            string sqlcommand,
            U parameters)
        {
            IEnumerable<T> results;

            using (IDbConnection connection = new SqlConnection(configSettings.ConnectionString))
            {
                results = await connection.QueryAsync<T>(sqlcommand, parameters);
            }

            return results.ToList();
        }

        public async Task SaveData<T>(
            string sqlcommand,
            T parameters)
        {
            using (IDbConnection connection = new SqlConnection(configSettings.ConnectionString))
            {
                await connection.ExecuteAsync(sqlcommand, parameters);
            }
        }

    }
}
