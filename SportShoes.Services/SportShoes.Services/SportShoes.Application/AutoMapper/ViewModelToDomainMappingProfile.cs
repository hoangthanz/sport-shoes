using AutoMapper;
using SportShoes.Application.ViewModels;
using SportShoes.Data.Entities;

namespace SportShoes.Application.AutoMapper
{
    public class ViewModelToDomainMappingProfile : Profile
    {
        public ViewModelToDomainMappingProfile()
        {

            CreateMap<AppRoleViewModel, AppRole>();
            CreateMap<AppUserViewModel, AppUser>();


            CreateMap<ContactViewModel, Contact>();


            CreateMap<FeedbackViewModel, Feedback>();



            CreateMap<AnnouncementViewModel, Announcement>()
                .ConstructUsing(c => new Announcement(c.Title, c.Content, c.UserId, c.Status));

            CreateMap<AnnouncementUserViewModel, AnnouncementUser>()
                .ConstructUsing(c => new AnnouncementUser(c.AnnouncementId, c.UserId, c.HasRead));


            CreateMap<WalletViewModel, Wallet>();
            CreateMap<TransactionHistoryViewModel, TransactionHistory>();

            CreateMap<TransactionViewModel, Transaction>();

            CreateMap<BankCardViewModel, BankCard>();


        }
    }
}
