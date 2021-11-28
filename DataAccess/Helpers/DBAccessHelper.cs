using DataAccess.DbAccess;

namespace DataAccess.Helpers
{
    public class DBAccessHelper
    {
        public static ISqlAccess GetSqlAccess(string connectionId)
        {
            ISqlAccess sqlAccess = null;

            switch (connectionId)
            {
                case "sqlite":
                    sqlAccess = new SqliteAccess(connectionId);
                    break;
                case "sqlserver":
                    sqlAccess = new MSSqlAccess(connectionId);
                    break;
            }

            return sqlAccess;
        }
    }
}
