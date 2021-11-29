using DataAccess.CS.Interfaces;
using DataAccess.CS.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DataAccess.CS.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly ISqlAccess dbAccess;

        public UserRepository(ISqlAccess db)
        {
            dbAccess = db;
        }

        public Task<List<User>> GetUsers()
        {
            return dbAccess.LoadData<User, dynamic>("SELECT * FROM Users", new { });
        }

        public async Task<User> GetUser(int id)
        {
            var results = await dbAccess.LoadData<User, dynamic>(
                "SELECT * FROM Users WHERE Id = @Id",
                new { Id = id });
            return results.FirstOrDefault();
        }

        public Task InsertUser(User user) =>
            dbAccess.SaveData("insert into Users (FirstName, LastName) values (@FirstName, @LastName)", user);

        public Task UpdateUser(User user) =>
            dbAccess.SaveData("update Users set FirstName = @FirstName, LastName = @LastName WHERE Id = @Id", user);

        public Task DeleteUser(int id) =>
            dbAccess.SaveData("delete from Users WHERE Id = @Id", new { Id = id });
    }
}
