using System;
using System.Web;
using WebAppPrjGauge.login;
using BusinessRule;
using Models;

namespace WebAppPrjGauge
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loginCredentials.Focus();
            }
        }
        
        UserApp userApp = new UserApp();
        public UserApp createSession(String login)
        {            
            userApp.usuario = login;
            return userApp;
        }
        
       
        protected void Btn_SubmitCredentials_OnClick(object sender, EventArgs e)
        {
            AppImpl appImpl = new BusinessRule.AppImpl();
            appImpl.getAppCode();
            LoginCredentials loginCredentialsObject = new LoginCredentials();
            bool isValid =  loginCredentialsObject.IsValidateCredentials(loginCredentials.Text, passwdCredentials.Text, "BANRED");
            String login = loginCredentials.Text;
            createSession(login);

            if (isValid == true) {
                System.Security.Principal.WindowsIdentity identity = HttpContext.Current.Request.LogonUserIdentity;
                Response.Redirect("~/Home.aspx", false);
            }
            else
            {
                Session["userActive"] = userApp;
                Response.Redirect("~/Home.aspx", false);                
                //Response.Redirect("~/login.aspx", false);
            } 

        }
    }
}