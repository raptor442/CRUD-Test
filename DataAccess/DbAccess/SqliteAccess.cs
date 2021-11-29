using Dapper;
using DataAccess.CS.Interfaces;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SQLite;
using System.Linq;
using System.Threading.Tasks;

namespace DataAccess.CS.DbAccess
{
    public class SqliteAccess : ISqlAccess
    {
        private readonly string connectionId;
        public SqliteAccess(string connectionId)
        {
            this.connectionId = connectionId;
        }

        public async Task<List<T>> LoadData<T, U>(string sqlCommand, U parameters)
        {
            using (IDbConnection connection = new SQLiteConnection(GetConnectionString(connectionId)))
            {
                var output = await connection.QueryAsync<T>(sqlCommand, new DynamicParameters());
                return output.ToList();
            }
        }

        public async Task SaveData<T>(string sqlCommand, T parameters)
        {
            using (IDbConnection connection = new SQLiteConnection(GetConnectionString(connectionId)))
            {
                await connection.ExecuteAsync(sqlCommand, parameters);
            }
        }

        private string GetConnectionString(string id = "Default")
        {
            string connectionString = ConfigurationManager.ConnectionStrings[id].ConnectionString;
            return connectionString;
        }
    }
}
