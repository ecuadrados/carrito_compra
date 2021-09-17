using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarritoCompra.Models
{
    public class repositorio
    {
        public void Guardar(Carrito modelo)
        {
            using (var db = new dbContext())
            {
                db.carritos.Add(modelo);
                db.SaveChanges();

            }
        }
    }
}