<%@ Page Language="VB" AutoEventWireup="false" CodeFile="mpc.aspx.vb" Inherits="mpc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mi Primer Casa</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>
            <asp:Label ID="Label1" runat="server" Text="MI PRIMER CASA S.A." ForeColor ="DarkRed" Font-Bold ="true"></asp:Label>
        </h1>
    </div>
        <div>
            <asp:Label ID="Label2" runat="server" Text="BIENVENIDO SOSA MARTINIANO" Font-Bold ="true"></asp:Label>

        </div>
     <div>
        <asp:Button ID="Button1" runat="server" Text="Visite nuestro sitio WEB." />
         </div>
</form>
</body>
</html>
