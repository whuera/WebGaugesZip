<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebAppPrjGauge.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.css" rel="stylesheet" />

    <!-- Animation CSS -->

    <link href="../Content/animate.css" rel="stylesheet" />
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Content/style.css" rel="stylesheet" />
    <link href="../Content/animate.css" rel="stylesheet" />
    <link href="../Content/ladda-themeless.min.css" rel="stylesheet" />
    <link href="../Content/mod-bootstrap.css" rel="stylesheet" />
</head>
<body class="registerbody">

    <script type="text/javascript">

        function runEffect() {
            setTimeout(function () {
                var selectedEffect = 'blind';
                var options = {};
                $("#msgbox").hide();
            }, 5000);
        }

    </script>

    <div class="loginColumns animated fadeInDown mainwindow">
        <div class="row contact">

            <div class="col-md-6 wow zoomIn animated" style="visibility: visible;">
                <h2 class="font-bold">Indicadores de Proyectos</h2>

                <p>
                    Registro de indicadores por proyecto.
                </p>

            
            <img src="img/google-background2.png" alt="dashboard" class="img-responsive">
      


            </div>
            <div class="col-md-6">
                <div class="ibox-content">
                    <form class="m-t" role="form" runat="server">
                        <div class="form-group">
                            <asp:TextBox ID="loginCredentials" runat="server" CssClass="form-control" placeholder="ingrese su login"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese su Login" Display="Dynamic" ControlToValidate="loginCredentials" ForeColor="#0099FF"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="passwdCredentials" runat="server" CssClass="form-control" placeholder="ingrese su password" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese su password" Display="Dynamic" ControlToValidate="passwdCredentials" ForeColor="#0099FF"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <asp:TextBox ID="tokenCredentials" runat="server" CssClass="form-control" placeholder="ingrese su token" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ingrese su token" Display="Dynamic" ControlToValidate="tokenCredentials" ForeColor="#0099FF"></asp:RequiredFieldValidator>
                        </div>

                        <asp:Button ID="Btn_SubmitCredentials" runat="server" Text="Acceder" CssClass="btn btn-primary block full-width m-b" OnClick="Btn_SubmitCredentials_OnClick" />

                        <div clientidmode="static" id="msgbox" class="alert alert-danger alert-dismissable" runat="server" visible="False">
                            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                            Error parametros incorrectos, intente de nuevo!!
                        </div>

                        <a href="#">
                            <small>Olvido su password?</small>
                        </a>

                        <p class="text-muted text-center">
                            <small>No tiene Cuenta?</small>
                        </p>
                        <a class="btn btn-sm btn-white btn-block" href="Register.aspx">Autenticación Windows</a>
                    </form>
                    <p class="m-t">
                        <small>BANRED la red Interbancaria mas grande del Ecuador &copy; 2020</small>
                    </p>
                </div>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-6">
                Copyright BANRED
            </div>
            <div class="col-md-6 text-right">
                <small>© 2014-2020</small>
            </div>
        </div>
    </div>

</body>
</html>
