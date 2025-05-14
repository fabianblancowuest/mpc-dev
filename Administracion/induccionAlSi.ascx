<%@ Control Language="VB" AutoEventWireup="false" CodeFile="induccionAlSi.ascx.vb" Inherits="Administracion_induccionAlSi" %>
<asp:SqlDataSource ID="odsInduccionAlSi" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="induccionAlSiTraer" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<div>
    <asp:Label ID="Label1" runat="server" Text="Frases de induccion al si que  se buscan en la transcripción"></asp:Label>

    <asp:Button ID="obutMostrar" runat="server" Text="Mostrar frases de induccion al si." />
</div>
<div>
    <asp:GridView ID="ogvInduccionAlSi" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsInduccionAlSi" Visible="false">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="induccionAlSi" HeaderText="Frases de induccion al si." SortExpression="induccionAlSi" />
            <asp:CheckBoxField DataField="estado" HeaderText="estado" SortExpression="estado" Visible="False" />
        </Columns>
    </asp:GridView>
</div>