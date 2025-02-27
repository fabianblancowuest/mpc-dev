<%@ Page Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/master/p.master"
    AutoEventWireup="false" CodeFile="loteVentaNovedad.aspx.vb" Inherits="STRSYSTEM_Administracion_loteVentaNovedad"
    Title="Tratamiento de Novedades de LOTES EN BARRIOS" Culture="es-AR" %>

    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
        <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        </asp:Content>
        <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
                EnableScriptLocalization="true"></asp:ScriptManager>


            <asp:Panel ID="PanelTitulo" runat="server">
                <h1 class="titulo-rol">
                    <asp:Label ID="olblBARRIOLOTETitulo" runat="server" Text="NOVEDADES DE LOTES EN BARRIOS">
                    </asp:Label>
                </h1>
            </asp:Panel>

            <asp:Panel ID="Panel1" runat="server">


                <div class="contenedor-busqueda">
                    <asp:Label ID="Label1" runat="server" Text="SELECCIONE BARRIO:" CssClass="control-label">
                    </asp:Label>
                    <asp:SqlDataSource ID="odsBARRIOOperador" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="BARRIOOPERADORSELECCIONA"
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="oddlBARRIOOperador" runat="server" DataSourceID="odsBARRIOOPERADOR"
                        DataTextField="BARRIODescripcion" DataValueField="idBARRIO" CssClass="input"
                        AutoPostBack="True">
                    </asp:DropDownList>

                    <asp:Label ID="Label3" runat="server" Text="SELECCIONE MANZANA:" CssClass="control-label">
                    </asp:Label>
                    <asp:SqlDataSource ID="odsBARRIOMANZANAOPERADOR" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                        SelectCommand="BARRIOMANZANAOPERADORSELECCIONA" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                            <asp:ControlParameter ControlID="oddlBARRIOOperador" Name="idBarrio"
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="oddlBarrioManzanaOperador" runat="server"
                        DataSourceID="odsBARRIOMANZANAOPERADOR" DataTextField="barrioManzanaCodigo"
                        DataValueField="idBarrioManzana" CssClass="input" AutoPostBack="True">
                    </asp:DropDownList>
                </div>

                <asp:SqlDataSource ID="odsBARRIOLOTE" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="BARRIOMANZANALOTETRAERIDCONNOVEDADES" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="oddlBarrioManzanaOperador" Name="idBarrioManzana"
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div class="contenedor-responsive">
                    <asp:GridView ID="ogvBARRIOLOTE" runat="server" AutoGenerateColumns="False"
                        CssClass="table-cemmi fuente-mas-chica" AlternatingRowStyle-CssClass="alt" AllowPaging="True"
                        PageSize="45" PagerStyle-CssClass="pgr"
                        DataKeyNames="IDBARRIOLOTE,IDBARRIO,IDBARRIOMANZANA,BARRIOLOTEPARCELA,BARRIOLOTEFRENTEMETROS,BARRIOLOTELADOIZQUIERDOMETROS,BARRIOLOTEFONDOMETROS,BARRIOLOTELADODERECHOMETROS,BARRIOLOTESUPERFICIE,IDORIENTACION,SECUENCIA,IDLOTETIPO,IDCOSTOREFERENCIA,BARRIOLOTEPRECIOREFERENCIABC,BARRIOLOTEADHESIONREFERENCIA,BARRIOLOTEESTADO,BARRIOLOTEENVENTA,BARRIOLOTEBONIFICADO,PARCELACATASTRAL,idLoteVenta"
                        DataSourceID="odsBARRIOLOTE"
                        EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                        AllowSorting="True">
                        <AlternatingRowStyle CssClass="alt" />
                        <Columns>
                            <asp:CommandField SelectText="Seleccione" ShowSelectButton="True" />
                            <asp:BoundField DataField="IDBARRIOLOTE" HeaderText="id Lote" InsertVisible="False"
                                ReadOnly="True" SortExpression="IDBARRIOLOTE" />
                            <asp:BoundField DataField="IDBARRIO" HeaderText="BARRIO" InsertVisible="False"
                                ReadOnly="True" SortExpression="IDBARRIO" Visible="False" />
                            <asp:BoundField DataField="IDBARRIOMANZANA" HeaderText="MANZANA" InsertVisible="False"
                                ReadOnly="True" SortExpression="IDBARRIOMANZANA" Visible="False" />
                            <asp:BoundField DataField="BARRIOLOTEPARCELA" HeaderText="PARCELA"
                                SortExpression="BARRIOLOTEPARCELA">
                                <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MOVIMIENTOS" HeaderText="MOVIMIENTOS"
                                SortExpression="MOVIMIENTOS">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BARRIOLOTEFRENTEMETROS" HeaderText="FTE (M)"
                                SortExpression="BARRIOLOTEFRENTEMETROS" Visible="False">
                            </asp:BoundField>
                            <asp:BoundField DataField="BARRIOLOTELADOIZQUIERDOMETROS" HeaderText="LIZQ (M)"
                                SortExpression="BARRIOLOTELADOIZQUIERDOMETROS" Visible="False">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BARRIOLOTEFONDOMETROS" HeaderText="FDO (M)"
                                SortExpression="BARRIOLOTEFONDOMETROS" Visible="False">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BARRIOLOTELADODERECHOMETROS" HeaderText="LDER (M)"
                                SortExpression="BARRIOLOTELADODERECHOMETROS" Visible="False">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BARRIOLOTESUPERFICIE" HeaderText="SUP (M2)"
                                SortExpression="BARRIOLOTESUPERFICIE">
                                <ItemStyle HorizontalAlign="Center" Wrap="True" />
                            </asp:BoundField>
                            <asp:BoundField DataField="loteTipoDescripcion" HeaderText="Tipo de Lote"
                                SortExpression="loteTipoDescripcion" />
                            <asp:TemplateField HeaderText="ORIENTACION" InsertVisible="False"
                                SortExpression="IDORIENTACION" Visible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("IDORIENTACION") %>'>
                                    </asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <%--<asp:Label ID="Label1" runat="server" Text='<%# Bind("IDORIENTACION") %>'>
                                        </asp:Label>--%>
                                        <asp:DropDownList ID="oddlOrientacionLote" runat="server"
                                            DataSourceID="odsORIENTACION" DataTextField="orientacionDescripcion"
                                            DataValueField="idOrientacion" SelectedValue='<%# Bind("IDORIENTACION") %>'
                                            Enabled="false">
                                        </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="SECUENCIA" HeaderText="SECUENCIA (En sentido horario)"
                                SortExpression="SECUENCIA" Visible="False">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="TIPO DE LOTE" InsertVisible="False"
                                SortExpression="IDLOTETIPO" Visible="False">
                                <ItemTemplate>
                                    <%-- <asp:Label ID="Label2" runat="server" Text='<%# Eval("IDLOTETIPO") %>'>
                                        </asp:Label>--%>
                                        <asp:DropDownList ID="oddlLoteTipo" runat="server" DataSourceID="odsLoteTipo"
                                            DataTextField="loteTipoDescripcion" DataValueField="idLoteTipo"
                                            SelectedValue='<%# Bind("IDLOTETIPO") %>' Enabled="false">
                                        </asp:DropDownList>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:BoundField DataField="IDCOSTOREFERENCIA" HeaderText="COSTO DE REFERENCIA"
                                InsertVisible="False" ReadOnly="True" SortExpression="IDCOSTOREFERENCIA"
                                Visible="False" />
                            <asp:BoundField DataField="BARRIOLOTEPRECIOREFERENCIABC" HeaderText="PRECIO TOTAL EN BC"
                                SortExpression="BARRIOLOTEPRECIOREFERENCIABC">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BARRIOLOTEADHESIONREFERENCIA"
                                HeaderText="MONTO ADHESION EN PESOS" SortExpression="BARRIOLOTEADHESIONREFERENCIA"
                                DataFormatString="{0:c}">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="ESTADO DEL LOTE" SortExpression="BARRIOLOTEESTADO"
                                Visible="False">
                                <ItemTemplate>
                                    <asp:CheckBox ID="BARRIOLOTEESTADOBox" runat="server"
                                        Checked='<% # Bind("BARRIOLOTEESTADO")%>' Enabled="false" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="LOTE VENDIDO ?" SortExpression="BARRIOLOTEENVENTA"
                                Visible="False">
                                <ItemTemplate>
                                    <asp:CheckBox ID="BARRIOLOTEENVENTABox" runat="server"
                                        Checked='<% # Bind("BARRIOLOTEENVENTA")%>' Enabled="false" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="LOTE BONIFICADO ?" SortExpression="BARRIOLOTEBONIFICADO"
                                Visible="False">
                                <ItemTemplate>
                                    <asp:CheckBox ID="BARRIOLOTEBONIFICADOBox" runat="server"
                                        Checked='<% # Bind("BARRIOLOTEBONIFICADO")%>' Enabled="false" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="PARCELACATASTRAL" HeaderText="NOMENCLATURA CATASTRAL"
                                SortExpression="PARCELACATASTRAL" Visible="False" />
                            <asp:BoundField DataField="idLoteVenta" HeaderText="id Venta" InsertVisible="False"
                                SortExpression="idLoteVenta" />
                            <asp:BoundField DataField="cliente01Nombre" HeaderText="CLIENTE"
                                SortExpression="cliente01Nombre">
                                <ItemStyle Font-Size="X-Small" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cliente01DNI" HeaderText=" DNI" SortExpression="cliente01DNI" />
                            <asp:BoundField DataField="loteVentaFechaVisita" DataFormatString="{0:d}"
                                HeaderText=" Fecha Visita" SortExpression="loteVentaFechaVisita">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="loteVentafechaCancelacion" DataFormatString="{0:d}"
                                HeaderText="Fecha Cancelacion" SortExpression="loteVentafechaCancelacion">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                        <PagerStyle CssClass="pgr" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="odsBarrioManzanaResumen" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                        SelectCommand="BARRIOLOTEMANZANAESTADOADHESION" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="oddlBarrioManzanaOperador" Name="idBarrioManzana"
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="ogvBarrioManzanaResumen" runat="server" AutoGenerateColumns="False"
                        CssClass="table-cemmi fuente-mediana" DataSourceID="odsBarrioManzanaResumen">
                        <Columns>
                            <asp:BoundField DataField="TotalLotes" HeaderText="Total Lotes" ReadOnly="True"
                                SortExpression="TotalLotes">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TotalAdhesiones" HeaderText="Total Adhesiones" ReadOnly="True"
                                SortExpression="TotalAdhesiones">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TotalLibres" HeaderText="Total Libres" ReadOnly="True"
                                SortExpression="TotalLibres">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
                </div>
                <br />
                <br />




            </asp:Panel>


            <asp:Panel ID="PanelAlta" runat="server" Visible="false">
                <form class="form" role="form">

                    <div class="form-group">
                        <asp:Label ID="olblIDBARRIOLOTE" runat="server" Text="" Visible="false"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDBARRIO" runat="server" Text="BARRIO:" CssClass="control-label"></asp:Label>
                        <asp:SqlDataSource ID="odsBARRIO" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                            SelectCommand="BARRIOOPERADORSELECCIONA" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="oddlBARRIO" runat="server" DataSourceID="odsBARRIO"
                            DataTextField="BARRIODescripcion" DataValueField="IDBARRIO" CssClass="form-control"
                            AutoPostBack="true">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDBARRIOMANZANA" runat="server" Text="MANZANA:" CssClass="control-label">
                        </asp:Label>
                        <asp:SqlDataSource ID="odsBARRIOMANZANA" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                            SelectCommand="BARRIOMANZANAOPERADORSELECCIONA" SelectCommandType="StoredProcedure">

                            <SelectParameters>
                                <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                                <asp:ControlParameter ControlID="oddlBARRIO" Name="idBarrio"
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>

                        </asp:SqlDataSource>
                        <asp:DropDownList ID="oddlBARRIOMANZANA" runat="server" DataSourceID="odsBARRIOMANZANA"
                            DataTextField="BARRIOMANZANADescripcion" DataValueField="IDBARRIOMANZANA"
                            CssClass="form-control" AutoPostBack="true">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOLOTEPARCELA" runat="server" Text="PARCELA:" CssClass="control-label">
                        </asp:Label>
                        <asp:TextBox ID="otxtBARRIOLOTEPARCELA" runat="server" CssClass="form-control" MaxLength="50">
                        </asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOLOTEFRENTEMETROS" runat="server" Text="FRENTE EN METROS:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtBARRIOLOTEFRENTEMETROS" runat="server" CssClass="form-control"
                            MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOLOTELADOIZQUIERDOMETROS" runat="server"
                            Text="LADO IZQUIERDO EN METROS:" CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtBARRIOLOTELADOIZQUIERDOMETROS" runat="server" CssClass="form-control"
                            MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOLOTEFONDOMETROS" runat="server" Text="FONDO EN METROS:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtBARRIOLOTEFONDOMETROS" runat="server" CssClass="form-control"
                            MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOLOTELADODERECHOMETROS" runat="server" Text="LADO DERECHO EN METROS:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtBARRIOLOTELADODERECHOMETROS" runat="server" CssClass="form-control"
                            MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOLOTESUPERFICIE" runat="server" Text="SUPERFICIE EN METROS CUADRADOS:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtBARRIOLOTESUPERFICIE" runat="server" CssClass="form-control"
                            MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDORIENTACION" runat="server" Text="ORIENTACION EN CAR�TULA:"
                            CssClass="control-label"></asp:Label>
                        <asp:SqlDataSource ID="odsORIENTACION" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="ORIENTACIONTraerOddl"
                            SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:DropDownList ID="oddlORIENTACION" runat="server" DataSourceID="odsORIENTACION"
                            DataTextField="ORIENTACIONDescripcion" DataValueField="IDORIENTACION"
                            CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblSECUENCIA" runat="server" Text="SECUENCIA EN CAR�TULA (En sentido horario):"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtSECUENCIA" runat="server" CssClass="form-control" MaxLength="4">
                        </asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDLOTETIPO" runat="server" Text="TIPO DE LOTE:" CssClass="control-label">
                        </asp:Label>
                        <asp:SqlDataSource ID="odsLOTETIPO" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="LOTETIPOTraerOddl"
                            SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:DropDownList ID="oddlLOTETIPO" runat="server" DataSourceID="odsLOTETIPO"
                            DataTextField="LOTETIPODescripcion" DataValueField="IDLOTETIPO" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDCOSTOREFERENCIA" runat="server" Text="COSTO DE REFERENCIA:"
                            CssClass="control-label"></asp:Label>
                        <asp:SqlDataSource ID="odsCOSTOREFERENCIA" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                            SelectCommand="COSTOREFERENCIATraerOddl" SelectCommandType="StoredProcedure">
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="oddlCOSTOREFERENCIA" runat="server" DataSourceID="odsCOSTOREFERENCIA"
                            DataTextField="COSTOREFERENCIADescripcion" DataValueField="IDCOSTOREFERENCIA"
                            CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOLOTEPRECIOREFERENCIABC" runat="server" Text="PRECIO TOTAL EN BC:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtBARRIOLOTEPRECIOREFERENCIABC" runat="server" CssClass="form-control"
                            MaxLength="20"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOLOTEADHESIONREFERENCIA" runat="server" Text="MONTO ADHESION EN PESOS:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtBARRIOLOTEADHESIONREFERENCIA" runat="server" CssClass="form-control"
                            MaxLength="20"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOLOTEESTADO" runat="server" Text="ESTADO DEL LOTE:"
                            CssClass="control-label"></asp:Label>
                        <asp:CheckBox ID="otxtBARRIOLOTEESTADO" runat="server" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOLOTEENVENTA" runat="server" Text="LOTE VENDIDO ?:"
                            CssClass="control-label"></asp:Label>
                        <asp:CheckBox ID="otxtBARRIOLOTEENVENTA" runat="server" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOLOTEBONIFICADO" runat="server" Text="LOTE BONIFICADO ?:"
                            CssClass="control-label"></asp:Label>
                        <asp:CheckBox ID="otxtBARRIOLOTEBONIFICADO" runat="server" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblPARCELACATASTRAL" runat="server" Text="NOMENCLATURA CATASTRAL:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtPARCELACATASTRAL" runat="server" CssClass="form-control" MaxLength="20">
                        </asp:TextBox>
                    </div>

                    <div class="col-sm-offset-2 col-sm-10">

                        <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirma Alta"
                            CssClass="btn btn-success" />
                        <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandona Alta"
                            CssClass="btn btn-danger" />
                    </div>
                </form>




            </asp:Panel>

            <asp:Panel ID="PanelGrlla" runat="server" Visible="false">
                <div>
                    <asp:Label ID="olblIdLoteVenta" runat="server" Text="" Visible="true"></asp:Label>
                </div>

                <div>
                    <asp:Button ID="obutGrabarEstado" runat="server" Text="Actualizar" />
                    <asp:Button ID="obutVolver" runat="server" Text="Volver" />

                </div>
                <div>
                    <asp:Button ID="obutActualizaYVuelve" runat="server" Text="Actualizar y volver"
                        BackColor="LightGreen" />
                </div>
                <div>
                    <asp:Label ID="olblValidacionMensajeError" runat="server" Text=""></asp:Label>
                </div>
                <asp:SqlDataSource ID="odsLoteVentaEstado" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="loteVentaEstadoLote"
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="olblIdLoteVenta" Name="idLoteVenta" PropertyName="Text"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="ogvloteVentaEstado" runat="server" AutoGenerateColumns="False"
                    DataSourceID="odsLoteVentaEstado" CssClass="table-cemmi" Font-Size="Small" Width="60%">
                    <Columns>
                        <asp:CommandField SelectText="MOVIMIENTOS" ShowSelectButton="True" />
                        <asp:TemplateField HeaderText="idLoteVentaEstado" InsertVisible="False"
                            SortExpression="idLoteVentaEstado" Visible="False">

                            <ItemTemplate>
                                <asp:Label ID="idLoteVentaEstado" runat="server"
                                    Text='<%# Bind("idLoteVentaEstado") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="idloteVenta" HeaderText="idloteVenta" SortExpression="idloteVenta"
                            Visible="False" />
                        <asp:BoundField DataField="barrioLoteVentaEstadoCodigo" HeaderText="Codigo"
                            SortExpression="barrioLoteVentaEstadoCodigo">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="barrioLoteVentaEstadoDescripcion" HeaderText="Estado "
                            SortExpression="barrioLoteVentaEstadoDescripcion" />
                        <asp:TemplateField HeaderText="idBarrioLoteVentaEstado" SortExpression="idBarrioLoteVentaEstado"
                            Visible="False">

                            <ItemTemplate>
                                <asp:Label ID="idBarrioLoteVentaEstado" runat="server"
                                    Text='<%# Bind("idBarrioLoteVentaEstado") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="loteVentaEstado" SortExpression="loteVentaEstado">
                            <ItemTemplate>
                                <asp:CheckBox ID="ochLoteVentaEstado" runat="server"
                                    Checked='<%# Bind("loteVentaEstado") %>' />
                            </ItemTemplate>

                            <ItemStyle HorizontalAlign="Center" />

                        </asp:TemplateField>
                        <asp:BoundField DataField="fum" HeaderText="Fecha Ult. Mod." SortExpression="fum" />
                        <asp:BoundField DataField="operadorDescripcion" HeaderText="Ultimo Operador"
                            SortExpression="operadorDescripcion" />
                    </Columns>
                </asp:GridView>
            </asp:Panel>
        </asp:Content>