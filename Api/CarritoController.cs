using CarritoCompra.Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CarritoCompra.Api
{
    public class CarritoController : ApiController
    {
        Repositorio repos = new Repositorio();

        // GET api/<controller>
        [HttpGet]
        public dynamic Get()
        {
            var model = repos.Listar();
            return model;
        }

        // GET api/<controller>/5
        [HttpGet]

        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        [HttpPost]

        public string Post([FromBody] Models.Carrito carrito)
        {
            repos.Guardar(carrito);
             return "ok";
        }

        // PUT api/<controller>/5
        [HttpPut]
        public void Put([FromBody] Models.Carrito carrito)
        {
            repos.Editar(carrito);            
        }

        // DELETE api/<controller>/5
        [HttpDelete]
        public void Delete(int id)
        {
            repos.Eliminar(id);
        }
    }
}