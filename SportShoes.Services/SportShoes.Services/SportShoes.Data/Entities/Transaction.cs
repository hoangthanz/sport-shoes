using SportShoes.Data.Enums;
using SportShoes.Data.Interfaces;
using SportShoes.Infrastructure.SharedKernel;
using System;

namespace SportShoes.Data.Entities
{
    public class Transaction : DomainEntity<string>, ISwitchable, IDateTracking
    {

        public string Content { get; set; }

        public Guid UserId { get; set; }

        public TransactionType TransactionType { get; set; }

        public BillStatus BillStatus { get; set; }

        public DateTime DateCreated { set; get; }

        public DateTime? DateModified { set; get; }

        public Status Status { set; get; }

        public double Coin { get; set; }

        public string BankCardId { get; set; }

        public string OwnerBankId { get; set; }
    }
}
