using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.CS.Interfaces
{
    public interface ICodeAndDescription
    {
        string Code { get; set; }
        string Description { get; set; }
    }
}
