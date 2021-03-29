﻿using AutoMapper;
using SportShoes.Application.ViewModels;
using SportShoes.Application.ViewModels.Conditions;
using SportShoes.Data.EF;
using SportShoes.Data.Entities;
using SportShoes.Data.Enums;
using SportShoes.HubConfig;
using SportShoes.TimerFeatures;
using SportShoes.Utilities.Dtos;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SportShoes.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TransactionsController : ControllerBase
    {
        private readonly SportShoesDbContext _context;
        private IHubContext<AccountHub> _hub;
        public TransactionsController(SportShoesDbContext context, IHubContext<AccountHub> hub)
        {
            _context = context;
            _hub = hub;
        }

      

        // POST: api/Transactions
        [HttpPost("condition")]
        public async Task<ActionResult<List<TransactionViewModel>>> GetTransactions(TransactionHistoryCondition condition)
        {
            try
            {
                var transactions = _context.Transactions.Where(x=>x.Status == Status.Active).OrderByDescending(x => x.DateCreated).ToList();

                if(condition.UserId != null)
                {
                    transactions = transactions.Where(x => x.UserId.ToString() == condition.UserId).ToList();
                }

                if (condition.FromDate != null)
                {
                    transactions = transactions.Where(x => x.DateCreated >= condition.FromDate && x.DateCreated <= condition.ToDate).ToList();
                }


                var transactionsViewModel = Mapper.Map<List<Transaction>, List<TransactionViewModel>>(transactions);

                foreach (var item in transactionsViewModel)
                {
                    var user = await _context.AppUsers.Where(x => x.Id == item.UserId).FirstOrDefaultAsync();
                    var banckCard = await _context.BankCards.Where(x => x.Id == item.BankCardId).FirstOrDefaultAsync();
                    var ownerBank = await _context.OwnerBanks.Where(x => x.Id == item.OwnerBankId).FirstOrDefaultAsync();

                    if(user != null)
                    {
                        var userView = Mapper.Map<AppUser, AppUserViewModel>(user);
                        item.AppUserViewModel = userView;
                    } 

                    if(banckCard != null)
                    {
                        var bankCardView = Mapper.Map<BankCard, BankCardViewModel>(banckCard);
                        item.BankCardId = banckCard.Id;
                        item.BankCardViewModel = bankCardView;
                    }
                    
                    if(ownerBank != null)
                    {
                        item.OwnerBankId = ownerBank.Id;
                        item.OwnerBankViewModel = ownerBank;
                    }
                  
                }
                if (condition.TransactionType != null)
                {
                    TransactionType transactionT = (TransactionType)condition.TransactionType;
                    if(transactionT == TransactionType.PayInAndWithdraw) 
                    {
                        transactionsViewModel = transactionsViewModel.Where(x => x.TransactionType == TransactionType.PayIn || x.TransactionType == TransactionType.Withdraw).ToList();
                    }
                    else
                    {
                        transactionsViewModel = transactionsViewModel.Where(x => x.TransactionType == transactionT).ToList();
                    }

                }

                if(condition.BillStatus != null)
                {
                    BillStatus billS = (BillStatus)condition.BillStatus;
                    transactionsViewModel = transactionsViewModel.Where(x => x.BillStatus == billS).ToList();
                }

                

                return transactionsViewModel;
            }
            catch (System.Exception)
            {

                throw;
            }
        }

        // GET: api/Transactions/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Transaction>> GetTransaction(string id)
        {
            var transaction = await _context.Transactions.FindAsync(id);

            if (transaction == null)
            {
                return NotFound();
            }

            return transaction;
        }

        // PUT: api/Transactions/5

        [HttpPut("{id}")]
        public async Task<IActionResult> PutTransaction(string id, Transaction transaction)
        {
            if (id != transaction.Id)
            {
                return BadRequest(new ResponseResult("Id trong giao dịch phải giống nhau"));
            }

            _context.Entry(transaction).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TransactionExists(id))
                {
                    return BadRequest(new ResponseResult("Không tìm thấy giao dịch!"));
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Transactions
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public ActionResult<object> PostTransaction(Transaction transaction)
        {

            try
            {
       
                if (string.IsNullOrEmpty(transaction.Content))
                {
                    return BadRequest(new ResponseResult("Nội dung không được để trống!"));
                }
                var user = _context.AppUsers.Where(x => x.Id == transaction.UserId).FirstOrDefault();

                if(user == null)
                {
                    return BadRequest(new ResponseResult("Không tìm thấy người dùng này! Vui lòng kiểm tra lại."));
                }

                var wallet =  _context.Wallets.Where(x => x.UserId == transaction.UserId.ToString()).FirstOrDefault();

                if (wallet == null)
                {
                    return BadRequest(new ResponseResult("Không tìm tài khoản ví của bạn !, liên hệ giúp đỡ theo đường dây nóng"));
                }





                if ( TransactionType.Withdraw == transaction.TransactionType)
                {
                    if (wallet.Coin < transaction.Coin)
                    {
                        return BadRequest(new ResponseResult("Số tiền trong ví không đủ để thực hiện thao tác này!"));
                    }
                    else
                    {
                        wallet.PendingCoin += transaction.Coin;

                        wallet.Coin -= transaction.Coin;

                        _context.Wallets.Update(wallet);
                    }
                }



                transaction.Id = Guid.NewGuid().ToString();
                transaction.DateCreated = DateTime.Now;
                transaction.Status = Status.Active;
                transaction.BillStatus = BillStatus.InProgress;

                _context.Transactions.Add(transaction);


                _context.SaveChanges();

                var transViewModel = Mapper.Map<Transaction, TransactionViewModel>(transaction);
                return transViewModel;

            }
            catch (DbUpdateException)
            {
                return BadRequest(new ResponseResult("Lỗi! "));
            }
            catch (Exception e)
            {
                return BadRequest(new ResponseResult("Lỗi không xác định! " + e.Message  ));
            }
        }

        // DELETE: api/Transactions/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Transaction>> DeleteTransaction(string id)
        {
            var transaction = await _context.Transactions.FindAsync(id);
            if (transaction == null)
            {
                return NotFound();
            }

            _context.Transactions.Remove(transaction);
            await _context.SaveChangesAsync();

            return transaction;
        }

        private bool TransactionExists(string id)
        {
            return _context.Transactions.Any(e => e.Id == id);
        }

        [HttpPut("confirm-transaction/{id}")]
        public async Task<ActionResult> ConfirmTransaction(string id, Transaction tran)
        {

            try
            {
                if (id != tran.Id)
                {
                    return BadRequest(new ResponseResult("Id trong giao dịch phải giống nhau"));
                }

                var transaction = _context.Transactions.Where(x => x.Id == id).FirstOrDefault();

                transaction.BillStatus = tran.BillStatus;

                if(transaction.BillStatus == BillStatus.InProgress)
                {
                    return Ok("Không có sự thay đổi?");
                }

                var user = _context.AppUsers.Where(x => x.Id == transaction.UserId).FirstOrDefault();

                // Cập nhật tiền vào ví

                var wallet = _context.Wallets.Where(x => x.WalletId == user.WalletId).FirstOrDefault();

                if (transaction.BillStatus != BillStatus.Cancelled)
                {
                  
                    //Nạp tiền
                    if (transaction.TransactionType == TransactionType.PayIn)
                    {
                        wallet.Coin += transaction.Coin;
                    }

                    //Rút tiền
                    if (transaction.TransactionType == TransactionType.Withdraw)
                    {
                        wallet.PendingCoin -= transaction.Coin;
                    }
                }
                else
                {
                    if (transaction.TransactionType == TransactionType.Withdraw)
                    {
                        wallet.PendingCoin -= transaction.Coin;
                        wallet.Coin += transaction.Coin;
                    }

                }
              

                // Ghi log giao dịch
                var transactionHistoryType = (TransactionHistoryType)((int)transaction.TransactionType);
                

                var transactionHistory = new TransactionHistory
                {
                    Id = Guid.NewGuid().ToString(),
                    UserId = wallet.UserId,
                    BillStatus = tran.BillStatus,
                    Coin = Math.Abs(transaction.Coin),
                    DateCreated = DateTime.Now,
                    Status = Status.Active,
                    TransactionHistoryType = transactionHistoryType,
                };

                string notifyTransaction = " đã nạp ";
                if (transactionHistory.TransactionHistoryType == TransactionHistoryType.Withdraw)
                    notifyTransaction = " đã rút ";

                transactionHistory.Content = "Tài khoản " + user.UserName + notifyTransaction + transaction.Coin + " vào lúc " + transactionHistory.DateCreated.ToString("dd/MM/yyyy hh:mm:ss tt");

                _context.TransactionHistories.Add(transactionHistory);


                await _context.SaveChangesAsync();

                await _hub.Clients.All.SendAsync("changeMoneyInWallet", user.Id.ToString());
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TransactionExists(id))
                {
                    return BadRequest(new ResponseResult("Không tìm thấy giao dịch!"));
                }
                else
                {
                    return BadRequest(new ResponseResult("Lỗi không xác định!"));
                }
            }

            return NoContent();
        }
    }
}
