using SportShoes.Data.Configurations;
using SportShoes.Data.Entities;
using SportShoes.Data.Interfaces;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using System;
using System.Linq;

namespace SportShoes.Data.EF
{
    public class SportShoesDbContext : IdentityDbContext<AppUser, AppRole, Guid>
    {
        public SportShoesDbContext(DbContextOptions options) : base(options)
        {
        }


        protected override void OnModelCreating(ModelBuilder builder)
        {
            // Configure using Fluent API
            _ = builder.ApplyConfiguration(new FeedbackConfiguration());

            builder.ApplyConfiguration(new AnnouncementConfiguration());
            builder.ApplyConfiguration(new AnnouncementUserConfiguration());




            builder.ApplyConfiguration(new AppConfigConfiguration());
            builder.ApplyConfiguration(new AppUserConfiguration());
            builder.ApplyConfiguration(new AppRoleConfiguration());


            
            builder.ApplyConfiguration(new MessageConfiguration());
            builder.ApplyConfiguration(new FunctionConfiguration());

            builder.ApplyConfiguration(new OperationHistoryConfiguration());
            builder.ApplyConfiguration(new PermissionConfiguration());

            builder.ApplyConfiguration(new PromotionConfiguration());
            builder.ApplyConfiguration(new TransactionHistoryConfiguration());
            builder.ApplyConfiguration(new WalletConfiguration());
            builder.ApplyConfiguration(new TransactionConfiguration());
            builder.ApplyConfiguration(new BankCardConfiguration());

            builder.Entity<IdentityUserClaim<Guid>>().ToTable("AppUserClaims");
            builder.Entity<IdentityUserRole<Guid>>().ToTable("AppUserRoles").HasKey(x => new { x.UserId, x.RoleId });
            builder.Entity<IdentityUserLogin<Guid>>().ToTable("AppUserLogins").HasKey(x => x.UserId);
            builder.Entity<IdentityRoleClaim<Guid>>().ToTable("AppRoleClaims");
            builder.Entity<IdentityUserToken<Guid>>().ToTable("AppUserTokens").HasKey(x => x.UserId);


            // base.OnModelCreating(builder);
        }
        public DbSet<Announcement> Announcements { get; set; }

        public DbSet<AnnouncementUser> AnnouncementUsers { get; set; }
        public DbSet<AppConfig> AppConfigs { get; set; }
        public DbSet<AppRole> AppRoles { get; set; }
        public DbSet<AppUser> AppUsers { get; set; }

     
        public DbSet<Contact> Contacts { get; set; }
        public DbSet<Feedback> Feedbacks { get; set; }

        public DbSet<Function> Functions { get; set; }

        public DbSet<Language> Languages { get; set; }
        public DbSet<Message> Messages { get; set; }
        public DbSet<OperationHistory> OperationHistories { get; set; }
        public DbSet<Permission> Permissions { get; set; }


        public DbSet<Promotion> Promotions { get; set; }
        public DbSet<TransactionHistory> TransactionHistories { get; set; }
        public DbSet<Transaction> Transactions { get; set; }

        public DbSet<Wallet> Wallets { get; set; }


        public DbSet<BankCard> BankCards { get; set; }

        public DbSet<OwnerBank> OwnerBanks { get; set; }



        public DbSet<Brand> Brands { get; set; }


        public DbSet<Cart> Carts { get; set; }

        public DbSet<CartDetail> CartDetails { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<ProductCategory> ProductCategories { get; set; }
        public DbSet<ProductWishlist> ProductWishlists { get; set; }
        public DbSet<Review> Reviews { get; set; }
        public DbSet<Wishlist> Wishlists { get; set; }



        public override int SaveChanges()
        {
            var modified = ChangeTracker.Entries().Where(e => e.State == EntityState.Modified || e.State == EntityState.Added);

            foreach (EntityEntry item in modified)
            {
                var changedOrAddedItem = item.Entity as IDateTracking;
                if (changedOrAddedItem != null)
                {
                    if (item.State == EntityState.Added)
                    {
                        changedOrAddedItem.DateCreated = DateTime.Now;
                    }
                    changedOrAddedItem.DateModified = DateTime.Now;
                }
            }
            return base.SaveChanges();
        }

    }
}
