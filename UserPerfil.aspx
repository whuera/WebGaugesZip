<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserPerfil.aspx.cs" Inherits="WebAppPrjGauge.UserPerfil" ClientIDMode="Static" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    <script>
        setTimeout(function () {
            $('#messageForm').fadeOut('fast');
        }, 4000); // <-- time in milliseconds

    </script>
    <section class="content">
        
        <div class="col-md-10" style="padding: 1px 0px 0px 0px;">
        <div class="row" style="margin-left: 0px;">
        
            <div class="col-md-12" style="padding: 0px 15px 0px 0px;">
                 
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                        
                            <form>
                                <div class="form-group">
                                    <label for="inputNames">Nombres</label>                                    
                                    <asp:TextBox ID="inputNames" runat="server" CssClass="form-control" placeholder="ingrese sus Nombres"></asp:TextBox>
                                  </div>                                
                                  <div class="form-group">
                                    <label for="inputLastNames">Apellidos</label>                                    
                                     <asp:TextBox ID="inputLastNames" runat="server" CssClass="form-control" placeholder="ingrese sus Apellidos"></asp:TextBox>
                                  </div>                                
                                <div class="form-group">
                                  <label for="emaiFormControlInput1">Ingrese su Email</label>                                  
                                    <asp:TextBox ID="emaiFormControlInput1" runat="server" CssClass="form-control" TextMode="Email" placeholder="usuario@banred.fin.ec"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                  <label for="areaFormControlSelect1">Seleccione su área</label>                                
                                     <asp:DropDownList ID="areaFormControlSelect1" runat="server" CssClass="form-control">
                                <asp:ListItem Value="1">PRODUCCION</asp:ListItem>
                                <asp:ListItem Value="2">DESARROLLO</asp:ListItem>
                            </asp:DropDownList>

                                </div>

                                 <div class="form-group">
                                  <label for="rolFormControlSelect1">Seleccione su ROL</label>                                
                                     <asp:DropDownList ID="rolFormControlSelect1" runat="server" CssClass="form-control">
                                <asp:ListItem Value="1">ADMINISTRADOR DE PROYECTOS</asp:ListItem>
                                <asp:ListItem Value="2">COORDINADOR DE AREA</asp:ListItem>
                                <asp:ListItem Value="3">LIDER TECNICO</asp:ListItem>
                            </asp:DropDownList>

                                </div>

                               
                                <div class="form-group">                                    
                                    <asp:Button ID="Btn_saveUser" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="Btn_saveUser_Click" />
                                    <asp:Button ID="Btn_editUser" runat="server" Text="Editar" CssClass="btn btn-success" OnClick="Btn_editUser_Click"/>
                                    
                                </div>
                              </form>      

                        </div>                        

                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="margin-left: 0px;">
            <hr />
        </div>
        </div>
        <div class="col-md-2" style="padding: 1px 0px 0px 0px;">
            <div class="vl">
                <div class="div-notificaciones-header">
               
                    <div>
                    <img src="img/icon-settings.png" />Notificaciones de usuario
                        </div>

                     <div id="messageForm" runat="server" visible="false" class="form-group">
                                    <img src="img/loader-save.gif" /><asp:label id="messageFormText" runat="server" />                         
                                </div>

                </div>

            </div>
            
            </div>
    </section>   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>



