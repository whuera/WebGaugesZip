using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;
using ServicesLibrary;

namespace WebAppPrjGauge
{
    public partial class UserPerfil : System.Web.UI.Page
    {
        IActiveUser activeUser = new UserActiveServiceImpl();
        UserApp user = new UserApp();
        UserApp userFromBdd = new UserApp();
        protected void Page_Load(object sender, EventArgs e)
        {
         
             if (HttpContext.Current.Session["userActive"] != null)
             {                    
                user = (UserApp)HttpContext.Current.Session["userActive"];
             }
            if (!Page.IsPostBack)
            {
                Btn_editUser.Enabled = false;
                //Btn_saveUser.Enabled = false;
                userFromBdd = activeUser.getActiveUserById(user.usuario);
                if(userFromBdd.dataform == 1)
                {
                    inputNames.Text = userFromBdd.nombres;
                    inputLastNames.Text = userFromBdd.apellidos;
                    emaiFormControlInput1.Text = userFromBdd.email;
                    blockControls();
                    Btn_saveUser.Enabled = false;
                    Btn_editUser.Enabled = true;
                }
            }
        }

        public void blockControls()
        {
            inputNames.Enabled = false;
            inputLastNames.Enabled = false;
            emaiFormControlInput1.Enabled = false;
            areaFormControlSelect1.Enabled = false;
            rolFormControlSelect1.Enabled = false;

        }

        public void unBlockControls()
        {
            inputNames.Enabled = true;
            inputLastNames.Enabled = true;
            emaiFormControlInput1.Enabled = true;
            areaFormControlSelect1.Enabled = true;
            rolFormControlSelect1.Enabled = true;

        }

        protected void Btn_saveUser_Click(object sender, EventArgs e)
        {
            user.nombres = inputNames.Text;
            user.apellidos = inputLastNames.Text;
            user.email = emaiFormControlInput1.Text;
            user.rol = Convert.ToInt32(rolFormControlSelect1.SelectedValue);
            user.area = 1;
            user.estatus = 1;
            
            if (activeUser.createActiveUser(user))
            {
                string flag = "ok";
                messageForm.Visible = true;
                Btn_saveUser.Enabled = false;
                Btn_editUser.Enabled = true;
                messageFormText.Text = " Registro guardado con exito";
                blockControls();
            }
            else
            {
                messageFormText.Text = " Error intente de nuevo!";
                //Response.Redirect("~/UserPerfil.aspx", false);
            }
        }

        protected void Btn_editUser_Click(object sender, EventArgs e)
        {
            //
            unBlockControls();
            Btn_editUser.Enabled = false;
            Btn_saveUser.Enabled = true;
        }
    }
}