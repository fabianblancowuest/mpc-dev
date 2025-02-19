<%@ Page Title="Reporte por vendedor y perìodo de Sorteo billetes" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="boletocompraventa.aspx.vb" Inherits="Administracion_boletoCompraVenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <asp:SqlDataSource ID="odsBufalos" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SELECT * FROM [contratoBufalo] ORDER BY [manzanaAsignada], [parcelaAsignada]"></asp:SqlDataSource>
        <asp:GridView ID="gv" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="odsBufalos" DataKeyNames="id,manzana,parcela,apellido,dni,domicilio,superficie,precioTotalPesos,precioTotalPesosLetras,precioTotalBC,precioTotalBCLetras,cuotasCantidad,cuotaMontoPesos,cuotaBC,fecha,manzanaAsignada,parcelaAsignada,ddContrato,mmContrato,aaaaContrato">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="manzana" HeaderText="manzana" SortExpression="manzana" />
                <asp:BoundField DataField="parcela" HeaderText="parcela" SortExpression="parcela" />
                <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" />
                <asp:BoundField DataField="dni" HeaderText="dni" SortExpression="dni" />
                <asp:BoundField DataField="domicilio" HeaderText="domicilio" SortExpression="domicilio" />
                <asp:BoundField DataField="superficie" HeaderText="superficie" SortExpression="superficie" />
                <asp:BoundField DataField="precioTotalPesos" HeaderText="precioTotalPesos" SortExpression="precioTotalPesos" />
                <asp:BoundField DataField="precioTotalPesosLetras" HeaderText="precioTotalPesosLetras" SortExpression="precioTotalPesosLetras" />
                <asp:BoundField DataField="precioTotalBC" HeaderText="precioTotalBC" SortExpression="precioTotalBC" />
                <asp:BoundField DataField="precioTotalBCLetras" HeaderText="precioTotalBCLetras" SortExpression="precioTotalBCLetras" />
                <asp:BoundField DataField="cuotasCantidad" HeaderText="cuotasCantidad" SortExpression="cuotasCantidad" />
                <asp:BoundField DataField="cuotaMontoPesos" HeaderText="cuotaMontoPesos" SortExpression="cuotaMontoPesos" />
                <asp:BoundField DataField="cuotaBC" HeaderText="cuotaBC" SortExpression="cuotaBC" />
                <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                <asp:BoundField DataField="manzanaAsignada" HeaderText="manzanaAsignada" SortExpression="manzanaAsignada" />
                <asp:BoundField DataField="parcelaAsignada" HeaderText="parcelaAsignada" SortExpression="parcelaAsignada" />
                <asp:BoundField DataField="ddContrato" HeaderText="ddContrato" SortExpression="ddContrato" />
                <asp:BoundField DataField="mmContrato" HeaderText="mmContrato" SortExpression="mmContrato" />
                <asp:BoundField DataField="aaaaContrato" HeaderText="aaaaContrato" SortExpression="aaaaContrato" />
            </Columns>
        </asp:GridView>
      </div>
    <div>
        <asp:Button ID="obutReporte" runat="server" Text="Generar Reporte" />
    </div>

          <% Response.Write(armaReporteVenta())%> 
</asp:Content>

