<%@ Page Title="Comprobante de Rendición" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="sorteoRendicionComprobante.aspx.vb" Inherits="Administracion_sorteoRendicionComprobante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 966px; margin-top: 0px">
        <asp:Label ID="Label3" runat="server" Text="Mi Primer Casa" Font-Bold="true" Font-Size="X-Large"></asp:Label>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Rendicion venta Sorteo: " Font-Bold="true"></asp:Label>
        <asp:Label ID="olblIdRendicion" runat="server" Text="" Font-Bold="true"></asp:Label>
        <asp:Label ID="Label6" runat="server" Text="- Fecha Rendicion: " Font-Bold="false"></asp:Label>
        <asp:Label ID="olblRendicionFecha" runat="server" Text="" Font-Bold="true"></asp:Label>
        
    </div>


    <asp:Panel ID="PanelUltimas" runat="server">

        <div>
            <asp:Label ID="Label2" runat="server" Text="Ultimas rendiciones:"></asp:Label>
            <asp:TextBox ID="otxtUltimas" runat="server" Text="10"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label7" runat="server" Text="Seleccione Operador:"></asp:Label>
            <asp:SqlDataSource ID="odsrendicionVendedorRindeODDL" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rendicionVendedorRindeODDL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:DropDownList ID="oddlrendicionVendedorRindeODDL" runat="server" AutoPostBack="True" DataSourceID="odsrendicionVendedorRindeODDL" DataTextField="operadorDescripcion" DataValueField="idOperador"></asp:DropDownList>
        </div>
        <div>
            <asp:SqlDataSource ID="odsSorteoRendicionUltimas" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoRendicionUltimas" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="otxtUltimas" Name="cantidadUltimas" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="oddlrendicionVendedorRindeODDL" Name="idOperador" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvSorteoRendicionUltimas" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataKeyNames="idSorteoRendicion" DataSourceID="odsSorteoRendicionUltimas" Font-Size="Small">
                <Columns>
                    <asp:CommandField SelectText="Ver Rendicion" ShowSelectButton="True" />
                    <asp:BoundField DataField="idSorteoRendicion" HeaderText="Rendicion" InsertVisible="False" ReadOnly="True" SortExpression="idSorteoRendicion" >
                    <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="fechaRendicion" HeaderText="Fecha Rendicion" SortExpression="fechaRendicion" />
                    <asp:BoundField DataField="idOperadorRecibe" HeaderText="idOperadorRecibe" SortExpression="idOperadorRecibe" Visible="False" />
                    <asp:BoundField DataField="operadorRinde" HeaderText="Operador Rinde" SortExpression="operadorRinde"  >
                    <ItemStyle Font-Bold="True" Font-Size="X-Small" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Operador Recibe" SortExpression="operadorRecibe">
                       
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("operadorRecibe") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Font-Size="X-Small" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="idOperadorRinde" SortExpression="idOperadorRinde" Visible="False">
                        
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("idOperadorRinde") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Rendicion_Total" SortExpression="totalRendicion">
                        
                        <ItemTemplate>
                            <asp:Label ID="Label14" runat="server" Text="Rendicion_Total"></asp:Label>

                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("totalRendicion", "{0:c}") %>' Font-Bold="true"></asp:Label>
                        
                        <asp:Label runat="server" Text="Efectivo:"></asp:Label>
                        
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("efectivoMonto", "{0:c}") %>' Font-Bold="true"></asp:Label>
                        
                            <asp:Label ID="Label15" runat="server" Text="Cant. Cbtes Efect."></asp:Label>

                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("efectivoComprobantes") %>' Font-Bold="true"></asp:Label>
                 
                            <asp:Label ID="Label16" runat="server" Text="Monto_Transf_B"></asp:Label>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("transferenciasMonto", "{0:c}") %>' Font-Bold="true"></asp:Label>
                            <asp:Label runat="server" Text="Cant. Cbtes Transf."></asp:Label>
                   
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("transferenciasComprobantes") %>' Font-Bold="true"></asp:Label>
                             <asp:Label ID="Label17" runat="server" Text="Anticipo Vendedor"></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("aCuentaVendedor", "{0:c}") %>' Font-Bold="true"></asp:Label>
                         
                            <asp:Label ID="Label18" runat="server" Text="Asiento"></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("idAsientoCabecera") %>' Font-Bold="true"></asp:Label>
                 <br />
                            <asp:Label ID="Label19" runat="server" Text="Billetes"></asp:Label>
                            <br />
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Billetes") %>' Font-Bold="true"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelRendicion" runat="server" Visible="false">
        <div>
            <asp:Label ID="Label4" runat="server" Text="Operador Rinde:"></asp:Label>
            <asp:Label ID="olblOperadorRinde" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label5" runat="server" Text="Operador Recibe:"></asp:Label>
            <asp:Label ID="olblOperadorRecibe" runat="server" Text="" Font-Bold="true"></asp:Label>

        </div>


        <asp:SqlDataSource ID="odsSorteoRendicionImprime" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoRendicionImprime" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ogvSorteoRendicionUltimas" Name="idSorteoRendicion" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="ogvSorteoRendicionImprime" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataKeyNames="idSorteoTalonCobranza" DataSourceID="odsSorteoRendicionImprime" Font-Size="X-Small">
            <Columns>
                <asp:BoundField DataField="idSorteoTalonCobranza" HeaderText="Cobranza" InsertVisible="False" ReadOnly="True" SortExpression="idSorteoTalonCobranza">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" Visible="False" />
                <asp:BoundField DataField="fechaCobranza" HeaderText="fechaCobranza" SortExpression="fechaCobranza" />
                <asp:BoundField DataField="efectivoMonto" HeaderText="Efectivo " SortExpression="efectivoMonto" />
                <asp:CheckBoxField DataField="efectivoRendido" HeaderText="efectivoRendido" SortExpression="efectivoRendido" Visible="False" />
                <asp:BoundField DataField="efectivoOperadorRecepciona" HeaderText="efectivoOperadorRecepciona" SortExpression="efectivoOperadorRecepciona" Visible="False" />
                <asp:BoundField DataField="transferenciaMonto" HeaderText="Transferencia " SortExpression="transferenciaMonto" />
                <asp:BoundField DataField="transferenciaNumero" HeaderText="Numero Transferencia" SortExpression="transferenciaNumero" />
                <asp:BoundField DataField="billetes" HeaderText="billetes" ReadOnly="True" SortExpression="billetes" />
            </Columns>
        </asp:GridView>
        <div>

            <asp:SqlDataSource ID="odssorteoRendicionTotales" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoRendicionTotales" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ogvSorteoRendicionUltimas" Name="idSorteoRendicion" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvsorteoRendicionTotales" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odssorteoRendicionTotales">
                <Columns>
                    <asp:BoundField DataField="concepto" HeaderText="concepto" ReadOnly="True" SortExpression="concepto" />
                    <asp:BoundField DataField="Total" DataFormatString="{0:c}" HeaderText="Total" ReadOnly="True" SortExpression="Total">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Comprobantes" HeaderText="Comprobantes" ReadOnly="True" SortExpression="Comprobantes">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
