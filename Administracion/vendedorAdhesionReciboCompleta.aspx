<%@ Page Title="Asignacion de recibos de cobro por adhesion y vendedor." Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="vendedorAdhesionReciboCompleta.aspx.vb" Inherits="Administracion_vendedorAdhesionReciboCompleta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
        <asp:Label ID="Label1" runat="server" Text="Asignacion de recibos de cobro por vendedor a sus adhesiones."></asp:Label>

    </div>

    <asp:Panel ID="PanelSeleccionaVendedor" runat="server">
<div>
    <asp:Label ID="Label2" runat="server" Text="Vendedor."></asp:Label>
</div>
    <div>
        <asp:SqlDataSource ID="odsVendedorAdhesion" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select idOperador , operadorDescripcion from operador where idOperador in 
(select idVendedor from loteVenta)
order by operadorDescripcion "></asp:SqlDataSource>
        <asp:DropDownList ID="oddlVendedorAdhesion" runat="server" AutoPostBack="True" DataSourceID="odsVendedorAdhesion" DataTextField="operadorDescripcion" DataValueField="idOperador"></asp:DropDownList>
    </div>
</asp:Panel>

    <asp:Panel ID="PanelAdhesiones" runat="server">

    <div>


        <asp:SqlDataSource ID="odsAdhesionesVendedor" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="vendedorAdhesiones" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="oddlVendedorAdhesion" Name="idVendedor" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="ogvAdhesionesVendedor" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataKeyNames="idLoteVenta,idBarrioLote,loteVentaCodigo,loteVentaDescripcion,idBarrio,idVendedor,loteVentaFechaVisita,loteVentaAdhesionMonto,loteVentaCuotaMonto,cliente01Nombre,cliente01DNI,cliente01Domicilio,cliente01Telefono,cliente02Nombre,cliente02DNI,cliente02Domicilio,cliente02Telefono,idClienteIVA,clienteCUIT,idLoteDimension,idCuotasCantidad,idLoteTipo,loteVentafechaCancelacion,LOTEPRECIOBC,CUOTABC,idLoteEstado,idBarrioLote01,Barrio,MZ,PC,Cobrado,saldoAdhesion,CantidadRecibos,EstadoCobranza" DataSourceID="odsAdhesionesVendedor" Font-Size="X-Small">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="idLoteVenta" HeaderText="id Lote Venta" InsertVisible="False" ReadOnly="True" SortExpression="idLoteVenta" />
                <asp:BoundField DataField="idBarrioLote" HeaderText="id Barrio Lote" SortExpression="idBarrioLote" />
                <asp:BoundField DataField="idVendedor" HeaderText="idVendedor" SortExpression="idVendedor" Visible="False" />
                <asp:BoundField DataField="loteVentaFechaVisita" DataFormatString="{0:d}" HeaderText="Fecha Visita" SortExpression="loteVentaFechaVisita" />
                <asp:BoundField DataField="Barrio" HeaderText="Barrio" SortExpression="Barrio" />
                <asp:BoundField DataField="MZ" HeaderText="MZ" SortExpression="MZ" />
                <asp:BoundField DataField="PC" HeaderText="PC" SortExpression="PC" />
                <asp:BoundField DataField="loteVentaAdhesionMonto" DataFormatString="{0:c}" HeaderText="Monto Adhesion Monto" SortExpression="loteVentaAdhesionMonto">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="loteVentaCuotaMonto" DataFormatString="{0:c}" HeaderText="Monto Cuota" SortExpression="loteVentaCuotaMonto">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="LOTEPRECIOBC" HeaderText="PRECIO LOTE EN BC" SortExpression="LOTEPRECIOBC" />
                <asp:BoundField DataField="CUOTABC" HeaderText="CUOTA MENSUAL BC" SortExpression="CUOTABC" />
                <asp:BoundField DataField="cliente01Nombre" HeaderText="cliente 01 Nombre" SortExpression="cliente01Nombre" />
                <asp:BoundField DataField="cliente01DNI" HeaderText="cliente 01 DNI" SortExpression="cliente01DNI" Visible="False" />
                <asp:BoundField DataField="cliente01Domicilio" HeaderText="cliente 01 Domicilio" SortExpression="cliente01Domicilio" Visible="False" />
                <asp:BoundField DataField="cliente01Telefono" HeaderText="cliente 01 Telefono" SortExpression="cliente01Telefono" Visible="False" />
                <asp:BoundField DataField="cliente02Nombre" HeaderText="cliente 02 Nombre" SortExpression="cliente02Nombre" />
                <asp:BoundField DataField="cliente02DNI" HeaderText="cliente02DNI" SortExpression="cliente02DNI" Visible="False" />
                <asp:BoundField DataField="cliente02Domicilio" HeaderText="cliente 02 Domicilio" SortExpression="cliente02Domicilio" Visible="False" />
                <asp:BoundField DataField="cliente02Telefono" HeaderText="cliente 02 Telefono" SortExpression="cliente02Telefono" Visible="False" />
                <asp:BoundField DataField="clienteCUIT" HeaderText="CUIT" SortExpression="clienteCUIT"  Visible="false"/>
                <asp:BoundField DataField="loteVentafechaCancelacion" DataFormatString="{0:d}" HeaderText="Fecha Probable Cancelacion" SortExpression="loteVentafechaCancelacion" />
                
                <asp:BoundField DataField="Cobrado" DataFormatString="{0:c}" HeaderText="Total Cobrado" SortExpression="Cobrado">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="CantidadRecibos" HeaderText="Cantidad Recibos" SortExpression="CantidadRecibos">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="EstadoCobranza" HeaderText="EstadoCobranza" SortExpression="EstadoCobranza" />
                <asp:BoundField DataField="saldoAdhesion" DataFormatString="{0:c}" HeaderText="Saldo Adhesion" SortExpression="saldoAdhesion">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                
            </Columns>
        </asp:GridView>
    </div>

        </asp:Panel>
    <asp:Panel ID="PanelRecibosVendedor" runat="server" Visible="false">
        <div>
            <asp:Label ID="Label3" runat="server" Text="Recibos por vendedor y adhesión."></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label4" runat="server" Text="Barrio:"></asp:Label>
            <asp:Label ID="olblBarrio" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label5" runat="server" Text="Manzana:"></asp:Label>
            <asp:Label ID="olblManzana" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label6" runat="server" Text="Parcela:"></asp:Label>
            <asp:Label ID="olblParcela" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>

        <div>
            <asp:Label ID="Label7" runat="server" Text="Comprador/es:"></asp:Label>
            <asp:Label ID="olblComprador" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label8" runat="server" Text="Telefono/s:"></asp:Label>
            <asp:Label ID="olblTelefonos" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>

        <div>
            <asp:Label ID="Label9" runat="server" Text="Monto Adhesión:"></asp:Label>
            <asp:Label ID="olblAdhesionMonto" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>



         <div>
            <asp:Label ID="Label10" runat="server" Text="Pagos acumulados:"></asp:Label>
            <asp:Label ID="olblPagosAcumulados" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>

        <div>
            <asp:Label ID="Label11" runat="server" Text="Saldo Adhesión:"></asp:Label>
            <asp:Label ID="olblAdhesionSaldo" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
        <br />

    </asp:Panel>

</asp:Content>

