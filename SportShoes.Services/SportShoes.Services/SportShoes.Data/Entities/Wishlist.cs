using System;
using System.Collections.Generic;
using SportShoes.Infrastructure.SharedKernel;

namespace SportShoes.Data.Entities
{
    public class Wishlist : DomainEntity<string>
    {
        public string UserName { get; set; }
        public List<ProductWishlist> ProductWishlists { get; set; } = new List<ProductWishlist>();

        public Guid UserId { set; get; }
        public AppUser AppUser { get; set; }
    }
}
