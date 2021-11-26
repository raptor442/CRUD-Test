using DataAccess.DbAccess;
using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories
{
    public class UserRepository
    {
        private readonly ISqlAccess _db;

        public UserRepository(ISqlAccess db)
        {
            _db = db;
        }

        public Task<List<User>> GetUsers()
        {
            return _db.LoadData<User, dynamic>("SELECT * FROM Users", new { });
        }

        public async Task<User> GetUser(int id)
        {
            var results = await _db.LoadData<User, dynamic>(
                "dbo.spUser_Get",
                new { Id = id });
            return results.FirstOrDefault();
        }

        public Task InsertUser(User user) =>
            _db.SaveData("dbo.spUser_Insert", new { user.FirstName, user.LastName });

        public Task UpdateUser(User user) =>
            _db.SaveData("dbo.spUser_Update", user);

        public Task DeleteUser(int id) =>
            _db.SaveData("dbo.spUser_Delete", new { Id = id });
    }
}
