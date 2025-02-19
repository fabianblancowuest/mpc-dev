<%@ Page Title="Producción sorteo billetes sorteo por vendedor y premio en período." MaintainScrollPositionOnPostback="true" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="rptSorteoVendedorPremioPeriodo.aspx.vb" Inherits="Administracion_rptSorteoVendedorPremioPeriodo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <h3>Producción sorteo billetes sorteo por vendedor y premio en período.
        </h3>

    </div>

    <div>
        <asp:Label ID="Label1" runat="server" Text="Este reporte toma las cargas realizadas por cada operador en el sistema. "></asp:Label>
    </div>

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
        <asp:SqlDataSource ID="odsrptSorteoProduccion" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rptSorteoVendedorPremioPeriodo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="oddlFechaDesde" Name="fechaDesde" PropertyName="SelectedValue" Type="DateTime" />
                <asp:ControlParameter ControlID="oddlFechaHasta" Name="fechaHasta" PropertyName="SelectedValue" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="ogvrptSorteoProduccion" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsrptSorteoProduccion" Font-Size="Small">
            <Columns>
                <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" Visible="False" ReadOnly="True" />
                <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="operadorDescripcion" HeaderText="Operador" ReadOnly="True" SortExpression="operadorDescripcion">
                </asp:BoundField>
                <asp:BoundField DataField="idSorteoPremio" HeaderText="idSorteoPremio" ReadOnly="True" SortExpression="idSorteoPremio" Visible="False">
                </asp:BoundField>
                <asp:BoundField DataField="sorteoPremioDescripcion" HeaderText="Premio " ReadOnly="True" SortExpression="sorteoPremioDescripcion">
                </asp:BoundField>
                <asp:BoundField DataField="billetes" HeaderText="billetes" ReadOnly="True" SortExpression="billetes">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="venta" DataFormatString="{0:c}" HeaderText="venta" ReadOnly="True" SortExpression="venta">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>

