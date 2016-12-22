using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using bibliotecaClases;

namespace appIntranetCIA.web.login
{
    public partial class Login : System.Web.UI.Page
    {
        #region "Declaraciones"

        claseUsuario claseUsuario = new claseUsuario();
        public DataTable oDS_DatosM;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
        }

        protected void login_Authenticate(object sender, AuthenticateEventArgs e)
        {


            bool Autenticado = false;
            Autenticado = LoginCorrecto(login1.UserName, login1.Password);
            e.Authenticated = Autenticado; if (Autenticado)
            {
                FormsAuthentication.RedirectFromLoginPage(login1.UserName, false);
            }
           
        }


        public bool LoginCorrecto(String usuario, String contrasena)
        {
            oDS_DatosM = claseUsuario.FPub_AuthenticarLogin(usuario, contrasena);

            if (oDS_DatosM.Rows.Count == 1)
            {

                return true;
            }
            else
            {
                return false;
            }


        }
    }
}