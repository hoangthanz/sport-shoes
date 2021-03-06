using System;

namespace SportShoes.Data.Interfaces
{
    public interface IDateTracking
    {
        DateTime DateCreated { set; get; }

        DateTime? DateModified { set; get; }
    }
}
