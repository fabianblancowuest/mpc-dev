<%@ Page Title="Comprobante de Pago" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="comprobantePago.aspx.vb" Inherits="Administracion_comprobantePago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 548px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
         
  



        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell Width="200px">
                    <asp:Image ID="imgLogo" runat="server" ImageUrl="~/img/MPC_LOGIN.png" Width="100%" Height="100px" />

                </asp:TableCell>
                <asp:TableCell>

                    <asp:Label ID="olblEmpresa" runat="server" Text="Empresa" Font-Bold="true" Font-Size="Large"></asp:Label>
                    <br />

                    <asp:Label ID="olblSucursal" runat="server" Text="Sucursal calle tal numero tal" Font-Bold="true" Font-Size="Large"></asp:Label>


                </asp:TableCell>
            </asp:TableRow>

        </asp:Table>

        <asp:Label ID="olblComprobanteLeyenda" runat="server" Text="Comprobante de pago:" Font-Size="X-Small"></asp:Label>
        <asp:Label ID="olblComprobanteNumero" runat="server" Text="189" Font-Bold="true" Font-Size="X-Small"></asp:Label>
        <asp:Label ID="olblComprobanteConfeccionLeyendaFecha" runat="server" Text=" - Fecha de Confeccion:" Font-Bold="false" Font-Size="X-Small"></asp:Label>
        <asp:Label ID="olblComprobanteConfeccionFecha" runat="server" Text="99/99/9999" Font-Bold="true" Font-Size="X-Small"></asp:Label>
        <asp:Label ID="olblComprobanteConfeccionLeyendaOperador" runat="server" Text=" - Confeccionado por:" Font-Bold="false" Font-Size="X-Small"></asp:Label>
        <asp:Label ID="olblComprobanteconfeccionOperador" runat="server" Text="Gamarra Estefania Lia" Font-Bold="true" Font-Size="X-Small"></asp:Label>



    </div>

   <%-- <asp:Panel ID="PanelPagueseA" runat="server" Font-Size="X-Small">
   --%>     <div>
            <asp:Label ID="olblPagoLeyenda" runat="server" Text="Páguese a:" Font-Size="X-Small"></asp:Label>

            <asp:Label ID="olblPagoDestinatario" runat="server" Text="Fulano / Mengano / Perengano" Font-Bold="true" Font-Size="X-Small"></asp:Label>



        </div>

        <div>
            <asp:Label ID="olblPagoMontoLeyenda" runat="server" Text="La suma de pesos:" Font-Size="X-Small"></asp:Label>

            <asp:Label ID="olblPagoMontoImporteNumero" runat="server" Text="9999.99" Font-Bold="true" Font-Size="X-Small"></asp:Label>


            <asp:Label ID="olblPagoMontoImporteLetras" runat="server" Text=" - (nueve mil novecientos noventa y nueve con 00/100" Font-Bold="true" Font-Size="X-Small"></asp:Label>


        </div>

  <%--  </asp:Panel>
    <asp:Panel ID="PanelConcepto" runat="server" Height="400px">
  --%>      <div>
            <asp:Label ID="olblPagoConcepto" runat="server" Text="En concepto de:" Font-Size="X-Small"></asp:Label>

        </div>
        <div align="center" >
            <asp:SqlDataSource ID="odspagoComprobanteConcepto" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="pagoComprobanteConcepto" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblComprobanteNumero" Name="idAsientoCabecera" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvpagoComprobanteConcepto" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odspagoComprobanteConcepto" Width="90%" Font-Size="X-Small">
                <Columns>
                    <asp:BoundField DataField="concepto" HeaderText="Concepto" ReadOnly="True" SortExpression="concepto" />
                     <asp:BoundField DataField="ComprobanteReferencia" HeaderText="Comprobante Origen" ReadOnly="True" SortExpression="ComprobanteReferencia" >
                  
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                  
                    <asp:BoundField DataField="asientoMovimientoImporteDebito" DataFormatString="{0:c}" HeaderText="Importe Cancelado" ReadOnly="True" SortExpression="asientoMovimientoImporteDebito">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                     <asp:BoundField DataField="Referencia" HeaderText="Referencia" ReadOnly="True" SortExpression="Referencia" />
                </Columns>
            </asp:GridView>
        </div>


   <%-- </asp:Panel>
    <asp:Panel ID="PanelValores" runat="server" Height="100px">
    --%>    <div>
            <asp:Label ID="olblValoresEmitidos" runat="server" Text="Valores Emitidos:" Font-Size="X-Small"></asp:Label>
        </div>
        <div align="center">
            <asp:SqlDataSource ID="odspagoComprobanteValor" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="pagoComprobanteValor" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblComprobanteNumero" Name="idAsientoCabecera" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvpagoComprobanteValor" runat="server" AutoGenerateColumns="False" DataSourceID="odspagoComprobanteValor" CssClass="table-cemmi" Font-Size="X-Small" Width ="95%">
                <Columns>
                    <asp:BoundField DataField="MedioPago" HeaderText="Medio de Pago" ReadOnly="True" SortExpression="MedioPago" />
                    <asp:BoundField DataField="asientoMovimientoImporteDebito" DataFormatString="{0:c}" HeaderText="Entrada" ReadOnly="True" SortExpression="asientoMovimientoImporteDebito">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="asientoMovimientoImporteCredito" DataFormatString="{0:c}" HeaderText="Salida" ReadOnly="True" SortExpression="asientoMovimientoImporteCredito">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ComprobanteReferencia" HeaderText="Comprobante Referencia" ReadOnly="True" SortExpression="ComprobanteReferencia" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Referencia" HeaderText="Referencia" ReadOnly="True" SortExpression="Referencia" />
                </Columns>
            </asp:GridView>
        </div>
   <%-- </asp:Panel>
    <asp:Panel ID="PanelValoresRecibidos" runat="server">--%>
        <div>
           <%-- <asp:Label ID="olblValoresEntregados" runat="server" Text="Valores Entregados" Font-Size="X-Small"></asp:Label>
          --%>  <br />
            <br />
            <br />

            <div align="center">

                <asp:Label ID="Label1" runat="server" Text="_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ " Width="30%" Font-Size="X-Small"></asp:Label>

                <asp:Label ID="Label2" runat="server" Text="_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ " Width="30%" Font-Size="X-Small"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ " Width="30%" Font-Size="X-Small"></asp:Label>
            </div>

            <div align="center">

                <asp:Label ID="olblFirmanteFirma" runat="server" Text="Recibo conforme Firma" Width="30%" Font-Size="X-Small"></asp:Label>

                <asp:Label ID="olblFirmanteFirmaAclaracion" runat="server" Text="Aclaracion" Width="30%" Font-Size="X-Small"></asp:Label>
                <asp:Label ID="olblFirmanteDocumento" runat="server" Text="Documento" Width="30%" Font-Size="X-Small"></asp:Label>
            </div>

        </div>
  <%--  </asp:Panel>--%>

</asp:Content>

