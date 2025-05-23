﻿<%@ Page Title="Carpetas pendientes de firma por parte de VENDEDOR" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="rptCarpetasEstadoVendedor.aspx.vb" Inherits="Administracion_rptCarpetasEstadoVendedor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <h2 class="titulo-rol">
        <asp:Label ID="olblTitulo" runat="server" Text="Reporte de carpetas pendientes de firma por parte de proveedor"></asp:Label>
      
    </h2>
</div>
    <div>
        <asp:Label ID="Label1" runat="server" Text="Filtro:"></asp:Label>
      
          <asp:CheckBox ID="ochEstado" runat="server" AutoPostBack="True" />
    </div>
 <div>
        <asp:Label ID="olblSeleccionaBarrio" runat="server" Text="Seleccione Barrio"></asp:Label>
        <asp:SqlDataSource ID="odsBarrioHabilitadoSelecciona" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="BARRIOTraerODDL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:DropDownList ID="oddlBarrioHabilitadoSelecciona" runat="server" AutoPostBack="True" DataSourceID="odsBarrioHabilitadoSelecciona" DataTextField="barrioDescripcion" DataValueField="idBarrio" Width="100%"></asp:DropDownList>
    </div>
<div>
    <asp:SqlDataSource ID="odsrptCarpetasEstadoEntreTres" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rptCarpetasEstadoVendedor" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="oddlBarrioHabilitadoSelecciona" DefaultValue="1" Name="idBarrio" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="idBarrioLoteVentaEstado" Type="Int32" />
            <asp:ControlParameter ControlID="ochEstado" DefaultValue="false" Name="estado" PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="ogvrptCarpetasEstadoEntreTres" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsrptCarpetasEstadoEntreTres" EmptyDataText="El proveedor seleccionado no tiene carpetas pendientes de firma que hayan sido firmadas por el agente o el comprador." Font-Size="Small">
        <Columns>
            <asp:BoundField DataField="orden" HeaderText="Orden" InsertVisible="False" SortExpression="orden">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Barrio" HeaderText="Barrio" SortExpression="Barrio" />
            <asp:BoundField DataField="Manzana" HeaderText="Manzana" SortExpression="Manzana" />
            <asp:BoundField DataField="Lote" HeaderText="Lote" SortExpression="Lote" />
            <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
            <asp:BoundField DataField="PrecioBC" HeaderText="PrecioBC" SortExpression="PrecioBC" />
            <asp:BoundField DataField="superficie" HeaderText="superficie" SortExpression="superficie" />
            <asp:BoundField DataField="Cuotas" HeaderText="Cuotas" SortExpression="Cuotas" />
            <asp:BoundField DataField="Cliente" HeaderText="Cliente" ReadOnly="True" SortExpression="Cliente" />
            <asp:BoundField DataField="DNI" HeaderText="DNI" ReadOnly="True" SortExpression="DNI" />
            <asp:CheckBoxField DataField="CarpetaLista" HeaderText="Carpeta Lista" ReadOnly="True" SortExpression="CarpetaLista">
            <ItemStyle HorizontalAlign="Center" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="FirmaVendedor" HeaderText="Firma Vendedor" ReadOnly="True" SortExpression="FirmaVendedor">
            <ItemStyle HorizontalAlign="Center" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="FirmaAgente" HeaderText="Firma Agente" ReadOnly="True" SortExpression="FirmaAgente">
            <ItemStyle HorizontalAlign="Center" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="FirmaComprador" HeaderText="Firma Comprador" ReadOnly="True" SortExpression="FirmaComprador">
            <ItemStyle HorizontalAlign="Center" />
            </asp:CheckBoxField>
        </Columns>
    </asp:GridView>
</div>


</asp:Content>

