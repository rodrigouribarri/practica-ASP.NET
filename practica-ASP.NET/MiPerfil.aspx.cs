using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace Pokedex_web
{
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Seguridad.sessionActiva(Session["trainee"]))
                    {
                        Trainee user = (Trainee)Session["trainee"];
                        txtApellido.Text = user.Apellido;
                        txtNombre.Text = user.Nombre;
                        txtEmail.Text = user.Email;
                        txtFechaNacimiento.Text = user.FechaNacimiento.ToString("yyyy-MM-dd");
                        if (!string.IsNullOrEmpty(user.ImagenPerfil))
                            imgPerfil.ImageUrl = "./Images/" + user.ImagenPerfil;
                            
                    }
                        //Response.Redirect("Login.aspx", false);
                }

            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;

                //Escribir img
                TraineeNegocio negocio = new TraineeNegocio();
                Trainee user = (Trainee)Session["trainee"];
                if (txtImagen.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("./Images/");
                    string nombreImagen = "perfil-" + user.Id + ".jpg";
                    txtImagen.PostedFile.SaveAs(ruta + nombreImagen);
                    user.ImagenPerfil = nombreImagen;
                }
                user.Apellido = txtApellido.Text;
                user.Nombre = txtNombre.Text;
                user.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
                negocio.actualizar(user);

                //Leer img
                Image img = (Image)Master.FindControl("imgAvatar");
                img.ImageUrl = "~/Images/" + user.ImagenPerfil;

            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }
        }
    }
}