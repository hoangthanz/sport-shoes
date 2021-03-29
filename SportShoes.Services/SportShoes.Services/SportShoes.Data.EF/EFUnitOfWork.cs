using SportShoes.Infrastructure.Interfaces;

namespace SportShoes.Data.EF
{
    public class EFUnitOfWork : IUnitOfWork
    {
        private readonly SportShoesDbContext _context;

        public EFUnitOfWork(SportShoesDbContext context)
        {
            this._context = context;
        }

        public void Commit()
        {
            _context.SaveChanges();
        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
