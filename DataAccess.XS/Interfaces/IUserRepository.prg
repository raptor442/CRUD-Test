// IUserRepository.prg
// Created by    : Dave
// Creation Date : 11/29/2021 8:51:59 AM
// Created for   : 
// WorkStation   : DESKTOP-AFHBU2N


USING System
USING System.Collections.Generic
USING System.Text
USING System.Threading.Tasks
USING DataAccess.XS.Models

BEGIN NAMESPACE DataAccess.XS.Interfaces

	/// <summary>
    /// The IUserRepository class.
    /// </summary>
	PUBLIC INTERFACE IUserRepository
 
    METHOD DeleteUser(id AS INT) AS Task<INT>
    METHOD GetUser(id AS INT) AS Task<User>
    METHOD GetUsers() AS Task<List<User>>
    METHOD InsertUser(user AS User) AS Task<INT>        
    METHOD UpdateUser(user AS User) AS Task<INT>   
        
	END INTERFACE
END NAMESPACE // DataAccess.XS.Interfaces