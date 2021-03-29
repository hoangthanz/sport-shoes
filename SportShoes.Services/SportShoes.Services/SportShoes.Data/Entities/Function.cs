using SportShoes.Data.Enums;
using SportShoes.Data.Interfaces;
using SportShoes.Infrastructure.SharedKernel;
using System.Collections.Generic;

namespace SportShoes.Data.Entities
{
    public class Function : DomainEntity<string>, ISwitchable
    {
        public string Name { get; set; }
        public string Code { get; set; }

        public Status Status { get; set; }


        public List<Permission> Permissions { get; set; }
    }
}
