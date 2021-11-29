using System.Collections.Generic;
using System.Threading.Tasks;

namespace DataAccess.CS.Interfaces
{
    public interface ISqlAccess
    {
        Task<List<T>> LoadData<T, U>(string sqlCommand, U parameters);
        Task SaveData<T>(string sqlCommand, T parameters);
    }
}