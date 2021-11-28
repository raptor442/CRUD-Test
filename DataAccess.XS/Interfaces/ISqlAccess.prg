// ISqlAccess.prg
// Created by    : Dave
// Creation Date : 11/28/2021 1:10:43 PM
// Created for   : 
// WorkStation   : DESKTOP-AFHBU2N


USING System
USING System.Collections.Generic
USING System.Text
using System.Collections.Generic
using System.Threading.Tasks

BEGIN NAMESPACE DataAccess.XS.Interfaces

	/// <summary>
    /// The ISqlAccess class.
    /// </summary>
	PUBLIC INTERFACE ISqlAccess
 
    METHOD LoadData<T, U>(sqlCommand AS string, parameters AS U) AS Task<List<T>>
    METHOD SaveData<T>(sqlCommand AS string, parameters AS T) AS Task<int>

	END INTERFACE
END NAMESPACE // DataAccess.XS.Interfaces