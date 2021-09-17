using CarritoCompra.Models;
using CarritoCompra.Servicios;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarritoCompra
{
    public partial class Formulario : System.Web.UI.Page
    {
        Repositorio repos = new Repositorio();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "";
        }

        protected void BtnUpload_Click(object sender, EventArgs e)
        {
          

            if (FileUpload1.HasFile)
            {
                Label1.Text = "";
                SaveFile(FileUpload1.PostedFile);
            }
            else
                Label1.Text = "Debes escoger un archivo";
            // tambien
            //modelo.descuento = 1;
            
        }
        void SaveFile(HttpPostedFile file)
        {
            var nombre_archivo = Path.GetFileName(file.FileName);
            string extension = Path.GetExtension(file.FileName);
            string path = HttpContext.Current.Server.MapPath("~/App_Data/File/");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            var filePath = path + nombre_archivo;
            file.SaveAs(filePath);

            string csvFile = System.IO.File.ReadAllText(filePath);
           
            foreach(string row in csvFile.Split('\n').Skip(1))
            {
                if (!string.IsNullOrEmpty(row))

                {
                    string[] valor = row.Split(',');
                    if (valor.Length == 6)
                    {
                        Carrito modelo = new Carrito()
                        {
                            nombre = valor[0],
                            marca = valor[1],
                            precio = valor[2] == "" ? 0 : Convert.ToInt32(valor[2]),
                            cantidad = valor[3] == "" ? 0 : Convert.ToInt32(valor[3]),
                            estado = valor[4],
                            descuento = valor[5] == "" || valor[5] == "\r" ? 0 : Convert.ToInt32(valor[5])
                        };
                        repos.Guardar(modelo);
                    }
                }
            }
            Label1.Text = "Guardado Correctamente";
        }
    }
}