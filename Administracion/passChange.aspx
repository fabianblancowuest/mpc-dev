<%@ Page Language="VB" MasterPageFile="~/master/masterE.master" AutoEventWireup="false" CodeFile="passChange.aspx.vb" Inherits="INCLUIR_passChange" title="Cambio de contraseña por Usuario." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <link href="./passChange.css" rel="stylesheet" type="text/css" />
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <asp:Panel ID="Panel2" runat="server" Visible="true" CssClass="passChange-container">
       <div class="panelrecuperacontraseña">
       <div class="logincontent">
         <div class="texto-rojo">
           <h2><asp:Label ID="Label1" runat="server" Text="Cambio de Contraseña."></asp:Label></h2>
         </div>
       
         <div>
           <asp:Label ID="Label2" runat="server" Text="Complete los datos de contraseña actual y nueva contraseña requerida."></asp:Label>
         </div>
       
         <div class="password-data">
           <asp:Label ID="Label3" runat="server" Text="Su correo electrónico:" CssClass="lbllogin"></asp:Label>
           <asp:TextBox ID="otxtCorreoElectronico" runat="server" CssClass="textbox" Enabled="false"></asp:TextBox>
         </div>  
         <div class="password-data">
             <asp:Label ID="Label4" runat="server" Text="Contraseña Actual:" CssClass="lblform"></asp:Label>
             <asp:TextBox ID="otxtPass00" runat="server" TextMode="Password"></asp:TextBox>
         </div>  
         <div class="password-data">
             <asp:Label ID="Label5" runat="server" Text="Nueva Contraseña:" CssClass="lblform"></asp:Label>
             <asp:TextBox ID="otxtPass01" runat="server" TextMode="Password"></asp:TextBox>
         </div>
              <div class="password-data">
             <asp:Label ID="Label6" runat="server" Text="Reingrese nueva Contraseña:" CssClass="lblform"></asp:Label>
                  <asp:TextBox ID="otxtPass02" runat="server" TextMode="Password"></asp:TextBox>
         </div>
         <div class="passChange-confirmar-btns">
           <asp:Button ID="obutCambiarPassword" runat="server" Text="Cambiar Contraseña" CssClass="butaceptar btn btn-primary" ToolTip="Envía un correo electrónico a la dirección declarada siempre y cuando ésta figure en la base de datos por haber sido previamente inicializada." />
           <asp:Button ID="obutVolverLogin" runat="server" Text="Volver a Menu" CssClass="butcancelar btn btn-primary" ToolTip="Regresa a la pantalla de acceso de usuarios del sistema de encuesta."/>
         </div>
         <div>
           <asp:Label ID="olblGestionPasswordDescripcion" runat="server" Text="" CssClass="lblmensajeoperador"></asp:Label>
         </div>
       </div>
       </div>
       
    </asp:Panel> 
        








</asp:Content>

