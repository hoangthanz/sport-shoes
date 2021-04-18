using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SportShoes.Application.ViewModels;
using SportShoes.Data.EF;
using SportShoes.Data.Entities;

namespace SportShoes.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly SportShoesDbContext _context;

        public OrdersController(SportShoesDbContext context)
        {
            _context = context;
        }

        // GET: api/Orders
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Order>>> GetOrders()
        {
            return await _context.Orders.ToListAsync();
        }

        [HttpGet("order-histories")]
        public async Task<ActionResult<IEnumerable<OrderViewModel>>> GetOrderHistories()
        {
            var orders = _context.Orders;
            var ordersViews = new List<OrderViewModel>();

            foreach (var order in orders)
            {
                var orderView = new OrderViewModel();
                orderView.Id = order.Id;
                orderView.Status = order.Status;
                
                orderView.BuyerId = order.BuyerId;
                var user = _context.AppUsers.Where(x => x.Id == order.BuyerId).FirstOrDefault();
                orderView.CustomerName = user.FirstName + " " + user.LastName;
                orderView.OrderDate = order.OrderDate;

                orderView.OrderDetails = _context.OrderDetails.Where(x => x.OrderId == order.Id).ToList();
                foreach (var item in orderView.OrderDetails)
                {
                    item.Product = _context.Products.Where(x => x.Id == item.ProductId).FirstOrDefault();
                }
                orderView.Total = orderView.OrderDetails.Sum(x => x.Quantity * x.Price);

                ordersViews.Add(orderView);
            }

            return ordersViews;
        }


        // GET: api/Orders/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Order>> GetOrder(string id)
        {
            var order = await _context.Orders.FindAsync(id);

            if (order == null)
            {
                return NotFound();
            }

            return order;
        }

        // PUT: api/Orders/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutOrder(string id, Order order)
        {
            if (id != order.Id)
            {
                return BadRequest();
            }

            _context.Entry(order).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OrderExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Orders
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Order>> PostOrder(Order order)
        {
            order.Id = Guid.NewGuid().ToString();

            _context.Orders.Add(order);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (OrderExists(order.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetOrder", new { id = order.Id }, order);
        }


        [HttpPost("buy")]
        public async Task<ActionResult> PostOrderPayment(OrderViewModel orderView)
        {
            var order = new Order();
            order.Id = Guid.NewGuid().ToString();
            order.Status = Data.Enums.Status.Active;
            order.BuyerId = orderView.BuyerId;
            order.UserId = orderView.UserId;
            order.OrderDate = DateTime.Now;
            _context.Orders.Add(order);

            var orderDetails = new List<OrderDetail>();

            foreach (var item in orderView.OrderDetails) 
            {
                var orderDetail = new OrderDetail();
                orderDetail.Id = Guid.NewGuid().ToString();
                orderDetail.OrderId = order.Id;
                orderDetail.Price = item.Price;
                orderDetail.Quantity = item.Quantity;
                orderDetail.ProductId = item.ProductId;

                var product = _context.Products.Where(x => x.Id == item.ProductId).FirstOrDefault();
                product.UnitsInStock -= item.Quantity;
                _context.Products.Update(product);
                orderDetails.Add(orderDetail);
            }

            _context.OrderDetails.AddRange(orderDetails);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (OrderExists(order.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return Ok();
        }

        // DELETE: api/Orders/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Order>> DeleteOrder(string id)
        {
            var order = await _context.Orders.FindAsync(id);
            if (order == null)
            {
                return NotFound();
            }

            _context.Orders.Remove(order);
            await _context.SaveChangesAsync();

            return order;
        }

        private bool OrderExists(string id)
        {
            return _context.Orders.Any(e => e.Id == id);
        }
    }
}
