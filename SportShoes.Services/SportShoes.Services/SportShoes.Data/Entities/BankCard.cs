using SportShoes.Data.Enums;
using SportShoes.Data.Interfaces;
using SportShoes.Infrastructure.SharedKernel;
using System;

namespace SportShoes.Data.Entities
{
    public class BankCard : DomainEntity<string>, ISwitchable, IDateTracking
    {
        public string BankName { get; set; }
        public string BankBranch { get; set; }

        public string FullNameOwner { get; set; }

        public string BankAccountNumber { get; set; }

        public DateTime DateCreated { get; set; }

        public DateTime? DateModified { get; set; }

        public Status Status { get; set; }


        public Guid UserId { get; set; }

        public AppUser AppUser { get; set; }
    }
}
