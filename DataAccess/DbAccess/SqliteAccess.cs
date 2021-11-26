using Dapper;
using DataAccess.Models;
using Microsoft.Data.Sqlite;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace DataAccess.DbAccess
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
            using (IDbConnection connection = new SqliteConnection(GetConnectionString(connectionId)))
            {
                var output = await connection.QueryAsync<T>(sqlCommand, new DynamicParameters());
                return output.ToList();
            }
        }

        public async Task SaveData<T>(string sqlCommand, T parameters)
        {
            using (IDbConnection connection = new SqliteConnection(GetConnectionString(connectionId)))
            {
                await connection.ExecuteAsync(sqlCommand, parameters);
            }
        }

        private string GetConnectionString(string id = "Default")
        {
            return ConfigurationManager.ConnectionStrings[id].ConnectionString;
        }
    }
}
