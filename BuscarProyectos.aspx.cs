using Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;
using System.Web.Script.Serialization;

using System.IO;
using System.Net;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using ServicesLibrary;

namespace WebAppPrjGauge
{
    public partial class BuscarProyectos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Page.ClientScript.RegisterClientScriptInclude("pacientejs", "js/paciente.js");
            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //
            //LabelSelectedProject.Text = "Proyecto seleccionado";
        }

        protected void ddl_SearchProjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            //                        
            //Label_Projects.Text = ddl_SearchProjects.SelectedValue.ToString(); 
        }
        
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            EvaluarProyectosImpl evaluarProyectosImpl = new EvaluarProyectosImpl();
            try {
                evaluarProyectosImpl.getProjectsById(1);
            }catch(Exception ex)
            {
                throw ex;
            }
            
        }
        [WebMethod]
        public static List<Proyecto> getProjectById(string id)
        {
            var userObj = JsonConvert.DeserializeObject(id);            
            Int32 idProject = Convert.ToInt32(userObj);
            List<Proyecto> listPrj = null;
            try
            {
                EvaluarProyectosImpl evaluarProyectosImpl = new EvaluarProyectosImpl();
                listPrj = evaluarProyectosImpl.getProjectsById(idProject);
            }catch(Exception ex)
            {
                throw ex;
            }
            return listPrj;
        }


        [WebMethod]
        public static bool createGaugesById (string id_project, string planneddate, string deliverydate, string observation1, string numver, string observation2, string numprod, string observation3)
        {
            var id_projectObj = JsonConvert.DeserializeObject(id_project);
            string idProject =  Convert.ToString(id_projectObj);
           // var planneddateObj = JsonConvert.DeserializeObject(planneddate);
            DateTime varplanneddate = Convert.ToDateTime(planneddate);
          //  var deliverydateObj = JsonConvert.DeserializeObject(deliverydate);
            DateTime vardeliverydate = Convert.ToDateTime(deliverydate);
            TimeSpan dateCal = vardeliverydate - varplanneddate;
            int deliverydays = dateCal.Days;
           

            bool resp = false;
            try
            {
                Gauges gauges = new Gauges();
                gauges.codigo_proyecto = idProject;
                gauges.nombre_indicador = "Fecha planificada";
                gauges.valor_indicador = deliverydays;
                gauges.valor_indicador = 1;
                ServicesLibrary.GaugesImpl gaugesIml = new ServicesLibrary.GaugesImpl();
                gaugesIml.createGaugesByIdProject(gauges);
            }
            catch(Exception ex)
            {
                throw ex;
            }
            return resp;
        }
    }
}