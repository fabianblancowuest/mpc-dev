<%@ Page Title="Reporte por vendedor y perìodo de Sorteo billetes" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="rptSorteoVendedorPeriodo.aspx.vb" Inherits="Administracion_rptSorteoVendedorPeriodo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <asp:Label ID="Label1" runat="server" Text="Ingrese período a procesar" CssClass="subtitulo-rol"></asp:Label>
        <asp:SqlDataSource ID="odsCalendario" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select id, cONVERT(nvarchar(30),fecha , 102) fecha from calendario order by fecha desc"></asp:SqlDataSource>
    </div>

    <div class="seleccion-fechas-sp">
        <asp:Label ID="Label2" runat="server" Text="Desde Fecha :" Width ="20%"></asp:Label>
        <asp:TextBox ID="otxtFechaDesde" runat="server" Visible ="false"></asp:TextBox>
        <asp:DropDownList ID="oddlFechaDesde" runat="server" AutoPostBack="True" DataSourceID="odsCalendario" DataTextField="fecha" DataValueField="id"></asp:DropDownList>
        <asp:Label ID="Label3" runat="server" Text="Hasta Fecha" Width="20%"></asp:Label>
        <asp:TextBox ID="otxtFechaHasta" runat="server" Visible="false" ></asp:TextBox>
          <asp:DropDownList ID="oddlFechaHasta" runat="server" AutoPostBack="True" DataSourceID="odsCalendario" DataTextField="fecha" DataValueField="id"></asp:DropDownList>
    </div>
    <div style="text-align: center;">
        <asp:Button ID="obutReporte" runat="server" Text="Generar Reporte" CssClass="btn-basic btn-success"/>
    </div>

          <% Response.Write(armaReporteVenta(Session("idOperador")))%> 
</asp:Content>

