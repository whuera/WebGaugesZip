<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebAppPrjGauge.Home" ClientIDMode="Static" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
   $(document).ready(function () {       
      
            $.ajax({
                url: 'https://apps.na.collabserv.com/communities/service/html/communitystart?communityUuid=42987ce7-d23c-4abe-b8ae-640501b83a75',
                type: 'GET',
                success: function (res) {
                    var content = $(res.responseText).text();
                    alert(content);
                }
            });
     
   });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    
    
    <div class="ex1" id="content-upp"></div>
    
    <div class="embed-responsive embed-responsive-16by9">
  <iframe class="embed-responsive-item" src="https://apps.na.collabserv.com/communities/service/html/communitystart?communityUuid=42987ce7-d23c-4abe-b8ae-640501b83a75" allowfullscreen></iframe>
</div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="js/jquery.xdomainajax.js"></script>
    <script src="js/home.js"></script>
</asp:Content>