<%--        <div>
            <asp:Label ID="Label6" runat="server" Text="Total Rendición:"></asp:Label>
            <asp:Label ID="olblTotalRendicionLeyenda" runat="server" Text="" Font-Bold="true"></asp:Label>


        </div>
        <div>
            <asp:Label ID="Label7" runat="server" Text="Total Efectivo:"></asp:Label>
            <asp:Label ID="olblTotalEfectivoLeyenda" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label8" runat="server" Text="Total Transferencia Bancaria:"></asp:Label>
            <asp:Label ID="olblTotalTransferenciaLeyenda" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
        <div>
            <asp:Label ID="olblRendicionObservaciones" runat="server" Text=""></asp:Label>
        </div>--%>
        </asp:Panel>

                <div>
            <asp:Label ID="Label9" runat="server" Text="Recibió conforme:"></asp:Label>

            <asp:Label ID="olblRecibeConforme" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
        <asp:Panel ID="PanelACuenta" runat="server" Visible="true">
        <div>
            <asp:Label ID="Label10" runat="server" Text="Anticipo a cuenta vendedor:" Font-Bold="true" Font-Size="Large"></asp:Label>
            <br />
        </div>

        <div>
            <asp:Label ID="Label11" runat="server" Text="Recibí conforme en concepto de anticipo la suma de :"></asp:Label>
            <asp:Label ID="olblAnticipoMontoLeyenda" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label12" runat="server" Text="La suma anticipada será deducida de su próximo pago de comisiones." Font-Bold="true"></asp:Label>

            <br />
            <br />
            <asp:Label ID="Label13" runat="server" Text="Firma:--------------------------------------" Font-Bold="true"></asp:Label>
            <br />
            <asp:Label ID="olblAnticipoVendedorLeyenda" runat="server" Text="" Font-Bold="true"></asp:Label>
            <br />

        </div>
    </asp:Panel>
</asp:Content>

