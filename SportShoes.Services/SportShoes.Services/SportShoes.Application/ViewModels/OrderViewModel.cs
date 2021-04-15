using SportShoes.Data.Entities;
using System;
using System.Collections.Generic;

namespace SportShoes.Application.ViewModels
{
    public class OrderViewModel 
    {
        public DateTime? OrderDate { get; set; }

        public Guid BuyerId { get; set; }


        public Guid UserId { get; set; }

        public List<OrderDetail> OrderDetails { get; set; }

    }
}
