<%@ Control Language="VB" AutoEventWireup="false" CodeFile="barrioLoteComprador.ascx.vb" Inherits="sitioWEB_barrioLoteComprador" %>

<%@ Register Src="~/sitioWEB/personaFisica.ascx" TagPrefix="uc1" TagName="personaFisica" %>
<asp:Label ID="olblPersonaFisica01" runat="server" Text="1" Visible ="false" ></asp:Label>
<asp:Label ID="olblPersonaFisica02" runat="server" Text="0"  Visible ="false" ></asp:Label>
<asp:Label ID="olblPersonaFisica03" runat="server" Text="0" Visible ="false" ></asp:Label>
<asp:Label ID="olblPersonaFisica04" runat="server" Text="0"  Visible ="false" ></asp:Label>
<asp:Label ID="olblPersonaFisica05" runat="server" Text="0" Visible ="false" ></asp:Label>
<asp:Label ID="olblPersonaFisica06" runat="server" Text="0" Visible ="false" ></asp:Label>

<asp:Button ID="obutPersona" runat="server" Text="Comprador/es del lote:" />
<asp:Label ID="olblCompradoresCantidad" runat="server" Text="0" Visible ="true" ></asp:Label>


<asp:Button ID="obutPersonaMas" runat="server" Text="Agregar comprador" />
<asp:Button ID="obutPersonaLimpiar" runat="server" Text="Limpiar" />
<asp:Label ID="olblMensaje" runat="server" Text=""></asp:Label>
<div>
    <uc1:personaFisica runat="server" ID="personaFisica01"  Visible ="true" />
</div>
<div>

    <uc1:personaFisica runat="server" ID="personaFisica02" Visible ="false" />
</div>
<div>

    <uc1:personaFisica runat="server" ID="personaFisica03" Visible ="false" />
</div>
<div>
    <uc1:personaFisica runat="server" ID="personaFisica04" Visible ="false"/>
</div>
<div>
    <uc1:personaFisica runat="server" ID="personaFisica05" Visible ="false"/>
</div>
<div>
    <uc1:personaFisica runat="server" ID="personaFisica06" Visible ="false"/>
</div>
