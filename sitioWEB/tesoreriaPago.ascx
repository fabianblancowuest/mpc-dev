<%@ Control Language="VB" AutoEventWireup="false" CodeFile="tesoreriaPago.ascx.vb" Inherits="sitioWEB_tesoreriaPago" %>
        <div>
            <!-- session("idOperador") -->

            <asp:Panel ID="PanelValores" runat="server">

                <asp:Panel ID="PanelValoresIngreso" runat="server">

                <div>
                    <asp:Label ID="olblValorTipo" runat="server" Text=""></asp:Label>
                </div>
                <div>
                    <asp:Label ID="olblMontoLeyenda" runat="server" Text="Total a pagar:" Font-Bold="True" Width="10%"></asp:Label>
                    <asp:TextBox ID="otxtMontoImporte" runat="server" Text="0" Font-Bold="true" Enabled="false" Width="10%"></asp:TextBox>
                    <asp:Label ID="olblFechaOperacion" runat="server" Text=""></asp:Label>
                    <asp:Button ID="obutValidarValores" runat="server" Text="Validar Valores entregados" CssClass="btn-success" />
                    <asp:Label ID="olblValoresRecibidosLeyenda" runat="server" Text="Total  valores recibidos:" Font-Bold="true"></asp:Label>
                    <asp:TextBox ID="otxtValoresRecibidosMonto" runat="server" Text="0" Font-Bold="true" Enabled="false"></asp:TextBox>
                    <asp:Button ID="obuttesoreriaValorInicializa" runat="server" Text="Limpiar valores" CssClass="btn-danger" />
                </div>
                <div>
                    <asp:Label ID="Label3" runat="server" Text="Estado Operacion:" Font-Bold="True" Width="10%"></asp:Label>
                    <asp:TextBox ID="otxtEstadoDiferencia" runat="server" Enabled="false" Font-Size="Large" Width="10%"></asp:TextBox>
                    <asp:Label ID="olblEstadoMensaje" runat="server" Text="" Font-Bold="true"></asp:Label>
                    <asp:Button ID="obutValidado" runat="server" Text="" Enabled ="false"  />
                    <asp:Label ID="olblOperacionValida" runat="server" Text="0"  Visible ="false" ></asp:Label>
                
                </div>

                <div>
                    <asp:Panel ID="PanelCobranzaExceso" runat="server" Visible="false">

                        <div>
                            <asp:Label ID="Label4" runat="server" Text="Dinero a favor del acreedor:" Width="30%"></asp:Label>

                            <asp:TextBox ID="otxtCobranzaExceso" runat="server" Enabled="false" Text="0" Width="10%"></asp:TextBox>


                        </div>
                        <div>
                            <asp:Button ID="obutAfirmaSaldoACuenta" runat="server" Text="Saldo a cuenta del acreedor" />
                            <asp:Button ID="obutVueltoEfectivoCaja" runat="server" Text="Diferencia a efectivo por Caja"  />

                        </div>
                    </asp:Panel>


                </div>



                <div>
                    <asp:Label ID="olblValidacionMensaje" runat="server" Text="" ForeColor="Blue"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="olblValidacionMensajeError" runat="server" Text="" ForeColor="RED"></asp:Label>

                </div>




             
                 <!-- Valores no trazables -->
                <div>
                    <asp:Label ID="Label2" runat="server" Text="Valores no trazables"></asp:Label>
                </div>

                <asp:SqlDataSource ID="odsTesoreriaValoresInicia" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="tesoreriaCobranzaOperador" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="idEmpresaOperador" Type="Int32" />
                        <asp:ControlParameter ControlID="olblFechaOperacion" Name="fechaOperacion" PropertyName="Text" Type="DateTime" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div>
                    <asp:SqlDataSource ID="odsTesoreriaOperadorTrae" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="tesoreriaCobranzaOperadorTraeNoTrazable" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter   Name="idOperador" SessionField="idEmpresaOperador" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="ogvtesoreriaCobranzaOperador" runat="server" DataSourceID="odsTesoreriaOperadorTrae" AutoGenerateColumns="False" CssClass="table-cemmi" Width="60%" Font-Size="Small">
                        <Columns>
                            <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id" Visible="False">

                                <ItemTemplate>
                                    <asp:Label ID="id" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" Visible="False" />
                            <asp:BoundField DataField="orden" HeaderText="orden" SortExpression="orden" Visible="False" />
                            <asp:BoundField DataField="idPlancuenta" HeaderText="idPlancuenta" SortExpression="idPlancuenta" Visible="False" />
                            <asp:BoundField DataField="planCuentaCodigo" HeaderText="planCuentaCodigo" SortExpression="planCuentaCodigo" Visible="False" />
                            <asp:BoundField DataField="planCuentaDescripcion" HeaderText="Tipo valor" SortExpression="planCuentaDescripcion" />
                            <asp:BoundField DataField="idMoneda" HeaderText="idMoneda" SortExpression="idMoneda" Visible="False" />
                            <asp:BoundField DataField="monedaCodigo" HeaderText="Moneda" SortExpression="monedaCodigo" />
                            <asp:BoundField DataField="cotizacionValor" HeaderText="Cotizacion" SortExpression="cotizacionValor">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Referencia" SortExpression="referencia" Visible="False">
                                <ItemTemplate>
                                    <asp:TextBox ID="otxtValorReferencia" runat="server" Text='<%# Bind("referencia") %>'></asp:TextBox>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Monto" SortExpression="monto">
                                <ItemTemplate>
                                    <asp:TextBox ID="otxtValorMonto" runat="server" Text='<%# Bind("monto") %>'></asp:TextBox>
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Right" />

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sub Total " SortExpression="totalMonto">
                                <ItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("totalMonto") %>' Enabled="false"></asp:TextBox>
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fecha Valor" SortExpression="fechaValor" Visible="False">
                                <ItemTemplate>
                                    <asp:TextBox ID="otxtFechaValor" runat="server" Text='<%# Bind("fechaValor") %>'></asp:TextBox>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Diferencia de cambio" SortExpression="diferenciaCambio">
                                <ItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("diferenciaCambio") %>' Enabled="false"></asp:TextBox>
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="trazable" SortExpression="trazable" Visible="False">

                                <ItemTemplate>
                                    <asp:Label ID="olblTrazable" runat="server" Text='<%# Bind("trazable") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <!-- Valores trazables -->
                <div>
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Valores Trazables" Font-Bold="true"></asp:Label>
                </div>
                <div>
                    <asp:SqlDataSource ID="odsTesoreriaOperadorTraeTrazable" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="tesoreriaCobranzaOperadorTraeTrazable" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter  Name="idOperador" SessionField="idEmpresaOperador" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="ogvtesoreriaCobranzaOperadorTrazable" runat="server" DataSourceID="odsTesoreriaOperadorTraeTrazable" AutoGenerateColumns="False" CssClass="table-cemmi" Width="60%" Font-Size="Small">
                        <Columns>
                            <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id" Visible="False">

                                <ItemTemplate>
                                    <asp:Label ID="id" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" Visible="False" />
                            <asp:BoundField DataField="orden" HeaderText="orden" SortExpression="orden" Visible="False" />
                            <asp:BoundField DataField="idPlancuenta" HeaderText="idPlancuenta" SortExpression="idPlancuenta" Visible="False" />
                            <asp:BoundField DataField="planCuentaCodigo" HeaderText="planCuentaCodigo" SortExpression="planCuentaCodigo" Visible="False" />
                            <asp:BoundField DataField="planCuentaDescripcion" HeaderText="Tipo valor" SortExpression="planCuentaDescripcion" >
                            <ItemStyle Width="40%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="idMoneda" HeaderText="idMoneda" SortExpression="idMoneda" Visible="False" />
                            <asp:BoundField DataField="monedaCodigo" HeaderText="Moneda" SortExpression="monedaCodigo" Visible="False" />
                            <asp:BoundField DataField="cotizacionValor" HeaderText="Cotizacion" SortExpression="cotizacionValor" Visible="False">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Monto" SortExpression="monto">
                                <ItemTemplate>
                                    <asp:TextBox ID="otxtValorMonto" runat="server" Text='<%# Bind("monto") %>'></asp:TextBox>
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Right" />

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sub Total " SortExpression="totalMonto">
                                <ItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("totalMonto") %>' Enabled="false"></asp:TextBox>
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Diferencia de cambio" SortExpression="diferenciaCambio" Visible="False">
                                <ItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("diferenciaCambio") %>' Enabled="false"></asp:TextBox>
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="trazable" SortExpression="trazable" Visible="False">

                                <ItemTemplate>
                                    <asp:Label ID="olblTrazable" runat="server" Text='<%# Bind("trazable") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Referencia" SortExpression="referencia">
                                <ItemTemplate>
                                    <asp:TextBox ID="otxtValorReferencia" runat="server" Text='<%# Bind("referencia") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fecha Valor" SortExpression="fechaValor">
                                <ItemTemplate>
                                    <asp:TextBox ID="otxtValorFecha" runat="server" Text='<%# Bind("fechaValor") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                </asp:Panel>





                <asp:Panel ID="PanelValoresIngresadosConforme" runat="server" Visible ="false" >

                    <div>
                    <asp:Label ID="Label5" runat="server" Text="Valores entregados"></asp:Label>
                </div>
                    <div>

                        <asp:SqlDataSource ID="odstesoreriaCobranzaOperadorTraeValores" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="tesoreriaCobranzaOperadorTraeValores" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idOperador" SessionField="idEmpresaOperador" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="ogvtesoreriaCobranzaOperadorTraeValores" runat="server" AutoGenerateColumns="False" DataSourceID="odstesoreriaCobranzaOperadorTraeValores" CssClass="table-cemmi">
                            <Columns>
                                <asp:BoundField DataField="planCuentaDescripcion" HeaderText="Valor" SortExpression="planCuentaDescripcion" />
                                <asp:BoundField DataField="monedaCodigo" HeaderText="Moneda" SortExpression="monedaCodigo" />
                                <asp:BoundField DataField="cotizacionValor" HeaderText="Cotización" SortExpression="cotizacionValor" DataFormatString="{0:c}" >
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="referencia" HeaderText="Referencia" SortExpression="referencia" />
                                <asp:BoundField DataField="monto" DataFormatString="{0:c}" HeaderText="Unidades nominales" SortExpression="monto">
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="totalMonto" HeaderText="Sub Total" SortExpression="totalMonto" DataFormatString="{0:c}" >
                                <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="fechaValor" DataFormatString="{0:d}" HeaderText="Fecha " SortExpression="fechaValor" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div>
                        <asp:Button ID="obutReingresaValores" runat="server" Text="Reingresa Valores" />
                    </div>
                </asp:Panel> 
            </asp:Panel>
        </div>

