using SportShoes.Data.Enums;
using SportShoes.Data.Interfaces;
using SportShoes.Infrastructure.SharedKernel;
using System;

namespace SportShoes.Data.Entities
{
    public class Promotion : DomainEntity<int>, ISwitchable, IDateTracking
    {
        public string Name { get; set; }
        public string Code { get; set; }

        public DateTime FromDate { get; set; }

        public DateTime ToDate { get; set; }

        public string Content { get; set; }
        public DateTime DateCreated { set; get; }
        public DateTime? DateModified { set; get; }
        public Status Status { set; get; }
    }
}
