// UserRepository.prg
// Created by    : Dave
// Creation Date : 11/28/2021 8:03:17 PM
// Created for   : 
// WorkStation   : DESKTOP-AFHBU2N


USING System
USING System.Collections.Generic
USING System.Text
USING DataAccess.XS.Interfaces
USING DataAccess.XS.Models
USING System.Collections.Generic
USING System.Threading.Tasks
USING System.Linq

BEGIN NAMESPACE DataAccess.XS.Repositories

	/// <summary>
    /// The UserRepository class.
    /// </summary>
	PUBLIC CLASS UserRepository IMPLEMENTS IUserRepository
        PROTECT dbAccess AS ISqlAccess
 
    CONSTRUCTOR(db AS ISqlAccess)
        SELF:dbAccess := db
         RETURN
            
    PUBLIC METHOD GetUsers AS Task<List<User>>
        RETURN dbAccess:LoadData<User, DYNAMIC>("SELECT * FROM Users", {} )
    
    PUBLIC ASYNC METHOD GetUser(id as INT) AS Task<User>
        LOCAL userToGet AS User
        userToGet := User{} {Id := id}
        VAR results := AWAIT dbAccess:LoadData<User, DYNAMIC>("SELECT * FROM Users WHERE Id = @Id", userToGet)
        
        RETURN results:FirstOrDefault()
        
    PUBLIC METHOD InsertUser(user AS User) AS Task<INT>
        RETURN dbAccess:SaveData("insert into Users (FirstName, LastName) values (@FirstName, @LastName)", user)
        
    PUBLIC METHOD UpdateUser(user AS User) AS Task<INT>
        RETURN dbAccess:SaveData("update Users set FirstName = @FirstName, LastName = @LastName WHERE Id = @Id", user)
  
    PUBLIC METHOD DeleteUser(id as INT) AS Task<INT>
        LOCAL userToDelete AS User
        userToDelete := User{} {Id := id}
        RETURN dbAccess:SaveData("delete from Users WHERE Id = @Id", userToDelete)
        
	END CLASS
END NAMESPACE // DataAccess.XS.Repositories