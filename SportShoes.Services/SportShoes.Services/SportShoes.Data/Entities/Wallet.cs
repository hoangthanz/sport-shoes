using SportShoes.Data.Enums;
using SportShoes.Data.Interfaces;
using SportShoes.Infrastructure.SharedKernel;
using System;

namespace SportShoes.Data.Entities
{
    public class Wallet : DomainEntity<string>, ISwitchable, IDateTracking
    {
        public string WalletId { get; set; }

        public string UserId { get; set; }

        public AppUser AppUser { get; set; }

        
        public double Coin { get; set; }

        public double PromotionCoin { get; set; }

        public double PendingCoin { get; set; }

        public DateTime DateCreated { set; get; }
        public DateTime? DateModified { set; get; }
        public Status Status { set; get; }
    }
}
