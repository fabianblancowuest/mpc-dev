<%@ Page Title="Menu venta Lote" MaintainScrollPositionOnPostback="true" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="vendedorVentaLote.aspx.vb" Inherits="sitioWEB_vendedorVentaLote" %>

<%@ Register Src="~/sitioWEB/tesoreriaCobranza.ascx" TagPrefix="uc1" TagName="tesoreriaCobranza" %>
<%@ Register Src="~/sitioWEB/barrioLoteComprador.ascx" TagPrefix="uc1" TagName="barrioLoteComprador" %>
<%@ Register Src="~/sitioWEB/barrioLoteRecibo.ascx" TagPrefix="uc1" TagName="barrioLoteRecibo" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="olblLoadMensaje" runat="server" Text=""></asp:Label>
    <asp:Panel ID="PanelInicio" runat="server">
        <asp:Label ID="olblGestionDescripcion" runat="server" Text=" "></asp:Label>
        <div class="row">

            <div class="">
                <asp:Label ID="Label1" runat="server" Text="SELECCIONE BARRIO:" CssClass="SS"></asp:Label>
                <asp:SqlDataSource ID="odsBARRIOOperador" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="BARRIOOPERADORSELECCIONASINCOMPRADOR" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>


                <asp:DropDownList ID="oddlBARRIOOperador" runat="server" DataSourceID="odsBARRIOOPERADOR"
                    DataTextField="BARRIODescripcion" DataValueField="idBARRIO" CssClass="SS" AutoPostBack="True">
                </asp:DropDownList>
            </div>
        </div>

        <div>
            <asp:Label ID="Label5" runat="server" Text="Seleccione Manzana:"></asp:Label>
            <asp:SqlDataSource ID="odsbarrioManzanaTraer" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="barrioManzanaTraerSINCOMPRADOR" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="oddlBARRIOOperador" Name="idBarrio" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>


            <asp:DropDownList ID="oddlbarrioManzanaTraer" runat="server" AutoPostBack="True" DataSourceID="odsbarrioManzanaTraer" DataTextField="barrioManzanaDescripcion" DataValueField="barrioLoteManzanaCodigo"></asp:DropDownList>
        </div>


        <div>

            <asp:SqlDataSource ID="odsBARRIOLOTE" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                SelectCommand="BARRIOLOTETRAERIdManzanaSinComprador" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="oddlBARRIOOperador" Name="idBARRIO" PropertyName="SelectedValue" Type="Int16" />
                    <asp:ControlParameter ControlID="oddlbarrioManzanaTraer" Name="barrioLoteManzana" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div>
                <asp:GridView ID="ogvBARRIOLOTE" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="100" PagerStyle-CssClass="pgr"
                    DataKeyNames="IDBARRIOLOTE,IDBARRIO,BARRIOLOTEMANZANA,BARRIOLOTEPARCELA,BARRIOLOTEFRENTEMETROS,BARRIOLOTEFONDOMETROS,IDCOSTOREFERENCIA,BARRIOLOTEPRECIOREFERENCIA,BARRIOLOTEADHESIONREFERENCIA,BARRIOLOTEIMAGEN,BARRIOLOTEESTADO,BARRIOLOTEENVENTA,BARRIOLOTEBONIFICADO,idActualizacionModo,actualizacionModoCantidadMeses,actualizacionModoDescripcion"
                    DataSourceID="odsBARRIOLOTE"
                    EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                    AllowSorting="True" Font-Size="Small">
                    <AlternatingRowStyle CssClass="alt" />
                    <Columns>
                        <asp:CommandField SelectText="GESTION LOTE" ShowSelectButton="True" />
                        <asp:BoundField DataField="IDBARRIOLOTE" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="IDBARRIOLOTE" Visible="False" />
                        <asp:BoundField DataField="IDBARRIO" HeaderText="BARRIO" InsertVisible="False" ReadOnly="True" SortExpression="IDBARRIO" Visible="False" />
                        <asp:BoundField DataField="BARRIOLOTEMANZANA" HeaderText="MANZANA" SortExpression="BARRIOLOTEMANZANA" />
                        <asp:BoundField DataField="BARRIOLOTEPARCELA" HeaderText="PARCELA" SortExpression="BARRIOLOTEPARCELA" />
                        <asp:BoundField DataField="BARRIOLOTEFRENTEMETROS" HeaderText="FRENTE EN METROS" SortExpression="BARRIOLOTEFRENTEMETROS">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="BARRIOLOTEFONDOMETROS" HeaderText="FONDO EN METROS" SortExpression="BARRIOLOTEFONDOMETROS">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IDCOSTOREFERENCIA" HeaderText="COSTO DE REFERENCIA" InsertVisible="False" ReadOnly="True" SortExpression="IDCOSTOREFERENCIA" Visible="False" />
                        <asp:BoundField DataField="BARRIOLOTEPRECIOREFERENCIA" HeaderText="MONTO PRECIO DE REFERENCIA EN UNIDADES" SortExpression="BARRIOLOTEPRECIOREFERENCIA">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="BARRIOLOTEADHESIONREFERENCIA" HeaderText="MONTO ADHESION DE REFERENCIA EN UNIDADES" SortExpression="BARRIOLOTEADHESIONREFERENCIA">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="BARRIOLOTEIMAGEN" HeaderText="IMAGEN DEL LOTE" SortExpression="BARRIOLOTEIMAGEN" Visible="False" />
                        <asp:TemplateField HeaderText="ESTADO DEL LOTE" SortExpression="BARRIOLOTEESTADO">
                            <ItemTemplate>
                                <asp:CheckBox ID="BARRIOLOTEESTADOBox" runat="server" Checked='<% # Bind("BARRIOLOTEESTADO")%>' Enabled="false" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LOTE VENDIDO ?" SortExpression="BARRIOLOTEENVENTA">
                            <ItemTemplate>
                                <asp:CheckBox ID="BARRIOLOTEENVENTABox" runat="server" Checked='<% # Bind("BARRIOLOTEENVENTA")%>' Enabled="false" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LOTE BONIFICADO ?" SortExpression="BARRIOLOTEBONIFICADO">
                            <ItemTemplate>
                                <asp:CheckBox ID="BARRIOLOTEBONIFICADOBox" runat="server" Checked='<% # Bind("BARRIOLOTEBONIFICADO")%>' Enabled="false" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="costoReferenciaCodigo" HeaderText="Referencia" SortExpression="costoReferenciaCodigo" />
                        <asp:BoundField DataField="costoReferenciaDescripcion" HeaderText="Referencia de costo" SortExpression="costoReferenciaDescripcion" />
                        <asp:BoundField DataField="idActualizacionModo" HeaderText="idActualizacionModo" SortExpression="idActualizacionModo" Visible="False" />
                        <asp:BoundField DataField="actualizacionModoCantidadMeses" HeaderText="actualizacionModoCantidadMeses" SortExpression="actualizacionModoCantidadMeses" Visible="False" />
                        <asp:BoundField DataField="actualizacionModoDescripcion" HeaderText="actualizacionModoDescripcion" SortExpression="actualizacionModoDescripcion" Visible="False" />
                    </Columns>
                    <PagerStyle CssClass="pgr" />
                </asp:GridView>

            </div>
        </div>
        <br />
        <br />



    </asp:Panel>

    <asp:Panel ID="PanelBarrioLote" runat="server" Visible="false" ForeColor="Black">

        <div class="">
            <asp:Label ID="olblIDBARRIOLOTE" runat="server" Text="" Visible="false"></asp:Label>
        </div>
        <div class="">
            <asp:Label ID="olblIDBARRIO" runat="server" Text="BARRIO:" CssClass="SS"></asp:Label>
            <asp:SqlDataSource ID="odsBARRIO" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                SelectCommand="BARRIOTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:DropDownList ID="oddlBARRIO" runat="server" DataSourceID="odsBARRIO"
                DataTextField="BARRIODescripcion" DataValueField="IDBARRIO" CssClass="SS">
            </asp:DropDownList>
        </div>
        <div class="row">

            <div class="col-sm-2" style="background-color: aqua;">
                <asp:Label ID="olblBARRIOLOTEMANZANA" runat="server" Text="MANZANA:" CssClass="SS"></asp:Label>
                <asp:TextBox ID="otxtBARRIOLOTEMANZANA" runat="server" CssClass="ss" MaxLength="10" Width="50px"></asp:TextBox>
            </div>
            <div class="col-sm-2" style="background-color: lightpink;">
                <asp:Label ID="olblBARRIOLOTEPARCELA" runat="server" Text="PARCELA:" CssClass="SS"></asp:Label>
                <asp:TextBox ID="otxtBARRIOLOTEPARCELA" runat="server" CssClass="SS" MaxLength="10" Width="50px"></asp:TextBox>
            </div>
            <div class="col-sm-2" style="background-color: aqua;">
                <asp:Label ID="olblBARRIOLOTEFRENTEMETROS" runat="server" Text="FRENTE:" CssClass="SS"></asp:Label>
                <asp:TextBox ID="otxtBARRIOLOTEFRENTEMETROS" runat="server" CssClass="SS" MaxLength="10" Width="50px"></asp:TextBox>
            </div>
            <div class="col-sm-2" style="background-color: lightpink;">
                <asp:Label ID="olblBARRIOLOTEFONDOMETROS" runat="server" Text="FONDO" CssClass="SS"></asp:Label>
                <asp:TextBox ID="otxtBARRIOLOTEFONDOMETROS" runat="server" CssClass="SS" MaxLength="10" Width="50px"></asp:TextBox>
            </div>

        </div>
        <div class="row">
            <div class="col-sm-4">
                <asp:Label ID="olblIDCOSTOREFERENCIA" runat="server" Text="REFERENCIA:" CssClass="SS"></asp:Label>


                <asp:SqlDataSource ID="odsCOSTOREFERENCIA" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="COSTOREFERENCIATraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                <asp:DropDownList ID="oddlCOSTOREFERENCIA" runat="server" DataSourceID="odsCOSTOREFERENCIA"
                    DataTextField="COSTOREFERENCIADescripcion" DataValueField="IDCOSTOREFERENCIA" CssClass="SS">
                </asp:DropDownList>
            </div>
            <div class="col-sm-2" style="align-content: center; background-color: yellow">
                <asp:Label ID="olblBARRIOLOTEPRECIOREFERENCIA" runat="server" Text="PRECIO" CssClass="SS"></asp:Label>
                <asp:TextBox ID="otxtBARRIOLOTEPRECIOREFERENCIA" runat="server" CssClass="SS" MaxLength="20" Width="80px"></asp:TextBox>
            </div>


        </div>

        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="PERIODO DE ACTUALIZACION DEL BARRIO:" CssClass="control-label"></asp:Label>
            <asp:SqlDataSource ID="odsACTUALIZACIONMODO" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                SelectCommand="ACTUALIZACIONMODOTRAERODDL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:DropDownList ID="oddlACTUALIZACIONMODO" runat="server" DataSourceID="odsACTUALIZACIONMODO" Enabled="false"
                DataTextField="ACTUALIZACIONMODODescripcion" DataValueField="idACTUALIZACIONMODO" CssClass="form-control" AutoPostBack="True">
            </asp:DropDownList>
        </div>
    </asp:Panel>

    <asp:Panel ID="PanelBarrioLoteComprador" runat="server" Visible="false">
        <div>
            <asp:Button ID="obutCompradorCargar" runat="server" Text="Cargar compradores" CssClass="btn-success" />
            <asp:Label ID="olblCompradorEstadoCarga" runat="server" Text=""></asp:Label>
        </div>
        <uc1:barrioLoteComprador runat="server" ID="barrioLoteComprador" Visible="false" />

    </asp:Panel>
    <asp:Panel ID="PanelVentaBarrioLote" runat="server" Visible="false">


        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="SELECCIONE COSTO de REFERENCIA:" CssClass="control-label"></asp:Label>
            <asp:SqlDataSource ID="odsCOSTOREFERENCIAOperador" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                SelectCommand="COSTOREFERENCIAOPERADORSELECCIONA" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="oddlCOSTOREFERENCIAOperador" runat="server" DataSourceID="odsCOSTOREFERENCIAOPERADOR"
                DataTextField="COSTOREFERENCIADescripcion" DataValueField="idCOSTOREFERENCIA" CssClass="form-control" AutoPostBack="True">
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="SELECCIONE CANTIDAD DE CUOTAS:" CssClass="control-label"></asp:Label>
            <asp:SqlDataSource ID="odsventaCuotaCantidad" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                SelectCommand="ventaCuotaCantidad" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="otxtBARRIOLOTEPRECIOREFERENCIA" Name="costoBC" PropertyName="Text" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="oddlventaCuotaCantidad" runat="server" DataSourceID="odsventaCuotaCantidad"
                DataTextField="cuotaDescripcion" DataValueField="cuotaNumero" CssClass="form-control" AutoPostBack="True">
            </asp:DropDownList>
        </div>
        <div>
        </div>
        <div>
            <asp:Label ID="olblBARRIOLOTEADHESIONREFERENCIA" runat="server" Text="MONTO CORRESPONDIENTE A LA ADHESION" CssClass="SS" Width="60%"></asp:Label>
            <asp:TextBox ID="otxtBARRIOLOTEADHESIONREFERENCIA" runat="server" CssClass="SS" Enabled="false" MaxLength="20" Width="80px"></asp:TextBox>
        </div>
        <div>
            <uc1:barrioLoteRecibo runat="server" ID="barrioLoteRecibo" />
        </div>
        <div> 
            <asp:Label ID="Label8" runat="server" Text="Total de Pagos a cuenta de adhesion:" Width="60%"></asp:Label>
            <asp:TextBox ID="otxtBarrioLoteAdhesionPagoACuenta" runat="server" Text="0" Width="80px" Enabled ="false"></asp:TextBox>
        </div>
        <div>

            <asp:Label ID="Label7" runat="server" Text="MONTO SEÑA A CUENTA ADHESION:" CssClass="SS" Width="60%"></asp:Label>
            <asp:TextBox ID="otxtMontoACuentaAdhesion" runat="server" CssClass="SS" MaxLength="20" Width="80px" Text="0"></asp:TextBox>
            <asp:Button ID="obutCobrar" runat="server" Text="Cobrar (Ingresar efectivo / valores)" CssClass="btn-success" />
            <asp:Button ID="obutValorReingreso" runat="server" Text="Reingresar Monto Seña" CssClass="btn-warning" Visible="False" />


        </div>

        <div>
            <asp:Label ID="Label6" runat="server" Text="MONTO SALDO ADHESION:"  CssClass="SS" Width="60%"></asp:Label>
            <asp:TextBox ID="otxtAdhesionSaldo" runat="server" CssClass="SS" MaxLength="20" Width="80px" Text ="0" Enabled="false"></asp:TextBox>
        </div>

        <div>
            <uc1:tesoreriaCobranza runat="server" ID="tesoreriaCobranza" Visible="false" />

        </div>
        <div>
            <asp:Button ID="obutBarrioLoteAdhesionConfirma" runat="server" Text="CONFIRMA ADHESION" Height="100px" Font-Bold="true" Visible="false" CssClass="btn-success" />
            <asp:Button ID="obutBarrioLoteVolver" runat="server" Text="ABANDONA OPERACION" Height="100px" Font-Bold="true" CssClass="btn-danger" />

        </div>


    </asp:Panel>
</asp:Content>

