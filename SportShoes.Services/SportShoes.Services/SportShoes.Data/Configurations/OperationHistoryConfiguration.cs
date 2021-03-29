using SportShoes.Data.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace SportShoes.Data.Configurations
{
    public class OperationHistoryConfiguration : IEntityTypeConfiguration<OperationHistory>
    {
        public void Configure(EntityTypeBuilder<OperationHistory> builder)
        {
            builder.ToTable("OperationHistories");
            builder.HasKey(x => x.Id);


            builder.Property(x => x.Content).IsRequired();

        }
    }
}
