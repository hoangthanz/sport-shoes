using Microsoft.AspNetCore.Identity;
using System;

namespace SportShoes.Data.Entities
{
    public class AppRole : IdentityRole<Guid>
    {
        public string Description { get; set; }
    }
}
