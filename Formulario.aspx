<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="CarritoCompra.Formulario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
   <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <div class="navbar-header">
                    
                    <a class="navbar-brand" runat="server" href="~/">Carrito de Compra</a>
                </div>
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="#"></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/">Inicio</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/About">Crear Nueva Compra</a>
    </li>   
  </ul>
</nav>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.1/css/jquery.dataTables.css"/>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.js"></script>
  
        <script type="text/javascript">  
            function getStudents() {               
                console.log("gola");
                $.getJSON("api/Carrito/Get",
                    function (data) {
                       
                        console.log(data);
                        $('#carrito').empty(); // Clear table body.  
  
                        // Loop through the list of students.  
                        $.each(data, function(key, val) {  
                            // Add a table row for the student.  
                            var row = '<tr><td>' + val.nombre +
                                '</td><td>' + val.marca + '</td><td>' +
                                val.precio + '</td><td>' + val.cantidad +
                                '</td><td>' + val.estado +
                                '</td><td>' + val.descuento +
                                '</td>' +                                
                                `<td><a onclick="
                                editarCompra('${val.id}','${val.nombre}','${val.marca}','${val.precio}',
'                               ${val.cantidad}','${val.estado}','${val.descuento}')">Editar</a></td>` +
                                `<td><a onclick="eliminarCompra('${val.id}')">Eliminar</a></td>` +
                                '</tr>';
                            $("#carrito").append(row);
  
                        });  
                    }).then($('#tblListar').DataTable());
                
            }

            function editarCompra(id, nombre, marca, precio, cantidad, estado, descuento) {
                document.getElementById('HiddenField1').value = id;
                document.getElementById('TextBox1').value = nombre;
                document.getElementById('TextBox2').value = marca;
                document.getElementById('TextBox3').value = precio;
                document.getElementById('TextBox4').value = cantidad;
                document.getElementById('TextBox5').value = estado;
                document.getElementById('TextBox6').value = descuento;
            }

            function eliminarCompra(id) {
                var r = confirm("¿Desea eliminar el registro?");
                if (r == true) {
                    var url = 'api/Carrito/Delete?id=' + id;                  
                    fetch(url, {
                        method: 'Delete',                
                    }).then(res => res.json())
                        .catch(error => console.error('Error:', error))
                        .then(response => getStudents());                    
                } 
            }
            function Editar() {
                var url = 'api/Carrito/Put';
                id = document.getElementById('HiddenField1').value;
                nombre = document.getElementById('TextBox1').value;
                marca = document.getElementById('TextBox2').value;
                precio = document.getElementById('TextBox3').value;
                cantidad = document.getElementById('TextBox4').value;
                descuento = document.getElementById('TextBox5').value;
                estado = document.getElementById('TextBox6').value;
                var data = {id: id, marca: marca, nombre: nombre, precio: precio, cantidad: cantidad, estado: estado, descuento: descuento };
                console.log(data);
                fetch(url, {
                    method: 'Put', // or 'PUT'
                    body: JSON.stringify(data), // data can be `string` or {object}!
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }).then(res => res.json())
                    .catch(error => console.error('Error:', error))
                    .then(response => limpiar());
            }

            function limpiar() {
                alert("Editado Correctamente");
                document.getElementById('HiddenField1').value = "";
                document.getElementById('TextBox1').value = "";
                document.getElementById('TextBox2').value = "";
                document.getElementById('TextBox3').value = "";
                document.getElementById('TextBox4').value = "";
                document.getElementById('TextBox5').value = "";
                document.getElementById('TextBox6').value = "";
                getStudents();
            }
            $(document).ready(getStudents);


        </script>  
</head>
<body>
    <div class="container" style="margin-top: 3rem;">
  <!-- Content here -->

    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />
            <asp:Button ID="BtnUpload" runat="server" OnClick="BtnUpload_Click" Text="Cargar Archivo CSV" />
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>       
     <asp:Panel ID="Panel1" runat="server">
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label>
            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Marca"></asp:Label>
            <asp:TextBox ID="TextBox2" CssClass="form-control"  runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Precio"></asp:Label>
            <asp:TextBox ID="TextBox3" CssClass="form-control"  runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Cantidad"></asp:Label>
            <asp:TextBox ID="TextBox4" CssClass="form-control"  runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Estado"></asp:Label>
            <asp:TextBox ID="TextBox5" CssClass="form-control"  runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label7" runat="server" Text="Descuento"></asp:Label>
            <asp:TextBox ID="TextBox6" CssClass="form-control"  runat="server"></asp:TextBox>
            </br>
            <asp:HyperLink ID="HyperLink1" runat="server" OnClick="Editar()" >Editar</asp:HyperLink>           
            <br />
        </asp:Panel>

    </form>
        <h2> Listado de Compras</h2>  
            <table id="tblListar" class="display">  
                <thead>  
                    <tr>  
                        <th>Nombre</th>  
                        <th>Marca</th>  
                        <th>Precio</th>  
                        <th>Cantidad</th>
                        <th>Estado</th>  
                        <th>Descuento</th>
                        <th>Acciones</th>
                    </tr>  
                </thead>  
                <tbody id="carrito">  
                </tbody>  
            </table>  
        
        </div>
</body>
</html>
