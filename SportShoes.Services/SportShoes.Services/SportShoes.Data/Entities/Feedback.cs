using SportShoes.Data.Enums;
using SportShoes.Data.Interfaces;
using SportShoes.Infrastructure.SharedKernel;
using System;

namespace SportShoes.Data.Entities
{
    public class Feedback : DomainEntity<int>, ISwitchable, IDateTracking
    {
        public Feedback() { }

        public Feedback(int id, string name, string email, string message, Status status)
        {
            Id = id;
            Name = name;
            Email = email;
            Message = message;
            Status = status;
        }

        public string Name { set; get; }


        public string Email { set; get; }


        public string Message { set; get; }

        public Status Status { set; get; }
        public DateTime DateCreated { set; get; }
        public DateTime? DateModified { set; get; }
      
    }
}
