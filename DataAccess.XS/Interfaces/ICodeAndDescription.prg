// ICodeAndDescription.prg
// Created by    : Dave
// Creation Date : 12/12/2021 1:58:51 PM
// Created for   : 
// WorkStation   : DESKTOP-AFHBU2N


USING System
USING System.Collections.Generic
USING System.Text

BEGIN NAMESPACE DataAccess.XS.Interfaces

	/// <summary>
    /// The ICodeAndDescription class.
    /// </summary>
	PUBLIC INTERFACE ICodeAndDescription
 
    PROPERTY Code AS STRING GET
    PROPERTY Description AS STRING GET

	END INTERFACE
END NAMESPACE // DataAccess.XS.Interfaces