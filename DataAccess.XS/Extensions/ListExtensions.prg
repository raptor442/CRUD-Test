// ListExtensions.prg
// Created by    : Dave
// Creation Date : 12/12/2021 1:56:30 PM
// Created for   : 
// WorkStation   : DESKTOP-AFHBU2N


USING System
USING System.Collections.Generic
USING System.Text
USING DataAccess.XS.Interfaces
USING System.Linq

BEGIN NAMESPACE DataAccess.XS.Extensions

	/// <summary>
    /// The ListExtensions class.
    /// </summary>
	STATIC CLASS ListExtensions
 
    STATIC METHOD Seek(SELF list AS List<ICodeAndDescription>, searchExpression AS STRING, softSeek AS LOGIC, last AS LOGIC) AS LOGIC
        list:Any({x => x:Code:StartsWith(searchExpression)})
        RETURN FALSE

	END CLASS
END NAMESPACE // DataAccess.XS.Extensions