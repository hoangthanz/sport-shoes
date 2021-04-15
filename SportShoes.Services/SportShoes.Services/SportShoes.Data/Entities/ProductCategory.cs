using SportShoes.Data.Enums;
using SportShoes.Data.Interfaces;
using SportShoes.Infrastructure.SharedKernel;
using System;
using System.Collections.Generic;

namespace SportShoes.Data.Entities
{
    public class ProductCategory:  DomainEntity<string>, ISwitchable,IDateTracking
    {
        public string Name { get; set; }
        public Guid? UserId { get; set; }
        public AppUser? AppUser { get; set; }


        public DateTime DateCreated { set; get; }
        public DateTime? DateModified { set; get; }
        public Status Status { set; get; }

        public List<Product> Products { get; set; }

    }
}
