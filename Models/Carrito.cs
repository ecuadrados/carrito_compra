using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarritoCompra.Models
{
    public class Carrito
    {
        public int  id { get; set; }
        public string nombre { get; set; }
        public string marca { get; set; }
        public float precio { get; set; }
        public int cantidad { get; set; }
        public string estado { get; set; }
        public int descuento { get; set; }

    }
}