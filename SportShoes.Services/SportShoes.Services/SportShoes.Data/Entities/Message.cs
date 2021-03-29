using SportShoes.Data.Enums;
using SportShoes.Data.Interfaces;
using SportShoes.Infrastructure.SharedKernel;
using System;

namespace SportShoes.Data.Entities
{
    public class Message : DomainEntity<string>, ISwitchable, IDateTracking
    {
        public string Content { get; set; }

        public Guid UserId { get; set; }
        public AppUser AppUser { get; set; }

        public DateTime DateCreated { set; get; }
        public DateTime? DateModified { set; get; }
        public Status Status { set; get; }
    }
}
