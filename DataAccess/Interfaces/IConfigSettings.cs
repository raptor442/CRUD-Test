namespace DataAccess.CS.Interfaces
{
    public interface IConfigSettings
    {
        string ConnectionId { get; }
        string ConnectionString { get; }
    }
}