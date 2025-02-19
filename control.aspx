<%@ Page Language="VB" AutoEventWireup="false" CodeFile="control.aspx.vb" Inherits="control" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SELECT * FROM [accesoAreaRol]"></asp:SqlDataSource>  
    </div>
    </form>
</body>
</html>
