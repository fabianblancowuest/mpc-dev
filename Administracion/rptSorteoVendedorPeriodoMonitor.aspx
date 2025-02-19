<%@ Page Title="Reporte por vendedor y perìodo de Sorteo billetes" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="rptSorteoVendedorPeriodoMonitor.aspx.vb" Inherits="Administracion_rptSorteoVendedorPeriodo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h2 class="titulo-rol">Sorteo vendedor Periodo</h2>
        <asp:SqlDataSource ID="odsOperadorSorteo" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="OPERADORTRAERVENDEDOR" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:DropDownList ID="oddlOperadorSorteo" runat="server" AutoPostBack="True" DataSourceID="odsOperadorSorteo" DataTextField="operadorDescripcion" DataValueField="idOperador"></asp:DropDownList>
        </div>
    <div>

        <asp:Label ID="Label1" runat="server" Text="Ingrese período a procesar."></asp:Label>
        <asp:SqlDataSource ID="odsCalendario" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select id, cONVERT(nvarchar(30),fecha , 102) fecha from calendario order by fecha desc"></asp:SqlDataSource>
    </div>

    <div>

        <asp:Label ID="Label2" runat="server" Text="Desde Fecha :" Width ="20%"></asp:Label>
        <asp:TextBox ID="otxtFechaDesde" runat="server" Visible ="false"></asp:TextBox>
        <asp:DropDownList ID="oddlFechaDesde" runat="server" AutoPostBack="True" DataSourceID="odsCalendario" DataTextField="fecha" DataValueField="id"></asp:DropDownList>
    </div>

    <div>

        <asp:Label ID="Label3" runat="server" Text="Hasta Fecha" Width="20%"></asp:Label>
        <asp:TextBox ID="otxtFechaHasta" runat="server" Visible="false" ></asp:TextBox>
          <asp:DropDownList ID="oddlFechaHasta" runat="server" AutoPostBack="True" DataSourceID="odsCalendario" DataTextField="fecha" DataValueField="id"></asp:DropDownList>
    </div>
    <div>
        <asp:Button ID="obutReporte" runat="server" Text="Generar Reporte" CssClass="btn-basic btn btn-success" />
    </div>

          <% Response.Write(armaReporteVenta(oddlOperadorSorteo.SelectedValue))%> 
</asp:Content>

