using SportShoes.Infrastructure.SharedKernel;

namespace SportShoes.Data.Entities
{
    public class CartDetail : DomainEntity<string>
    {
        public string CartId { get; set; }
        public Cart Cart { get; set; }
        public int Quantity { get; set; }
        public string Color { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal TotalPrice { get; set; }
        public string ProductId { get; set; }
        public Product Product { get; set; }
    }
}
