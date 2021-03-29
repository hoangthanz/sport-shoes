using System;
using SportShoes.Data.Enums;
using SportShoes.Data.Interfaces;
using SportShoes.Infrastructure.SharedKernel;

namespace SportShoes.Data.Entities
{
    public class Review:  DomainEntity<string>, ISwitchable,IDateTracking
    {
        public string Name { get; set; }
        public string EMail { get; set; }
        public string Comment { get; set; }
        public double Star { get; set; }

        public DateTime DateCreated { set; get; }
        public DateTime? DateModified { set; get; }
        public Status Status { set; get; }
    }
}
