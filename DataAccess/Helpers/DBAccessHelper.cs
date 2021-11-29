using DataAccess.CS.DbAccess;
using DataAccess.CS.Interfaces;

namespace DataAccess.CS.Helpers
{
    public class DBAccessHelper
    {
        public static ISqlAccess GetSqlAccess(IConfigSettings configSettings)
        {
            ISqlAccess sqlAccess = null;

            switch (configSettings.ConnectionId)
            {
                case "sqlite":
                    sqlAccess = new SqliteAccess(configSettings);
                    break;
                case "sqlserver":
                    sqlAccess = new MSSqlAccess(configSettings);
                    break;
            }

            return sqlAccess;
        }
    }
}
