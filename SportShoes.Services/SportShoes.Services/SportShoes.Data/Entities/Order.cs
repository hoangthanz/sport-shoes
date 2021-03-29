using SportShoes.Data.Enums;
using SportShoes.Data.Interfaces;
using SportShoes.Infrastructure.SharedKernel;
using System;
using System.Collections.Generic;

namespace SportShoes.Data.Entities
{
    public class Order : DomainEntity<string>, ISwitchable, IDateTracking
    {
        public DateTime? OrderDate { get; set; }

        public AppUser Buyer { get; set; }
        public Guid BuyerId { get; set; }


        public DateTime DateCreated { get; set; }

        public DateTime? DateModified { get; set; }

        public Status Status { get; set; }

        public Guid UserId { get; set; }

        public AppUser AppUser { get; set; }

        public List<OrderDetail> OrderDetails { get; set; }
    }
}
