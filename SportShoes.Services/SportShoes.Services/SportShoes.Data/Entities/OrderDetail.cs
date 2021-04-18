using SportShoes.Infrastructure.SharedKernel;
using System.ComponentModel.DataAnnotations.Schema;

namespace SportShoes.Data.Entities
{
    public class OrderDetail: DomainEntity<string>
    {
        public string OrderId { get; set; }
        public string ProductId { get; set; }

        [NotMapped]
        public Order Order { get; set; }

        public Product Product { get; set; }

        public int Quantity { get; set; }

        public decimal Price { get; set; }

    }
}
