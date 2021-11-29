// MSSqlAccess.prg
// Created by    : Dave
// Creation Date : 11/28/2021 9:45:40 PM
// Created for   : 
// WorkStation   : DESKTOP-AFHBU2N


USING Dapper
USING System.Collections.Generic
USING System.Configuration
USING System.Data
USING System.Data.SqlClient
USING System.Linq
USING System.Threading.Tasks
USING DataAccess.XS.Interfaces

BEGIN NAMESPACE DataAccess.XS.DbAccess

	/// <summary>
    /// The MSSqlAccess class.
    /// </summary>
 
	PUBLIC CLASS MSSqlAccess IMPLEMENTS ISqlAccess
        PROTECT configSettings AS IConfigSettings
        
    CONSTRUCTOR(config AS IConfigSettings)
        SELF:configSettings := config
        RETURN

    PUBLIC ASYNC METHOD LoadData<T, U>(sqlCommand AS string, parameters AS U) AS Task<List<T>>
        LOCAL outputList := List<T>{} AS List<T>
        
        BEGIN USING VAR connection := SqlConnection{configSettings:ConnectionString}
            VAR output := AWAIT connection:QueryAsync<T>(sqlCommand, DynamicParameters{})
            outputList := output:ToList()
        END USING
        
        RETURN outputList
        
    PUBLIC ASYNC METHOD SaveData<T>(sqlCommand AS string, parameters AS T) AS Task<int>
        LOCAL rowsAffected := 0 AS INT
        
        BEGIN USING VAR connection := SqlConnection{configSettings:ConnectionString}
            rowsAffected := AWAIT connection:ExecuteAsync(sqlCommand, parameters)
        END USING 
        
        RETURN rowsAffected

	END CLASS
END NAMESPACE // DataAccess.XS.DbAccess