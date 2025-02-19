<%@ Control Language="VB" AutoEventWireup="false" CodeFile="correoElectronicoValidador.ascx.vb" Inherits="Administracion_correoElectronicoValidador" %>
<div>
    <asp:Label ID="olblClienteCorreoElectronico" runat="server" Text="Correo electrónico:" Font-Bold ="true"></asp:Label>
    <asp:Label ID="olblclienteCorreoElectronicoVerificado" runat="server" Text=""></asp:Label>
     <asp:Label ID="olblCorreoElectronicoValidado" runat="server" Text="0" Visible ="false"></asp:Label>
    <br />
    <asp:TextBox ID="otxtClienteCorreoElectronico" runat="server" Width="50%"></asp:TextBox>
    <asp:Button ID="obutCorreoVerifica" runat="server" Text="Verifica Correo" />
    <br />
    <asp:Panel ID="PanelValidaCorreo" runat="server" Visible="false">
        <asp:TextBox ID="otxtClienteCorreoElectronicoMensaje" runat="server" Width="90%" Text="Su casilla de correo electronica no se encuentra verificada. Se ha enviado un correo con el PIN de Validacion. Ingrese el pin recibido y presione el botón  VALIDAR PIN RECIBIDO para validar su casilla de correos." Height="80px" TextMode="MultiLine"></asp:TextBox>
        <asp:TextBox ID="otxtClienteCorreoElectronicoPin" MaxLength ="6" runat="server" Width="40%"></asp:TextBox>
        <asp:Button ID="obutClienteCorreoValidar" runat="server" Text="Validar PIN recibido" />
        <asp:Button ID="obutClienteCorreoValidarReenvioPin" runat="server" Text="Reenviar PIN" />
        <br />
        <asp:Label ID="olblMensajeValidacion" runat="server" Text=""></asp:Label>

    </asp:Panel>
</div>
