using DataAccess.CS.Interfaces;
using System.Configuration;

namespace DataAccess.CS.Config
{
    public class ConfigSettings : IConfigSettings
    {
        public string ConnectionId => ConfigurationManager.AppSettings.Get("connectionId");
        public string ConnectionString => ConfigurationManager.ConnectionStrings[ConnectionId].ConnectionString;
    }
}
