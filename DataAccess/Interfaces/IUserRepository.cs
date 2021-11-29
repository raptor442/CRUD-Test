using DataAccess.CS.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DataAccess.CS.Interfaces
{
    public interface IUserRepository
    {
        Task DeleteUser(int id);
        Task<User> GetUser(int id);
        Task<List<User>> GetUsers();
        Task InsertUser(User user);
        Task UpdateUser(User user);
    }
}