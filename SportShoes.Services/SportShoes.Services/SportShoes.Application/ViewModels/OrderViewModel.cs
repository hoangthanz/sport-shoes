using SportShoes.Data.Entities;
using SportShoes.Data.Enums;
using System;
using System.Collections.Generic;

namespace SportShoes.Application.ViewModels
{
    public class OrderViewModel 
    {
        public string Id { get; set; }
        public DateTime? OrderDate { get; set; }

        public Guid BuyerId { get; set; }

        public string CustomerName { get; set; }

        public Status Status { get; set; }


        public Guid UserId { get; set; }

        public List<OrderDetail> OrderDetails { get; set; }

        public decimal Total { get; set; }

    }
}
