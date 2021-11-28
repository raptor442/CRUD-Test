// SqliteAccess.prg
// Created by    : Dave
// Creation Date : 11/28/2021 1:22:29 PM
// Created for   : 
// WorkStation   : DESKTOP-AFHBU2N


USING System
USING System.Text
USING DataAccess.XS.Interfaces
using Dapper
using System.Collections.Generic
using System.Configuration
using System.Data
using System.Data.SQLite
using System.Linq
using System.Threading.Tasks

BEGIN NAMESPACE DataAccess.XS.DbAccess

	/// <summary>
    /// The SqliteAccess class.
    /// </summary>
	PUBLIC CLASS SqliteAccess IMPLEMENTS ISqlAccess
        PROTECT connectionId AS STRING
        
    CONSTRUCTOR(connId AS STRING)
        SELF:connectionId := connId
        RETURN

    PUBLIC ASYNC METHOD LoadData<T, U>(sqlCommand AS string, parameters AS U) AS Task<List<T>>
        LOCAL outputList := List<T>{} AS List<T>
        
        BEGIN USING VAR connection := SQLiteConnection{GetConnectionString(SELF:connectionId)}
            VAR output := AWAIT connection:QueryAsync<T>(sqlCommand, DynamicParameters{})
            outputList := output:ToList()
        END USING
        
        RETURN outputList
        
    PUBLIC ASYNC METHOD SaveData<T>(sqlCommand AS string, parameters AS T) AS Task<int>
        LOCAL rowsAffected := 0 AS INT
        
        BEGIN USING VAR connection := SQLiteConnection{GetConnectionString(SELF:connectionId)}
            rowsAffected := AWAIT connection:ExecuteAsync(sqlCommand, parameters)
        END USING 
        
        RETURN rowsAffected

    PRIVATE METHOD GetConnectionString(id AS string) AS string
        VAR connectionString := ConfigurationManager.ConnectionStrings[id].ConnectionString
        RETURN connectionString
        
	END CLASS
END NAMESPACE // DataAccess.XS.DbAccess