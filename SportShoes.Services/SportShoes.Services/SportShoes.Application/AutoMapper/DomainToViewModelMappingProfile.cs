using AutoMapper;
using SportShoes.Application.ViewModels;
using SportShoes.Data.Entities;

namespace SportShoes.Application.AutoMapper
{
    public class DomainToViewModelMappingProfile : Profile
    {
        public DomainToViewModelMappingProfile()
        {
            CreateMap<AppRole, AppRoleViewModel>();
            CreateMap<AppUser, AppUserViewModel>();

            CreateMap<Contact, ContactViewModel>();

            CreateMap<Feedback, FeedbackViewModel>();

            CreateMap<Announcement, AnnouncementViewModel>().MaxDepth(2);

            CreateMap<Wallet, WalletViewModel>();
            CreateMap<TransactionHistory, TransactionHistoryViewModel>();
            CreateMap<Transaction, TransactionViewModel>();
            CreateMap<BankCard, BankCardViewModel>();


        }
    }
}
