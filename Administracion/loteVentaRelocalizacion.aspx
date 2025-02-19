<%@ Page Title="Liberación de Lote Adherido" Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="loteVentaRelocalizacion.aspx.vb" Inherits="Administracion_loteVentaRelocalizacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="titulo-rol">
        <asp:Label ID="Label1" runat="server" Text="Relocalizacion de Lote" Font-Bold="true" Font-Size="Larger"></asp:Label>
    </h1>
    <!-- Selecciones -->
    <div class="lote-venta-liberacion-select">
        <asp:Panel ID="PanelUltimasRelocalizaciones" runat="server">
            <div>
                <asp:Label ID="Label11" runat="server" Text="Ultimas relocalizaciones" Visible="true"></asp:Label>
                <asp:Button ID="obutNuevaRelocalizacion" runat="server" Text="Nueva Relocalización" BackColor="Green" ForeColor="White" />
            </div>

            <div>
                <asp:SqlDataSource ID="odsloteVentaUltimasRelocalizaciones" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="loteVentaUltimasRelocalizaciones" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:GridView ID="ogvloteVentaUltimasRelocalizaciones" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsloteVentaUltimasRelocalizaciones" Font-Size="Small">
                    <Columns>
                        <asp:BoundField DataField="idLoteVentaRelocalizaOperador" HeaderText="id Relocaliza" InsertVisible="False" SortExpression="idLoteVentaRelocalizaOperador">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fechaOperacion" HeaderText="Fecha Operacion" SortExpression="fechaOperacion" />
                        <asp:BoundField DataField="operador" HeaderText="operador" SortExpression="operador" />
                        <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                        <asp:BoundField DataField="idLoteVenta" HeaderText="idLoteVenta" SortExpression="idLoteVenta" />
                        <asp:BoundField DataField="idBarrioLoteOrigen" HeaderText="idBarrioLoteOrigen" SortExpression="idBarrioLoteOrigen" />
                        <asp:BoundField DataField="idBarrioLoteDestino" HeaderText="idBarrioLoteDestino" SortExpression="idBarrioLoteDestino" />
                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>
        <asp:Panel ID="PanelNuevaRelocalizacion" runat="server" Visible="false">
            <div>
                <asp:Label ID="Label2" runat="server" Text="Seleccione Barrio"></asp:Label>

            </div>
            <div>
                <asp:Label ID="olblSeleccionBarrio" runat="server" Text=""></asp:Label>
            </div>
            <div>
                <asp:SqlDataSource ID="odsBarrioHabilitadoSelecciona" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="BARRIOTraerODDL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:DropDownList ID="oddlBarrioHabilitadoSelecciona" runat="server" AutoPostBack="True" DataSourceID="odsBarrioHabilitadoSelecciona" DataTextField="barrioDescripcion" DataValueField="idBarrio" Width="100%"></asp:DropDownList>
                <br />
                <br />

            </div>
            <asp:Panel ID="PanelOrigen" runat="server" Visible="false">
                <h4>
                    <asp:Label ID="Label6" runat="server" Text="ORIGEN - Venta a Relocalizar - Identifique Venta " Font-Bold="true"></asp:Label>
                </h4>
                <div>
                    <asp:Label ID="Label3" runat="server" Text="Seleccione Manzana"></asp:Label>
                </div>
                <div>
                    <asp:SqlDataSource ID="odsBarrioHabilitadoManzanaSelecciona" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="barrioHabilitadoManzanaSelecciona" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="oddlBarrioHabilitadoSelecciona" Name="idBarrio" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="oddlBarrioHabilitadoManzanaSelecciona" runat="server" AutoPostBack="True" DataSourceID="odsBarrioHabilitadoManzanaSelecciona" DataTextField="barrioManzanaDescripcion" DataValueField="idBarrioManzana" Width="100%"></asp:DropDownList>

                </div>
                <div>
                    <asp:Label ID="Label4" runat="server" Text="Seleccione Lote"></asp:Label>
                </div>
                <div>

                    <asp:SqlDataSource ID="odsBARRIOLOTEOperador" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                        SelectCommand="BARRIOMANZANALOTELIBERA" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                            <asp:ControlParameter ControlID="oddlBarrioHabilitadoSelecciona" PropertyName="SelectedValue" Name="idBarrio" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="oddlBarrioHabilitadoManzanaSelecciona" PropertyName="SelectedValue" Name="idBarrioManzana" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="oddlBARRIOLOTEOperador" runat="server" DataSourceID="odsBARRIOLOTEOPERADOR"
                        DataTextField="BARRIOLOTEDescripcion" DataValueField="idLoteVenta" CssClass="form-control" AutoPostBack="True">
                    </asp:DropDownList>



                </div>
                <div>
                    <asp:Label ID="Label5" runat="server" Text="Identificador de venta:"></asp:Label>
                    <asp:Label ID="olblIDLoteVenta" runat="server" Text="No seleccionada" Font-Bold="true"></asp:Label>
                </div>
            </asp:Panel>


            <asp:Panel ID="PanelDestino" runat="server" Visible="false">
                <h4>
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="DESTINO - Seleccione lote destino al que asignar la venta." Font-Bold="true"></asp:Label>
                </h4>

                <div>
                    <asp:Label ID="Label8" runat="server" Text="Seleccione Manzana"></asp:Label>
                </div>
                <div>
                    <asp:SqlDataSource ID="odsBarrioHabilitadoManzanaReubica" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="barrioHabilitadoManzanaSelecciona" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="oddlBarrioHabilitadoSelecciona" Name="idBarrio" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="oddlBarrioHabilitadoManzanaReubica" runat="server" AutoPostBack="True" DataSourceID="odsBarrioHabilitadoManzanaSelecciona" DataTextField="barrioManzanaDescripcion" DataValueField="idBarrioManzana" Width="100%"></asp:DropDownList>

                </div>
                <div>
                    <asp:Label ID="Label9" runat="server" Text="Seleccione Lote"></asp:Label>
                </div>
                <div>

                    <asp:SqlDataSource ID="odsbarrioManzanaLoteReubica" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                        SelectCommand="BARRIOMANZANALOTEREUBICA" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                            <asp:ControlParameter ControlID="oddlBarrioHabilitadoSelecciona" PropertyName="SelectedValue" Name="idBarrio" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="oddlBarrioHabilitadoManzanaReubica" PropertyName="SelectedValue" Name="idBarrioManzana" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="oddlBarrioManzanaLoteReubica" runat="server" DataSourceID="odsbarrioManzanaLoteReubica"
                        DataTextField="BARRIOLOTEDescripcion" DataValueField="idBarrioLote" CssClass="form-control" AutoPostBack="True">
                    </asp:DropDownList>


                    <br />
                    <br />
                    <div>
                        <asp:Label ID="Label10" runat="server" Text="Identificacion de Lote Destino:"></asp:Label>
                        <asp:Label ID="olblIdBarrioLoteDestino" runat="server" Text="" Font-Bold="true"></asp:Label>
                    </div>

                </div>


            </asp:Panel>




            <asp:Panel ID="PanelRelocalizacion" runat="server" Visible="false">
                <div>
                    <asp:Label ID="olblMensajePreRelocaliza" runat="server" Text="" Font-Bold="true"></asp:Label>
                </div>
                <br />
                <br />

                <div>
                    <asp:Button ID="obutRelocalizaVenta" runat="server" Text="Relocaliza Venta" BackColor="LightGreen" Font-Bold="true" ForeColor="Black" />

                    <asp:Button ID="obutRetorna" runat="server" Text="Retorna" BackColor="LightBlue" Font-Bold="true" ForeColor="Black" />
                </div>

                <div>
                    <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="true"></asp:Label>
                    <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
                </div>
            </asp:Panel>

        </asp:Panel>
    </div>
</asp:Content>

