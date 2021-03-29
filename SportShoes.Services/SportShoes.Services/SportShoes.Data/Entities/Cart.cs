using SportShoes.Infrastructure.SharedKernel;
using System.Collections.Generic;

namespace SportShoes.Data.Entities
{
    public class Cart: DomainEntity<string>
    {
        public AppUser AppUser { get; set; }
        public string UserName { get; set; }
        public List<CartDetail> Items { get; set; } = new List<CartDetail>();
    }
}
