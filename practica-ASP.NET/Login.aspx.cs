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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                lblIncorrecto.Visible = false;
        }

        protected void txtIngresar_Click(object sender, EventArgs e)
        {
            //Usuario usuario;
            //UsuarioNegocio negocio = new UsuarioNegocio();
            //usuario = new Usuario(txtEmail.Text, txtPass.Text, false);
            //if (negocio.Loguearse(usuario))
            //{
            //    Session.Add("usuario", usuario);
            //    Response.Redirect("PokemonsLista.aspx", false);
            //}
            //else
            //{

            //    Session.Add("error", "User o password incorrecto");
            //    lblIncorrecto.Visible = true;
            //    //Response.Redirect("Login.aspx",false);
            //}
            Trainee trainee = new Trainee();
            TraineeNegocio traineeNegocio = new TraineeNegocio();
            try
            {
                if(Validacion.validarTextoVacio(txtEmail) || Validacion.validarTextoVacio(txtPass))
                {
                    Session.Add("error", "Debe completar los campos");
                    Response.Redirect("Error.aspx", false);
                }

                trainee.Email = txtEmail.Text;
                trainee.Pass = txtPass.Text;
                if (traineeNegocio.Login(trainee))
                {
                    Session.Add("trainee", trainee);
                    Response.Redirect("MiPerfil.aspx", false);
                }
                //else
                //{
                //    Session.Add("error", "User o password incorrectos");
                //    lblIncorrecto.Visible = true;
                //}
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

       
    }
}