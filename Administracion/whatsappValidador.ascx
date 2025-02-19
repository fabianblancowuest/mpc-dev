<%@ Control Language="VB" AutoEventWireup="false" CodeFile="whatsappValidador.ascx.vb" Inherits="Administracion_whatsappValidador" %>
<div>
    <asp:Label ID="olblWhatsapp" runat="server" Text="Número de Teléfono: Verificacion por WhatsApp" Font-Bold ="true"></asp:Label>
    <asp:Label ID="olblWhatsAppVerificado" runat="server" Text=""></asp:Label>
     <asp:Label ID="olblWhatsAppValidado" runat="server" Text="0" Visible ="false"></asp:Label>
    <br />
    <asp:TextBox ID="otxtWhatsApp" runat="server" Width="50%"></asp:TextBox>
    <asp:Button ID="obutWhatsAppVerifica" runat="server" Text="Verifica por Whatsapp" />
    <br />
    <asp:Panel ID="PanelValidaWhatsApp" runat="server" Visible="false">
        <asp:TextBox ID="otxtWhatsAppMensaje" runat="server" Width="90%" Text="Su número de telefono vinculado a WhatsApp  no se encuentra verificado. Se ha enviado un WhatsApp con el PIN de validacion al número declarado desde el número de Whatsapp institucional de Mi Primer Casa . Ingrese el pin recibido y presione el botón  VALIDAR PIN RECIBIDO para validar su número de teléfono." Height="80px" TextMode="MultiLine"></asp:TextBox>
        <asp:TextBox ID="otxtWhatsAppPin" MaxLength ="6" runat="server" Width="40%"></asp:TextBox>
        <asp:Button ID="obutWhatsAppValidar" runat="server" Text="Validar PIN recibido" />
        <asp:Button ID="obutWhatsAppReenvioPin" runat="server" Text="Reenviar PIN" />
        <br />
        <asp:Label ID="olblMensajeValidacion" runat="server" Text=""></asp:Label>

    </asp:Panel>
</div>
