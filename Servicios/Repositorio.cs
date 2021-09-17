using CarritoCompra.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarritoCompra.Servicios
{
    public class Repositorio
    {
        public void Guardar(Carrito modelo)
        {
            using(dbContext db = new dbContext())
            {
                db.carritos.Add(modelo);
                db.SaveChanges();
            }
        }

        public void Editar(Carrito modelo)
        {
            using (dbContext db = new dbContext())
            {
                var tabla = db.carritos.Find(modelo.id);
                tabla.nombre = modelo.nombre;
                tabla.marca = modelo.marca;
                tabla.precio = modelo.precio;
                tabla.cantidad = modelo.cantidad;
                tabla.estado = modelo.estado;
                tabla.descuento = modelo.descuento;

                db.Entry(tabla).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (dbContext db = new dbContext())
            {
                var registro = db.carritos.Find(id);
                db.carritos.Remove(registro);
                db.SaveChanges();
            }
        }

        public IEnumerable Listar()
        {
            using (dbContext db = new dbContext())
            {
                return db.carritos.ToList();
            }
        }
    }
}