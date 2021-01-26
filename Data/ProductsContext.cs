using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using mycrud.Models;

namespace mycrud.Data
{
    public class ProductsContext : DbContext
    {
        public ProductsContext (DbContextOptions<ProductsContext> options)
            : base(options)
        {
            this.Database.EnsureCreated();
        }

        public DbSet<mycrud.Models.Product> Product { get; set; }
    }
}
