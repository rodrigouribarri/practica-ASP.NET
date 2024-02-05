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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {

            try
            {
                Trainee user = new Trainee();
                TraineeNegocio negocio = new TraineeNegocio();
                EmailService emailService = new EmailService();
                user.Email = txtEmail.Text;
                user.Pass = txtPass.Text;
                user.Id = negocio.insertarNuevo(user);
                Session.Add("trainee", user);

                //emailService.armarCorreo(user.Email, "Bienvenido a nuestra app", "Hola te famos la bienvenida a la aplicación");
                //emailService.enviarEmail();
                Response.Redirect("Default.aspx", false);
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}