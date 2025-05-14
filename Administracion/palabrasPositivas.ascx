<%@ Control Language="VB" AutoEventWireup="false" CodeFile="palabrasPositivas.ascx.vb" Inherits="Administracion_palabrasPositivas" %>
<asp:SqlDataSource ID="odsPalabrasPositivas" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="palabrasPositivasTraer" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<div>
    <asp:Label ID="Label1" runat="server" Text="Palabras positivas que se buscan en la transcripción"></asp:Label>

    <asp:Button ID="obutMostrar" runat="server" Text="Mostrar Palabras positivas" />
</div>
<div>
    <asp:TextBox ID="otxtPalabrasPositivas" runat="server" TextMode="MultiLine" Width="90%" Height="600px" Enabled="false" Visible="false"></asp:TextBox>

</div>
