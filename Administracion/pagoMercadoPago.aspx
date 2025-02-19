<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pagoMercadoPago.aspx.vb" Inherits="Administracion_pagoMercadoPago" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="olblTotalAPagar" runat="server" Text="10"></asp:Label>
    </div>

        <div>
            <asp:Label ID="Label1" runat="server" Text="Pagar con Mercado Pago"></asp:Label>

        </div>
        <asp:Button ID="Button1" runat="server" Text="Pagar " />
        <script src="https://link.mercadopago.com.ar/pagobilletesorteo" data-source="button"></script>

        https://link.mercadopago.com.ar/pagobilletesorteo
    </form>
</body>
</html>
