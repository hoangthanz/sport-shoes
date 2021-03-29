using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using System.IO;

namespace SportShoes.Data.EF
{
    public class LotteryManageContextFactory : IDesignTimeDbContextFactory<SportShoesDbContext>
    {
        public SportShoesDbContext CreateDbContext(string[] args)
        {
            /* Read current folder and get connection string in appsettings.json file */

            IConfigurationRoot configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .Build();


            var connectionString = configuration.GetConnectionString("SportShoesDb");

            var optionsBuilder = new DbContextOptionsBuilder<SportShoesDbContext>();
            optionsBuilder.UseSqlServer(connectionString);

            return new SportShoesDbContext(optionsBuilder.Options);
        }
    }
}
