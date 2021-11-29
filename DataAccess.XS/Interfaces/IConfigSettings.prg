// IConfigSettings.prg
// Created by    : Dave
// Creation Date : 11/29/2021 8:39:12 AM
// Created for   : 
// WorkStation   : DESKTOP-AFHBU2N


USING System
USING System.Collections.Generic
USING System.Text

BEGIN NAMESPACE DataAccess.XS.Interfaces

	/// <summary>
    /// The IConfigSettings class.
    /// </summary>
	PUBLIC INTERFACE IConfigSettings
    
    PROPERTY ConnectionId AS STRING GET
    PROPERTY ConnectionString AS STRING GET

	END INTERFACE
END NAMESPACE // DataAccess.XS.Interfaces