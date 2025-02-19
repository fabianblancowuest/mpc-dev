<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testeador.aspx.vb" Inherits="Administracion_testeador" %>

<%@ Register Src="~/Administracion/correoElectronicoValidador.ascx" TagPrefix="uc1" TagName="correoElectronicoValidador" %>
<%@ Register Src="~/Administracion/whatsappValidador.ascx" TagPrefix="uc1" TagName="whatsappValidador" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="olblCorreoValidado" runat="server" Text=""></asp:Label>
            <uc1:correoElectronicoValidador runat="server" ID="correoElectronicoValidador" />
            <br />
            <asp:Label ID="olblTelefonoValidado" runat="server" Text=""></asp:Label>
            <uc1:whatsappValidador runat="server" ID="whatsappValidador" />
        </div>
    </form>
</body>
</html>
