using SportShoes.Infrastructure.SharedKernel;

namespace SportShoes.Data.Entities
{
    public class OrderDetail: DomainEntity<string>
    {
        public string OrderId { get; set; }
        public string ProductId { get; set; }
        public Order Order { get; set; }
        public Product Product { get; set; }

        public int Quantity { get; set; }

        public decimal Price { get; set; }

    }
}
