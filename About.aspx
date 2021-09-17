<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CarritoCompra.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <form role="form">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Nombre</label>
                    <input type="text" class="form-control" id="txtNombre" required placeholder="Ingrese Nombre">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Marca</label>
                    <input type="text" class="form-control" id="txtMarca" required placeholder="Ingrese Marca">
                  </div>                  
                   <div class="form-group">
                    <label for="exampleInputEmail1">Precio</label>
                    <input type="number" class="form-control" id="txtPrecio" placeholder="Ingrese Precio">
                  </div> 
                     <div class="form-group">
                    <label for="exampleInputEmail1">Cantidad</label>
                    <input type="number" class="form-control" id="txtCantidad" placeholder="Ingrese Cantidad">
                  </div> 
                     <div class="form-group">
                    <label for="exampleInputEmail1">Estado</label>
                    <input type="text" class="form-control" id="txtEstado" placeholder="Ingrese Estado">
                  </div> 
                     <div class="form-group">
                    <label for="exampleInputEmail1">Descuento</label>
                    <input type="number" class="form-control" id="txtDescuento" placeholder="Ingrese Descuento">
                  </div> 
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="button" class="btn btn-primary" onclick="guardarCompra()">Guarar Compra</button>
                </div>
              </form>

     <script type="text/javascript">  
         function guardarCompra() {

             var url = 'api/Carrito/Post';
             let nombre = document.getElementById('txtNombre').value;
             let marca = document.getElementById('txtMarca').value;
             let precio = document.getElementById('txtPrecio').value;
             let cantidad = document.getElementById('txtCantidad').value;
             let estado = document.getElementById('txtEstado').value;
             let descuento = document.getElementById('txtDescuento').value;
             var data = { marca: nombre, nombre: nombre, precio: precio, cantidad: cantidad, estado: estado, descuento: descuento };
             console.log(data);
             fetch(url, {
                 method: 'POST', // or 'PUT'
                 body: JSON.stringify(data), // data can be `string` or {object}!
                 headers: {
                     'Content-Type': 'application/json'
                 }
             }).then(res => res.json())
                 .catch(error => console.error('Error:', error))
                 .then(response => console.log('Success:', response));

                /*console.log("hola");
                $.getJSON("api/Carrito/Post",
                    function (data) {                       
                        alert(data +": Guardado correctamente");
                    }).then();
                */
            }           


     </script>  
</asp:Content>
