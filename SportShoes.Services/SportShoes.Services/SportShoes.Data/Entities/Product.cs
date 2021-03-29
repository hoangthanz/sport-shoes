using SportShoes.Data.Enums;
using SportShoes.Data.Interfaces;
using SportShoes.Infrastructure.SharedKernel;
using System;
using System.Collections.Generic;

namespace SportShoes.Data.Entities
{
    public class Product:  DomainEntity<string>, ISwitchable,IDateTracking
    {
        public string Name { get; set; }
        public string Slug { get; set; }
        public string Summary { get; set; }
        public string Description { get; set; }
        public string ImageFile { get; set; }
        public decimal UnitPrice { get; set; }
        public int? UnitsInStock { get; set; }
        public double Star { get; set; }


        public string BrandId { get; set; }
        public Brand Brand { get; set; }

        public string ProductCategoryId { get; set; }
        public ProductCategory ProductCategory { get; set; }
        public List<OrderDetail> OrderDetails { get; set; }
        public List<Review> Reviews { get; set; } = new List<Review>();
        public DateTime DateCreated { set; get; }
        public DateTime? DateModified { set; get; }
        public Status Status { set; get; }
    }
}
