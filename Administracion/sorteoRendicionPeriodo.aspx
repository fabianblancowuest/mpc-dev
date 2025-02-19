<%@ Page Title="Reporte de rendicion de cobranzas por perìodo " Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="sorteoRendicionPeriodo.aspx.vb" Inherits="Administracion_sorteoRendicionPeriodo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>

    <asp:Label ID="Label1" runat="server" Text="Rendiciones de Sorteo por periodo"></asp:Label>
</h2>
  <div>


        <asp:Label ID="Label3" runat="server" Text="Período:" ></asp:Label>
        <asp:SqlDataSource ID="odsCalendario" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select id, cONVERT(nvarchar(30),fecha , 102) fecha from calendario order by fecha desc"></asp:SqlDataSource>
    </div>
    <div>
        <asp:Label ID="Label4" runat="server" Text="Desde Fecha :" Width="20%"></asp:Label>
        <asp:DropDownList ID="oddlFechaDesde" runat="server" AutoPostBack="True" DataSourceID="odsCalendario" DataTextField="fecha" DataValueField="fecha" Font-Bold ="true" ></asp:DropDownList>
    </div>
    <div>

        <asp:Label ID="Label5" runat="server" Text="Hasta Fecha" Width="20%"></asp:Label>
        <asp:DropDownList ID="oddlFechaHasta" runat="server" AutoPostBack="True" DataSourceID="odsCalendario" DataTextField="fecha" DataValueField="fecha" Font-Bold ="true" ></asp:DropDownList>
    </div>
 
    <div>

        <asp:Label ID="Label2" runat="server" Text="Selecione operador de tesoreria "></asp:Label>
    </div>
    <div>
        
        <asp:SqlDataSource ID="odsOperadorTesoreriaTrae" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="operadorTesoreriaTrae" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="idEmpresaOperador" SessionField="idEmpresaOperador" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="ogvOperadorTesoreriaTrae" runat="server" DataSourceID="odsOperadorTesoreriaTrae" DataTextField="operadorDescripcion" DataValueField="idOperador" AutoPostBack="True"></asp:DropDownList>
    </div>
    <div>
   
  <asp:SqlDataSource ID="odssorteoRendicionPeriodo" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoRendicionPeriodo" SelectCommandType="StoredProcedure">
      <SelectParameters>
          <asp:ControlParameter ControlID="oddlFechaDesde" Name="fechaDesde" PropertyName="SelectedValue" Type="DateTime" />
          <asp:ControlParameter ControlID="oddlFechaHasta" Name="fechaHasta" PropertyName="SelectedValue" Type="DateTime" />
          <asp:ControlParameter ControlID="ogvOperadorTesoreriaTrae" Name="idOperador" PropertyName="SelectedValue" Type="Int32" />
      </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="ogvsorteoRendicionPeriodo" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odssorteoRendicionPeriodo" Font-Size="X-Small">
            <Columns>
                <asp:BoundField DataField="orden" HeaderText="orden" ReadOnly="True" SortExpression="orden" Visible="False" />
                <asp:BoundField DataField="idSorteoRendicion" HeaderText="Rendicion" SortExpression="idSorteoRendicion">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="fechaRendicion" HeaderText="Fecha Rendicion" ReadOnly="True" SortExpression="fechaRendicion" />
                <asp:BoundField DataField="operadorDescripcion" HeaderText="Operador" ReadOnly="True" SortExpression="operadorDescripcion" />
                <asp:BoundField DataField="efectivoMonto" DataFormatString="{0:c}" HeaderText="Monto Efectivo" ReadOnly="True" SortExpression="efectivoMonto">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="efectivoComprobantes" HeaderText="Cantidad ventas Efectivo" ReadOnly="True" SortExpression="efectivoComprobantes">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="transferenciasMonto" DataFormatString="{0:c}" HeaderText="Monto Transferencias" ReadOnly="True" SortExpression="transferenciasMonto">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="transferenciasComprobantes" HeaderText="Cantidad Ventas x Transferencias" ReadOnly="True" SortExpression="transferenciasComprobantes">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="totalCobranza" DataFormatString="{0:c}" HeaderText="Total Rendicion" SortExpression="totalCobranza">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="Billetes" HeaderText="Billetes en Rendicion" SortExpression="Billetes" />
            </Columns>
        </asp:GridView>

    </div>
</asp:Content>

