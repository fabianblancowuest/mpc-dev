<%@ Page Title="Datos de clientes recolectados en Sorteo dia de la madre" Language="VB" MaintainScrollPositionOnPostback="false"  MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="sorteoDatosClienteVendedor.aspx.vb" Inherits="Administracion_sorteoDatosClienteVendedor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <h3>
        Datos de clientes recolectados en Sorteo dia de la madre Octubre 2024
    </h3>

</div>

    <div>
    <asp:SqlDataSource ID="odssorteoDatosClienteVendedor01" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoDatosClienteVendedor01" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:GridView ID="ogvsorteoDatosClienteVendedor01" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odssorteoDatosClienteVendedor01">
        <Columns>
            <asp:BoundField DataField="apellidoYNombres" HeaderText="Detalle" ReadOnly="True" SortExpression="apellidoYNombres" />
            <asp:BoundField DataField="Total Billetes" HeaderText="Total  " ReadOnly="True" SortExpression="Total Billetes" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Premio 5 Millones" HeaderText="Premio 5 Millones" ReadOnly="True" SortExpression="Premio 5 Millones" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Premio Terreno" HeaderText="Premio Terreno" ReadOnly="True" SortExpression="Premio Terreno">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Premio Terreno y 0 km" HeaderText="Premio Terreno y 0 km" ReadOnly="True" SortExpression="Premio Terreno y 0 km">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
</div>

       <div>
    <asp:SqlDataSource ID="odssorteoDatosClienteVendedor02" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoDatosClienteVendedor02" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:GridView ID="ogvsorteoDatosClienteVendedor02" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odssorteoDatosClienteVendedor02">
        <Columns>
            <asp:BoundField DataField="apellidoYNombres" HeaderText="Promedio" ReadOnly="True" SortExpression="apellidoYNombres" />
            <asp:BoundField DataField="Billetes" HeaderText="Promedios" ReadOnly="True" SortExpression="Billetes" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Premio 5 Millones" HeaderText="Premio 5 Millones" ReadOnly="True" SortExpression="Premio 5 Millones" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Premio Terreno" HeaderText="Premio Terreno" ReadOnly="True" SortExpression="Premio Terreno">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Premio Terreno y 0 km" HeaderText="Premio Terreno y 0 km" ReadOnly="True" SortExpression="Premio Terreno y 0 km">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
</div>


<div>
    <asp:SqlDataSource ID="odssorteoDatosClienteVendedor" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoDatosClienteVendedor" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:GridView ID="ogvsorteoDatosClienteVendedor" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odssorteoDatosClienteVendedor" AllowSorting="True" Font-Size="Small">
        <Columns>
            <asp:BoundField DataField="apellidoYNombres" HeaderText="Apellido y Nombres" ReadOnly="True" SortExpression="apellidoYNombres" />
            <asp:BoundField DataField="celularNumero" HeaderText="Numero Celular" ReadOnly="True" SortExpression="celularNumero" />
            <asp:BoundField DataField="correoElectronico" HeaderText="Correo Electronico" ReadOnly="True" SortExpression="correoElectronico" />
            <asp:BoundField DataField="billetes" HeaderText="Billetes" ReadOnly="True" SortExpression="billetes">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Premio 5 Millones" HeaderText="Premio 5 Millones" ReadOnly="True" SortExpression="Premio 5 Millones">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Premio Terreno" HeaderText="Premio Terreno" ReadOnly="True" SortExpression="Premio Terreno">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Premio Terreno y 0 km" HeaderText="Premio Terreno y 0 km" ReadOnly="True" SortExpression="Premio Terreno y 0 km">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="vendedor" HeaderText="Vendedor" ReadOnly="True" SortExpression="vendedor" >
            <ItemStyle Font-Size="XX-Small" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
</div>
</asp:Content>

