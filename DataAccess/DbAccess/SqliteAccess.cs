using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DataAccess.DbAccess
{
    public class SqliteAccess : ISqlAccess
    {
        public Task<IEnumerable<T>> LoadData<T, U>(string storedProcedure, U parameters, string connectionId = "Default")
        {
            throw new NotImplementedException();
        }

        public Task SaveData<T>(string storedProcedure, T parameters, string connectionId = "Default")
        {
            throw new NotImplementedException();
        }
    }
}
