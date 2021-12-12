// User.prg
// Created by    : Dave
// Creation Date : 11/28/2021 8:00:16 PM
// Created for   : 
// WorkStation   : DESKTOP-AFHBU2N


USING System
USING System.Collections.Generic
USING System.Text
USING DataAccess.XS.Interfaces

BEGIN NAMESPACE DataAccess.XS.Models

	/// <summary>
    /// The User class.
    /// </summary>
	CLASS User IMPLEMENTS ICodeAndDescription
 
	PROPERTY Id			AS INT AUTO
	PROPERTY FirstName 	AS STRING AUTO
	PROPERTY LastName 	AS STRING AUTO
        
    PROPERTY Code AS STRING AUTO
    PROPERTY Description AS STRING AUTO

	END CLASS
END NAMESPACE // DataAccess.XS.Models