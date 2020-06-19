using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Services;
using ServicesLibrary;
using System.Security.Policy;

namespace WebAppPrjGauge
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (HttpContext.Current.Session["userActive"] != null)
                {
                    UserApp user = new UserApp();
                    UserApp userFromBdd = new UserApp();
                    user = (UserApp)HttpContext.Current.Session["userActive"];
                    IActiveUser activeUser = new UserActiveServiceImpl();
                    userFromBdd = activeUser.getActiveUserById(user.usuario);
                    if (userFromBdd != null && userFromBdd.usuario == user.usuario)
                    {
                        //string flag = "ok";
                        //string txtUser = userFromBdd.nombres + " "+ userFromBdd.apellidos;
                        //((SiteMaster)this.Master).strName = txtUser;                        
                        Response.Redirect("~/BuscarProyectos.aspx", false);
                    }
                    else
                    {
                        //string flag = "false";
                        Response.Redirect("~/UserPerfil.aspx", false);
                    }
                    
                }
            }
        }
    }
}