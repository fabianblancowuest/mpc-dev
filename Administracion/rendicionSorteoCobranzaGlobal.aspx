<%@ Page Title="Rendicion global de cobranzas de sorteo." MaintainScrollPositionOnPostback="true" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="rendicionSorteoCobranzaGlobal.aspx.vb" Inherits="Administracion_rendicionSorteoCobranzaGlobal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <h1>RENDICION COBRANZAS SORTEO</h1>

    <div>
        <h4>
            <asp:Label ID="Label1" runat="server" Text="Operaciones pendientes de rendición a operadores de tesorería"></asp:Label>
        </h4>
    </div>

    <asp:Panel ID="PanelGlobal" runat="server">
        <asp:SqlDataSource ID="odsrendicionSorteoCobranzaGlobal" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rendicionSorteoCobranzaGlobal" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:GridView ID="ogvrendicionSorteoCobranzaGlobal" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsrendicionSorteoCobranzaGlobal" Font-Size="X-Small" DataKeyNames="idOperador,operadorDescripcion,operaciones,efectivo,operacionesEfectivo,transferencias,operacionesTransferencia,totalVentas">
            <Columns>
                <asp:CommandField SelectText="Reliza Rendicion" ShowSelectButton="True" />
                <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" Visible="False" />
                <asp:BoundField DataField="operadorDescripcion" HeaderText="Operador" SortExpression="operadorDescripcion" />
                <asp:BoundField DataField="operaciones" HeaderText="Cantidad operaciones" ReadOnly="True" SortExpression="operaciones">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="totalVentas" DataFormatString="{0:c}" HeaderText="Total Ventas" SortExpression="totalVentas" />
                <asp:BoundField DataField="operacionesEfectivo" HeaderText="Cantidad operaciones efectivo" ReadOnly="True" SortExpression="operacionesEfectivo">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="efectivo" DataFormatString="{0:c}" HeaderText="Total efectivo" ReadOnly="True" SortExpression="efectivo">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="operacionesTransferencia" HeaderText="Cantidad operaciones Transferencia" ReadOnly="True" SortExpression="operacionesTransferencia">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="transferencias" DataFormatString="{0:c}" HeaderText="Total transferencias" ReadOnly="True" SortExpression="transferencias">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>

    </asp:Panel>
    <asp:Panel ID="PanelVendedor" runat="server" Visible="false">
        <div>
            <h2>
                <asp:Label ID="Label2" runat="server" Text="Rendiciones pendientes por operador"></asp:Label>
            </h2>
        </div>
        <div>
            <asp:Label ID="Label3" runat="server" Text="Operador"></asp:Label>
            <asp:Label ID="olblOperadorDescripcion" runat="server" Text="" Font-Bold="true"></asp:Label>
            <asp:Label ID="olblIdOperador" runat="server" Text="olblIdOperador" Visible="false"></asp:Label>

        </div>
        <div>
            <asp:Label ID="Label4" runat="server" Text="Total de Operaciones:"></asp:Label>
            <asp:Label ID="olblOperaciones" runat="server" Text="" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label5" runat="server" Text="Total Recaudado:"></asp:Label>
            <asp:Label ID="olblTotalVentas" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
        <div>

            <asp:Label ID="Label6" runat="server" Text="En Efectivo:"></asp:Label>
            <asp:Label ID="olblOperacionesEfectivo" runat="server" Text="" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label8" runat="server" Text="Total Efectivo:"></asp:Label>
            <asp:Label ID="olblEfectivo" runat="server" Text="" Font-Bold="true"></asp:Label>

        </div>
        <div>

            <asp:Label ID="Label7" runat="server" Text="Por transferencia:"></asp:Label>
            <asp:Label ID="olblOperacionesTransferencia" runat="server" Text="" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label10" runat="server" Text="Total Efectivo:"></asp:Label>
            <asp:Label ID="olblTransferencias" runat="server" Text="" Font-Bold="true"></asp:Label>

        </div>    
        <div>
        <asp:Label ID="Label18" runat="server" Text="Cobranzas por transferencias no conciliadas"></asp:Label> 

        </div>  
         <div>
            <asp:SqlDataSource ID="odstransferenciaNoConciliadaVendedor" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="transferenciaNoConciliadaVendedor" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblIdOperador" Name="idOperador" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvtransferenciaNoConciliadaVendedor" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataKeyNames="idSorteoTalonCobranza" DataSourceID="odstransferenciaNoConciliadaVendedor" Font-Size="X-Small" EmptyDataText ="No existen cobranzas por transferencia no conciliadas.">
                <Columns>
                    <asp:TemplateField HeaderText="Comprobante" InsertVisible="False" SortExpression="idSorteoTalonCobranza">

                        <ItemTemplate>
                            <asp:Label ID="idSorteoTalonCobranza" runat="server" Text='<%# Bind("idSorteoTalonCobranza") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="fechaCobranza" HeaderText="Fecha de Carga" SortExpression="fechaCobranza">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Efectivo" SortExpression="efectivoMonto">
                        <ItemTemplate>
                            <asp:Label ID="efectivoMonto" runat="server" Text='<%# Bind("efectivoMonto") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Monto Transferencia" SortExpression="transferenciaMonto">
                        <ItemTemplate>
                            <asp:Label ID="transferenciaMonto" runat="server" Text='<%# Bind("transferenciaMonto") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Transferencia Rinde" SortExpression="transferenciaRinde" Visible="False">

                        <ItemTemplate>
                            <asp:CheckBox ID="transferenciaRinde" runat="server" Checked='<%# Bind("transferenciaRinde") %>' Enabled="true" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="totalComprobante" DataFormatString="{0:c}" HeaderText="Total Comprobante" SortExpression="totalComprobante" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                   <%-- <asp:TemplateField HeaderText="Rinde Comprobante" SortExpression="EfectivoRinde">
                        <ItemTemplate>
                            <asp:CheckBox ID="efectivoRinde" runat="server" Checked='<%# Bind("EfectivoRinde") %>' Enabled="true" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>--%>
                    <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                    <asp:BoundField DataField="CantidadBilletes" HeaderText="Cantidad Billetes" SortExpression="CantidadBilletes">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="detalleBilletes" HeaderText="Detalle Billetes" SortExpression="detalleBilletes" />
                </Columns>
            </asp:GridView>
        </div>

        <div>
        <asp:Label ID="Label19" runat="server" Text="Cobranzas en efectivo y por transferencia conciliadas"></asp:Label> 

        </div>  

        <div>
            <asp:SqlDataSource ID="odsrendicionSorteoCobranzaVendedor" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rendicionSorteoCobranzaVendedor" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblIdOperador" Name="idOperador" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvrendicionSorteoCobranzaVendedor" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataKeyNames="idSorteoTalonCobranza" DataSourceID="odsrendicionSorteoCobranzaVendedor" Font-Size="X-Small">
                <Columns>
                    <asp:TemplateField HeaderText="Comprobante" InsertVisible="False" SortExpression="idSorteoTalonCobranza">

                        <ItemTemplate>
                            <asp:Label ID="idSorteoTalonCobranza" runat="server" Text='<%# Bind("idSorteoTalonCobranza") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="fechaCobranza" HeaderText="Fecha de Carga" SortExpression="fechaCobranza">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Efectivo" SortExpression="efectivoMonto">
                        <ItemTemplate>
                            <asp:Label ID="efectivoMonto" runat="server" Text='<%# Bind("efectivoMonto") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Monto Transferencia" SortExpression="transferenciaMonto">
                        <ItemTemplate>
                            <asp:Label ID="transferenciaMonto" runat="server" Text='<%# Bind("transferenciaMonto") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Transferencia Rinde" SortExpression="transferenciaRinde" Visible="False">

                        <ItemTemplate>
                            <asp:CheckBox ID="transferenciaRinde" runat="server" Checked='<%# Bind("transferenciaRinde") %>' Enabled="true" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="totalComprobante" DataFormatString="{0:c}" HeaderText="Total Comprobante" SortExpression="totalComprobante" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Rinde Comprobante" SortExpression="EfectivoRinde">
                        <ItemTemplate>
                            <asp:CheckBox ID="efectivoRinde" runat="server" Checked='<%# Bind("EfectivoRinde") %>' Enabled="true" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                    <asp:BoundField DataField="CantidadBilletes" HeaderText="Cantidad Billetes" SortExpression="CantidadBilletes">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="detalleBilletes" HeaderText="Detalle Billetes" SortExpression="detalleBilletes" />
                </Columns>
            </asp:GridView>
        </div>

        <div>
            <asp:Label ID="olblValidacionMensajeError" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>

        <div>
            <asp:Button ID="obutPrevisualiza" runat="server" Text="Previsualiza Rendición" CssClass="btn-success" />
        </div>

        <div>
            <asp:Label ID="Label9" runat="server" Text="Total de Efectivo Seleccionado:$"></asp:Label>

            <asp:Label ID="olblEfectivoRendidoMonto" runat="server" Text="" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label12" runat="server" Text=" - en "></asp:Label>
            <asp:Label ID="olblEfectivoRendidoComprobantes" runat="server" Text="" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label13" runat="server" Text=" - comprobantes"></asp:Label>

        </div>


        <div>
            <asp:Label ID="Label11" runat="server" Text="Total de transferencias Seleccionadas:$"></asp:Label>

            <asp:Label ID="olblTransferenciasRendidasMonto" runat="server" Text="" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label15" runat="server" Text=" - en "></asp:Label>
            <asp:Label ID="olblTransferenciasrendidasComprobantes" runat="server" Text="" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label17" runat="server" Text=" - comprobantes"></asp:Label>

        </div>

        <asp:Label ID="Label14" runat="server" Text="Monto de Efectivo Recibido:" Width="50%"></asp:Label>
        <asp:TextBox ID="otxtEfectivoEntregado" runat="server"></asp:TextBox>
        <br>

        <asp:Label ID="Label16" runat="server" Text="Monto a cuenta de anticipo vendedor:" Width="50%"> </asp:Label>
        <asp:TextBox ID="otxtAnticipoVendedor" runat="server" Enabled="false"></asp:TextBox>
        <div>
            <div>
                <asp:Button ID="obutPrevisualizaEntregaRecaudacion" runat="server" CssClass="btn-success" Text="Previsualiza Engrega Recaudación" />
            </div>

            <div>
                <asp:Button ID="obutReingresaRecaudado" runat="server" CssClass="btn-danger" Text="Reingresa Recaudado" Visible="false" />
            </div>
        </div>

        <div align="center">
            <asp:Button ID="obutAltaRendicion" runat="server" Text="CONFIRMA RENDICION" Font-Bold="true" Font-Size="XX-Large" BackColor="#66ff33" Visible="false" />
        </div>
    </asp:Panel>
    <div>
    </div>
</asp:Content>

