using DataAccess.CS.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.CS.Extensions
{
    public static class ListExtensions
    {
        public static bool Seek(this List<ICodeAndDescription> list, string searchValue, bool softSearch, bool last)
        {
            return true;
        }
    }
}
