// DBAccessHelper.prg
// Created by    : Dave
// Creation Date : 11/28/2021 9:26:29 PM
// Created for   : 
// WorkStation   : DESKTOP-AFHBU2N


USING System
USING System.Collections.Generic
USING System.Text
USING DataAccess.XS.Interfaces
USING DataAccess.XS.DbAccess

BEGIN NAMESPACE DataAccess.XS.Helpers

	/// <summary>
    /// The DBAccessHelper class.
    /// </summary>
	CLASS DBAccessHelper
 
    PUBLIC STATIC METHOD GetSqlAccess(connectionId AS STRING) AS ISqlAccess
        LOCAL sqlAccess AS ISqlAccess
        
        SWITCH connectionId
		CASE "sqlite"
			sqlAccess := SqliteAccess{connectionId}
		CASE "sqlserver"
			sqlAccess := MSSqlAccess{connectionId}
		OTHERWISE
			sqlAccess := SqliteAccess{connectionId}
		END SWITCH
		
        RETURN sqlAccess
	END CLASS
END NAMESPACE // DataAccess.XS.Helpers