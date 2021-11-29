using Dapper;
using DataAccess.CS.Interfaces;
using System.Collections.Generic;
using System.Data;
using System.Data.SQLite;
using System.Linq;
using System.Threading.Tasks;

namespace DataAccess.CS.DbAccess
{
    public class SqliteAccess : ISqlAccess
    {
        private readonly IConfigSettings configSettings;
        public SqliteAccess(IConfigSettings configSettings)
        {
            this.configSettings = configSettings;
        }

        public async Task<List<T>> LoadData<T, U>(string sqlCommand, U parameters)
        {
            using (IDbConnection connection = new SQLiteConnection(configSettings.ConnectionString))
            {
                var output = await connection.QueryAsync<T>(sqlCommand, new DynamicParameters());
                return output.ToList();
            }
        }

        public async Task SaveData<T>(string sqlCommand, T parameters)
        {
            using (IDbConnection connection = new SQLiteConnection(configSettings.ConnectionString))
            {
                await connection.ExecuteAsync(sqlCommand, parameters);
            }
        }

    }
}
