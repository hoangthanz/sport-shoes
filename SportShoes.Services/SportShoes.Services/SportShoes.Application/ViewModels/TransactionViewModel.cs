﻿using SportShoes.Data.Entities;
using SportShoes.Data.Enums;
using System;

namespace SportShoes.Application.ViewModels
{
    public class TransactionViewModel
    {
        public string Id { get; set; }
        public string Content { get; set; }

        public Guid UserId { get; set; }

        public TransactionType TransactionType { get; set; }

        public BillStatus BillStatus { get; set; }

        public DateTime DateCreated { set; get; }

        public DateTime? DateModified { set; get; }

        public Status Status { set; get; }

        public double Coin { get; set; }

        public bool IsVerified { get; set; }

        public AppUserViewModel AppUserViewModel { get; set; }

        public string BankCardId { get; set; }

        public BankCardViewModel BankCardViewModel { get; set; }


        public OwnerBank OwnerBankViewModel { get; set; }

        public Guid OwnerBankId { get; set; }
    }
}
