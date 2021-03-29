using System;

namespace SportShoes.Application.ViewModels
{
    public class AnnouncementUserViewModel
    {
        public int Id { set; get; }

        public string AnnouncementId { get; set; }

        public Guid UserId { get; set; }

        public bool? HasRead { get; set; }

    }
}
