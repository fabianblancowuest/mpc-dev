<%@ Control Language="VB" AutoEventWireup="false" CodeFile="induccionAlCierre.ascx.vb" Inherits="Administracion_induccionAlCierre" %>
<asp:SqlDataSource ID="odsInduccionAlCierre" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="induccionAlCierreTraer" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<div>
    <asp:Label ID="Label1" runat="server" Text="Frases de induccion al cierre que  se buscan en la transcripción"></asp:Label>

    <asp:Button ID="obutMostrar" runat="server" Text="Mostrar frases de induccion al cierre." />
</div>
<div>
    <asp:GridView ID="ogvInduccionAlCierre" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsInduccionAlCierre" Visible="false">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="induccionAlCierre" HeaderText="Frases de induccion al cierre." SortExpression="induccionAlCierre" />
            <asp:CheckBoxField DataField="estado" HeaderText="estado" SortExpression="estado" Visible="False" />
        </Columns>
    </asp:GridView>
</div>