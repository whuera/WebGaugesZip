<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BuscarProyectos.aspx.cs" Inherits="WebAppPrjGauge.BuscarProyectos" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>

        function dropchange(ddl) {
            var id = ddl.id;
            var selectedVal = ddl.value;           
            var span = document.getElementById("proyect_selected");
            span.textContent = ddl.value;
            sendDataAjax(ddl.value);
        }

  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">

   <section class="content">
       <div class="row row-mod">
           <div class="col-xs-9 div-bordes" style="padding-right: 4px; padding-left: 4px; padding-top: 4px; padding-bottom: 4px; border-bottom: 0px; border-left: 0px;">
           <div class="col-xs-12">
               <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Proyectos para Evaluar:</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddl_SearchProjects" runat="server" CssClass="form-control" onchange="dropchange(this)">
                                <asp:ListItem Value="1">Proyecto Micropagos BWISE</asp:ListItem>
                                <asp:ListItem Value="2">Proyecto Migración</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <span id="proyect_selected" class="badge"></span>
                                <div class="loader" id="loader-4">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </div>
                        </div>                        

                    </div>
                </div>
           </div>

           <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Detalle del Proyecto</h3>
                    </div>
                    <div class="box-body table-responsive">
                        <table id="tbl_projects" class="table table-bordered table-hover text-center">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nombre</th>
                                    <th>Tipo</th>                                    
                                    <th>Estatus</th> 
                                    <th>Observacion</th> 
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody id="tbl_body_table">
                                <!-- DATA POR MEDIO DE AJAX-->
                            </tbody>
                        </table>
                    </div>
                </div>

           </div>
          
           </div>
           <div class="col-xs-3 div-bordes">
               lateral
           </div>
       </div>
       <div class="row row-mod">


           <div class="col-xs-12 div-bordes" style="padding-right: 4px; padding-left: 4px; padding-top: 4px; padding-bottom: 4px; border-left:0px;">
                       

               <div id="rol1" class="col-xs-9 hidden">
                   <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Registro de parámetros</label>
                        </div>
                        <div class="form-group">                        
                            <form>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Fecha Planificada</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="date" value="" id="planneddate">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Fecha Real de Entrega: </label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="date" value="" id="deliverydate">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Observación: </label>
                                    <div class="col-lg-9">
                                        <textarea class="form-control" id="observation1" rows="3"></textarea>
                                    </div>
                                </div>

                                <div class="form-group row">
                                   <label class="col-lg-3 col-form-label form-control-label" for="rating">
	                                <span class="field-label-header">Calificación del proyecto:</span><br>
	                                <span class="field-label-info"></span>
	                                <input type="hidden" id="selected_rating" name="selected_rating" value="" required="required">
	                                </label>
	                                <h2 class="bold rating-header" style="">
	                                <span class="selected-rating">0</span><small> / 5</small>
	                                </h2>
                                    <div class="col-lg-9">
	                                    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="1" id="rating-star-1">
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                    </button>
	                                    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="2" id="rating-star-2">
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                    </button>
	                                    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="3" id="rating-star-3">
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                    </button>
	                                    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="4" id="rating-star-4">
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                    </button>
	                                    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="5" id="rating-star-5">
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                    </button>
                                    </div>
                                </div>

                                 <div class="form-group">                                    
                                    <asp:Button ID="Btn_saveForm" runat="server" Text="Guardar" CssClass="btn btn-primary" />                                                                        
                                </div>

                              </form>      

                        </div>                        

                    </div>
                </div>
               </div>
               <div id="rol2" class="col-xs-9 hidden">
                    <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Registro de parámetros</label>
                        </div>
                           <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Cantidad de versionamientos: </label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="number" value="0" id="numver">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Observación: </label>
                                    <div class="col-lg-9">
                                        <textarea class="form-control" id="observation2" rows="3"></textarea>
                                    </div>
                                </div>                         

                    </div>
                </div>
               </div>
               <div id="rol3" class="col-xs-9 hidden">
                    <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Registro de parámetros</label>
                        </div>
                            <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label font-weight-lighter">Novedades en Producción: </label>
                                    <div class="col-lg-9">
                                       <input class="form-control" type="number" value="0" id="numprod">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label font-weight-lighter">Observación: </label>
                                    <div class="col-lg-9">
                                        <textarea class="form-control" id="observation3" rows="3"></textarea>
                                    </div>
                                </div>                      

                    </div>
                </div>
               </div>
           </div>
       </div>

    </section>  

    
    <div class="modal fade" id="imodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background: #eee;">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Evaluar Proyecto</h4>
                </div>
                 <div class="modal-body transbox" style="background-color:#f3f3f3;">
                Ingrese los valores de acuerdo a su perfil de área  
                     </div>
                <div class="modal-body transbox" style="background-color:#f3f3f3;">

                    
                    <div class="card card-outline-secondary">
                       
                        <div class="card-body bg-modal">
                            <input class="form-control" type="hidden" value="1" id="id_project">
                            <form class="form" role="form" autocomplete="off">
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Fecha Planificada</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="date" value="" id="planneddate">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Fecha Real de Entrega: </label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="date" value="" id="deliverydate">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Observación: </label>
                                    <div class="col-lg-9">
                                        <textarea class="form-control" id="observation1" rows="3"></textarea>
                                    </div>
                                </div>
                               
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Cantidad de versionamientos: </label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="number" value="0" id="numver">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Observación: </label>
                                    <div class="col-lg-9">
                                        <textarea class="form-control" id="observation2" rows="3"></textarea>
                                    </div>
                                </div>

                                

                            </form>
                        </div>
                    </div>
                    
                        
                </div>
                <div class="modal-footer" style="background: #eee;">
                    <button type="button" class="btn btn-primary" id="btnactualizar">Guardar Cambios</button>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
        <script src="js/projects.js" type="text/javascript">
    
    </script>
</asp:Content>
