using SportShoes.Infrastructure.SharedKernel;

namespace SportShoes.Data.Entities
{
    public class ProductWishlist : DomainEntity<string>
    {
        public string ProductId { get; set; }
        public Product Product { get; set; }

        public string WishlistId { get; set; }
        public Wishlist Wishlist { get; set; }
    }
}
