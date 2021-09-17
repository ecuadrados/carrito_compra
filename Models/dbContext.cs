using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace CarritoCompra.Models
{
    public class dbContext: DbContext
    {
        public dbContext(): base("conexion")
        {

        }
        public DbSet<Carrito> carritos { get; set; }
    }
}