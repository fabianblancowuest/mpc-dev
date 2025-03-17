<%@ Page Title="Reporte de saldos y movimientos de Recaudaciones a Depositar." Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="rptRAD.aspx.vb" Inherits="Administracion_rptRAD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Reporte de Recaudaciones a Depositar."></asp:Label>
    </div>

    <div>
        <asp:Label ID="Label10" runat="server" Text="Ingrese período a procesar" CssClass="subtitulo-rol"></asp:Label>
        <asp:SqlDataSource ID="odsCalendario" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="calendarioAlta;select id, cONVERT(nvarchar(30),fecha , 102) fecha from calendario order by fecha desc"></asp:SqlDataSource>
    </div>

    <div class="seleccion-fechas-sp">
        <asp:Label ID="Label11" runat="server" Text="Desde Fecha :" Width="20%"></asp:Label>
        <asp:TextBox ID="otxtFechaDesde" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="oddlFechaDesde" runat="server" AutoPostBack="True" DataSourceID="odsCalendario" DataTextField="fecha" DataValueField="id"></asp:DropDownList>
        <asp:Label ID="Label12" runat="server" Text="Hasta Fecha" Width="20%"></asp:Label>
        <asp:TextBox ID="otxtFechaHasta" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="oddlFechaHasta" runat="server" AutoPostBack="True" DataSourceID="odsCalendario" DataTextField="fecha" DataValueField="id"></asp:DropDownList>
        <br />
        <asp:Button ID="obutRADActualizaPeriodo" runat="server" Text="Actualiza" />
    
    </div>


    <div>

        <asp:SqlDataSource ID="odsrptMinutaFecha" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select * from rptRAD where idOperador = @idOperador order by plancuentaCodigo, idAsientoCabecera ">
            <SelectParameters>
                <asp:SessionParameter Name="idOperador" SessionField="session_idOperador" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="ogvrptMinutaFecha" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsrptMinutaFecha" Font-Size="X-Small">
            <Columns>
                <asp:CommandField SelectText="Ver Movimiento" ShowSelectButton="True" />
                <asp:BoundField DataField="fecha" HeaderText="fecha" ReadOnly="True" SortExpression="fecha" />
                <asp:BoundField DataField="idAsientoCabecera" HeaderText="Asiento" ReadOnly="True" SortExpression="idAsientoCabecera" />
                <asp:BoundField DataField="idPlanCuenta" HeaderText="idPlanCuenta" ReadOnly="True" SortExpression="idPlanCuenta" Visible="False" />
                <asp:BoundField DataField="planCuentaCodigo" HeaderText="Codigo" ReadOnly="True" SortExpression="planCuentaCodigo" />
                <asp:BoundField DataField="planCuentaDescripcion" HeaderText="Cuenta " ReadOnly="True" SortExpression="planCuentaDescripcion" />
                <asp:BoundField DataField="concepto" HeaderText="Concepto" ReadOnly="True" SortExpression="concepto" Visible="True" />
                <asp:BoundField DataField="referencia" HeaderText="Referencia" ReadOnly="True" SortExpression="referencia" />
                <asp:BoundField DataField="debe" HeaderText="Ingreso" ReadOnly="True" SortExpression="debe" DataFormatString="{0:c}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="haber" HeaderText="Egreso" ReadOnly="True" SortExpression="haber" DataFormatString="{0:c}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="personaImputada" HeaderText="Persona Imputada" ReadOnly="True" SortExpression="personaImputada" />
            </Columns>
        </asp:GridView>
    </div>





</asp:Content>

