// ConfigSettings.prg
// Created by    : Dave
// Creation Date : 11/29/2021 8:27:54 AM
// Created for   : 
// WorkStation   : DESKTOP-AFHBU2N


USING System
USING System.Collections.Generic
USING System.Text
USING System.Configuration
USING DataAccess.XS.Interfaces

BEGIN NAMESPACE DataAccess.XS.Config

	/// <summary>
    /// The ConfigSettings class.
    /// </summary>
	PUBLIC CLASS ConfigSettings IMPLEMENTS IConfigSettings
 
	PROPERTY ConnectionId AS STRING 
		GET  
            RETURN ConfigurationManager:AppSettings:Get("connectionId")
        END GET
    END PROPERTY
    
    PROPERTY ConnectionString AS STRING
        GET
            RETURN ConfigurationManager:ConnectionStrings[ConnectionId]:ConnectionString
        END GET
    END PROPERTY
    
	END CLASS
END NAMESPACE // DataAccess.XS.Config