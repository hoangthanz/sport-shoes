using SportShoes.Data.EF;
using SportShoes.Data.Entities;
using SportShoes.Data.Enums;
using SportShoes.Utilities.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SportShoes.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InitializeController : ControllerBase
    {
        private readonly SportShoesDbContext _context;
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;
        public InitializeController(
            SportShoesDbContext context,
            UserManager<AppUser> userManager,
            SignInManager<AppUser> signInManager
            )
        {
            _context = context;
            _userManager = userManager;
            _signInManager = signInManager;
        }

        [HttpGet("Initialize-Database")]
        [AllowAnonymous]
        public async Task<IActionResult> SeedData()
        {
            try
            {

                if (_context.AppUsers.ToList().Count == 0)
                {

                    var user = new AppUser()
                    {
                        DateOfBirth = DateTime.Now,
                        Email = "admin@gmail.com",
                        FirstName = "Admin",
                        LastName = "Lottery",
                        UserName = "admin",
                        PhoneNumber = "0900000000",
                        Avatar = "",
                        NickName = "Adminstrator",
                        TransactionPassword = "123456",
                        RefRegisterLink = "",
                        WalletId = ""
                    };
                    var result = await _userManager.CreateAsync(user, "123123aA@");
                    await _context.AppUsers.AddAsync(user);
                }

                if (!_context.Wallets.Any())
                {
                    var user = _context.AppUsers.Where(x => x.UserName == "admin").FirstOrDefault();

                    var wallet = new Wallet
                    {
                        DateCreated = DateTime.Now,
                        PendingCoin = 0,
                        Coin = 999999999,
                        Id = Guid.NewGuid().ToString(),
                        Status = Status.Active,
                        PromotionCoin = 0,
                        WalletId = TextHelper.RandomString(10),
                        UserId = user.Id.ToString()
                    };

                    string walletId = wallet.WalletId;

                    await _context.Wallets.AddAsync(wallet);
                    _context.SaveChanges();

                    user.WalletId = walletId;
                    _context.AppUsers.Update(user);
                    _context.SaveChanges();

                }


                if (!_context.OwnerBanks.Any())
                {
                    var banks = new List<OwnerBank>
                    {
                        new OwnerBank{
                            FullNameOwner = "Adminstrator",
                            BankName = "Ngân hàng ABC",
                            AccountNumber = "xxxx xxxx xxxx xxxx",
                            Branch =  "Chi nhánh VN",
                        },
                        new OwnerBank{
                            FullNameOwner = "Adminstrator",
                            BankName = "Ngân hàng ABC 1",
                            AccountNumber = "xxxx xxxx xxxx xxxx",
                            Branch =  "Chi nhánh VN",
                        },
                        new OwnerBank{
                            FullNameOwner = "Adminstrator",
                            BankName = "Ngân hàng ABC 2",
                            AccountNumber = "xxxx xxxx xxxx xxxx",
                            Branch =  "Chi nhánh VN",
                        }
                    };

                    _context.OwnerBanks.AddRange(banks);
                    _context.SaveChanges();
                }

                if (_context.Permissions.ToList().Count == 0)
                {
                    List<Permission> permissions = new List<Permission>();

                    var user = _context.Users.ToList()[0];
                    foreach (var fun in _context.Functions.ToList())
                    {
                        var per = new Permission() { Id = Guid.NewGuid().ToString(), DateCreated = DateTime.Now, Status = Status.Active, UserId = user.Id, FunctionId = fun.Id };
                        permissions.Add(per);
                    }

                    await _context.Permissions.AddRangeAsync(permissions);
                }

                if (_context.Functions.ToList().Count == 0)
                {
                    List<Function> functions = new List<Function>()
                    {
                        new Function(){ Id = Guid.NewGuid().ToString(), Name = "Quyền Admin", Code = "ExportXLS", Status = Status.Active},
                        new Function(){ Id = Guid.NewGuid().ToString(), Name = "Điều chỉnh tài khoản", Code = "Admin", Status = Status.Active},
                        new Function(){ Id = Guid.NewGuid().ToString(), Name = "", Code = "Player", Status = Status.Active},

                        new Function(){ Id = Guid.NewGuid().ToString(), Name = "", Code = "ProfitPercent.Read", Status = Status.Active},
                        new Function(){ Id = Guid.NewGuid().ToString(), Name = "", Code = "ProfitPercent.Write", Status = Status.Active},
                        new Function(){ Id = Guid.NewGuid().ToString(), Name = "", Code = "ProfitPercent.Delete", Status = Status.Active},

                        new Function(){ Id = Guid.NewGuid().ToString(), Name = "", Code = "Account.Read", Status = Status.Active},
                        new Function(){ Id = Guid.NewGuid().ToString(), Name = "", Code = "Account.Write", Status = Status.Active},
                        new Function(){ Id = Guid.NewGuid().ToString(), Name = "", Code = "Account.Delete", Status = Status.Active},

                        new Function(){ Id = Guid.NewGuid().ToString(), Name = "", Code = "Transaction.Read", Status = Status.Active},
                        new Function(){ Id = Guid.NewGuid().ToString(), Name = "", Code = "Transaction.Write", Status = Status.Active},
                        new Function(){ Id = Guid.NewGuid().ToString(), Name = "", Code = "Transaction.Delete", Status = Status.Active},

                    };

                    await _context.Functions.AddRangeAsync(functions);
                    await _context.SaveChangesAsync();

                }

                if (_context.Brands.ToList().Count == 0)
                {
                    List<Brand> functions = new List<Brand>()
                    {
                        new Brand(){ Id = Guid.NewGuid().ToString(), Name = "Adidas", Status = Status.Active},
                        new Brand(){ Id = Guid.NewGuid().ToString(), Name = "Puma",  Status = Status.Active},
                        new Brand(){ Id = Guid.NewGuid().ToString(), Name = "Nike",  Status = Status.Active},
                    };

                    await _context.Brands.AddRangeAsync(functions);
                    await _context.SaveChangesAsync();

                }

                if(_context.ProductCategories.ToList().Count == 0)
                {

                    var productCategories = new List<ProductCategory>()
                    {
                        new ProductCategory(){ Id = Guid.NewGuid().ToString(), Name = "Giày Adidas", Status= Status.Active},
                        new ProductCategory(){ Id = Guid.NewGuid().ToString(), Name = "Giày Puma", Status= Status.Active},
                        new ProductCategory(){ Id = Guid.NewGuid().ToString(), Name = "Giày Nike", Status= Status.Active},
                        new ProductCategory(){ Id = Guid.NewGuid().ToString(), Name = "Áo thun", Status= Status.Active},
                        new ProductCategory(){ Id = Guid.NewGuid().ToString(), Name = "Băng đeo tay", Status= Status.Active},
                        new ProductCategory(){ Id = Guid.NewGuid().ToString(), Name = "Băng trán", Status= Status.Active},
                        new ProductCategory(){ Id = Guid.NewGuid().ToString(), Name = "Túi xách", Status= Status.Active}
                    };

                    await _context.ProductCategories.AddRangeAsync(productCategories);
                    await _context.SaveChangesAsync();
                }

                if (_context.Products.ToList().Count == 0)
                {

                    var productCategory = _context.ProductCategories.FirstOrDefault();
           
                    
                        var brand = _context.Brands.FirstOrDefault();
                        if (brand == null)
                            return BadRequest();

                   

                        if (productCategory == null)
                            return BadRequest();
                        var products = new List<Product>()
                        {
                            new Product(){Id = Guid.NewGuid().ToString(), BrandId = brand.Id,ImageFile="images/1.jpg", Name="Sản phẩm 1",ProductCategoryId =  productCategory.Id, Star = 5, Summary = "", Status = Status.Active, Price = 100000,UnitsInStock = 10},
                            new Product(){Id = Guid.NewGuid().ToString(), BrandId = brand.Id,ImageFile="images/2.jpg", Name="Sản phẩm 2",ProductCategoryId =  productCategory.Id, Star = 5, Summary = "", Status = Status.Active, Price = 100000,UnitsInStock = 10},
                            new Product(){Id = Guid.NewGuid().ToString(), BrandId = brand.Id,ImageFile="images/3.jpg", Name="Sản phẩm 3",ProductCategoryId =  productCategory.Id, Star = 5, Summary = "", Status = Status.Active, Price = 100000,UnitsInStock = 10},
                            new Product(){Id = Guid.NewGuid().ToString(), BrandId = brand.Id,ImageFile="images/4.jpg", Name="Sản phẩm 4",ProductCategoryId =  productCategory.Id, Star = 5, Summary = "", Status = Status.Active, Price = 100000,UnitsInStock = 10},
                            new Product(){Id = Guid.NewGuid().ToString(), BrandId = brand.Id,ImageFile="images/5.jpg", Name="Sản phẩm 5",ProductCategoryId =  productCategory.Id, Star = 5, Summary = "", Status = Status.Active, Price = 100000,UnitsInStock = 10},
                            new Product(){Id = Guid.NewGuid().ToString(), BrandId = brand.Id,ImageFile="images/6.jpg", Name="Sản phẩm 6",ProductCategoryId =  productCategory.Id, Star = 5, Summary = "", Status = Status.Active, Price = 100000,UnitsInStock = 10},
                            new Product(){Id = Guid.NewGuid().ToString(), BrandId = brand.Id,ImageFile="images/7.jpg", Name="Sản phẩm 7",ProductCategoryId =  productCategory.Id, Star = 5, Summary = "", Status = Status.Active, Price = 100000,UnitsInStock = 10},
                            new Product(){Id = Guid.NewGuid().ToString(), BrandId = brand.Id,ImageFile="images/8.jpg", Name="Sản phẩm 8",ProductCategoryId =  productCategory.Id, Star = 5, Summary = "", Status = Status.Active, Price = 100000,UnitsInStock = 10},
                            new Product(){Id = Guid.NewGuid().ToString(), BrandId = brand.Id,ImageFile="images/9.jpg", Name="Sản phẩm 9",ProductCategoryId =  productCategory.Id, Star = 5, Summary = "", Status = Status.Active, Price = 100000,UnitsInStock = 10},
                            new Product(){Id = Guid.NewGuid().ToString(), BrandId = brand.Id,ImageFile="images/10.jpg", Name="Sản phẩm 10",ProductCategoryId =  productCategory.Id, Star = 5, Summary = "", Status = Status.Active, Price = 100000,UnitsInStock = 10},
                            new Product(){Id = Guid.NewGuid().ToString(), BrandId = brand.Id,ImageFile="images/11.jpg", Name="Sản phẩm 11",ProductCategoryId =  productCategory.Id, Star = 5, Summary = "", Status = Status.Active, Price = 100000,UnitsInStock = 10},
                        };
                        await _context.Products.AddRangeAsync(products);
                        await _context.SaveChangesAsync();

                   
                }

                if (_context.Wishlists.ToList().Count == 0)
                {
                    var users = _context.Users;
                    var wishlists = new List<Wishlist>();
                    foreach (var user in users)
                    {
                        var wishlist = new Wishlist();
                        wishlist.Id = Guid.NewGuid().ToString();
                        wishlist.UserName = user.UserName;
                        wishlist.UserId = user.Id;

                        wishlists.Add(wishlist);
                    }
                    

                    await _context.Wishlists.AddRangeAsync(wishlists);
                    await _context.SaveChangesAsync();

                }


                
                await _context.SaveChangesAsync();
                return Ok("Đã tạo được dữ liệu mẫu thành công");
            }
            catch(Exception e)
            {
                return BadRequest("Không tạo được dữ liệu mẫu");
            }

        }
    }
}