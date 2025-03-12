<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="BARRIOMANZANALOTE.aspx.vb"
    Inherits="STRSYSTEM_Administracion_BARRIOMANZANALOTE" Title="Tratamiento Tabla LOTES EN BARRIOS" Culture="es-AR" %>

    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
        <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
            <link rel="stylesheet" type="text/css" href="barrioManzanaLote.css">
            <script src="barrioManzanaLote.js" defer></script>
        </asp:Content>
        <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
                EnableScriptLocalization="true"></asp:ScriptManager>


            <asp:Panel ID="PanelTitulo" runat="server">
                <div class="row">
                    <h1 class="titulo-rol">
                        <asp:Label ID="olblBARRIOLOTETitulo" runat="server" Text="LOTES EN BARRIOS"></asp:Label>
                    </h1>
                </div>
            </asp:Panel>

            <asp:Panel ID="Panel1" runat="server">

                <div class="row contenedor-flexible margenes-y">

                    <div class="caja-busqueda">
                        <asp:Label ID="Label1" runat="server" Text="SELECCIONE BARRIO:" CssClass="control-label">
                        </asp:Label>
                        <asp:SqlDataSource ID="odsBARRIOOperador" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                            SelectCommand="BARRIOOPERADORSELECCIONA" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <div class="barrio-mz">BARRIO</div>
                        <asp:DropDownList ID="oddlBARRIOOperador" runat="server" DataSourceID="odsBARRIOOPERADOR"
                            DataTextField="BARRIODescripcion" DataValueField="idBARRIO" AutoPostBack="True">
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
                        <div class="barrio-mz">MANZANA</div>
                        <asp:DropDownList ID="oddlBarrioManzanaOperador" runat="server"
                            DataSourceID="odsBARRIOMANZANAOPERADOR" DataTextField="barrioManzanaCodigo"
                            DataValueField="idBarrioManzana" AutoPostBack="True">
                        </asp:DropDownList>
                    </div>

                </div>


                <div>
                    <asp:SqlDataSource ID="odsBARRIOLOTE" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="BARRIOMANZANALOTETRAERId"
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="oddlBarrioManzanaOperador" Name="idBarrioManzana"
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="table-responsive tabla-barrio-manzana" id="tabla-barrio-manzana">
                        <!-- Botones de tabla -->
                        <!-- <button class="btn btn-light margenes-y text-center mx-auto d-block" id="btn-expandir">Expandir contenido</button> -->

                        <asp:GridView ID="ogvBARRIOLOTE" runat="server" AutoGenerateColumns="False"
                            CssClass="table-cemmi fuente-mas-chica" AlternatingRowStyle-CssClass="alt" PageSize="100"
                            PagerStyle-CssClass="pgr"
                            DataKeyNames="IDBARRIOLOTE,IDBARRIO,IDBARRIOMANZANA,BARRIOLOTEPARCELA,BARRIOLOTEFRENTEMETROS,BARRIOLOTELADOIZQUIERDOMETROS,BARRIOLOTEFONDOMETROS,BARRIOLOTELADODERECHOMETROS,BARRIOLOTESUPERFICIE,IDORIENTACION,SECUENCIA,IDLOTETIPO,IDCOSTOREFERENCIA,BARRIOLOTEPRECIOREFERENCIABC,BARRIOLOTEADHESIONREFERENCIA,BARRIOLOTEESTADO,BARRIOLOTEENVENTA,BARRIOLOTEBONIFICADO,PARCELACATASTRAL"
                            DataSourceID="odsBARRIOLOTE"
                            EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                            AllowSorting="True">
                            <AlternatingRowStyle CssClass="alt fila-barrio-mz-lote" />
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
                                <asp:BoundField DataField="BARRIOLOTEFRENTEMETROS" HeaderText="FTE (M)"
                                    SortExpression="BARRIOLOTEFRENTEMETROS">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="BARRIOLOTELADOIZQUIERDOMETROS" HeaderText="LIZQ (M)"
                                    SortExpression="BARRIOLOTELADOIZQUIERDOMETROS">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="BARRIOLOTEFONDOMETROS" HeaderText="FDO (M)"
                                    SortExpression="BARRIOLOTEFONDOMETROS">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="BARRIOLOTELADODERECHOMETROS" HeaderText="LDER (M)"
                                    SortExpression="BARRIOLOTELADODERECHOMETROS">
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
                                                DataValueField="idOrientacion"
                                                SelectedValue='<%# Bind("IDORIENTACION") %>' Enabled="false">
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
                                            <asp:DropDownList ID="oddlLoteTipo" runat="server"
                                                DataSourceID="odsLoteTipo" DataTextField="loteTipoDescripcion"
                                                DataValueField="idLoteTipo" SelectedValue='<%# Bind("IDLOTETIPO") %>'
                                                Enabled="false">
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
                                <asp:BoundField DataField="cliente01DNI" HeaderText=" DNI"
                                    SortExpression="cliente01DNI" />
                                <asp:BoundField DataField="loteVentaFechaVisita" DataFormatString="{0:d}"
                                    HeaderText=" Fecha Visita" SortExpression="loteVentaFechaVisita">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="loteVentafechaCancelacion" DataFormatString="{0:d}"
                                    HeaderText="Fecha Cancelacion" SortExpression="loteVentafechaCancelacion">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vendedor" HeaderText="Vendedor" SortExpression="vendedor">
                                    <ItemStyle Font-Size="XX-Small" />
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

                    </div>
                    <asp:GridView ID="ogvBarrioManzanaResumen" runat="server" AutoGenerateColumns="False"
                        CssClass="table-cemmi barrio-mz-lote-resultados" DataSourceID="odsBarrioManzanaResumen"
                        Width="100%">
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

                <div class="row">
                    <asp:Button ID="obutAlta" runat="server" Text="Nuevo Registro"
                        CssClass="btn-basic btn btn-success no-print" />

                </div>

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
                            CssClass="control-label ancho-imp"></asp:Label>
                        <asp:TextBox ID="otxtBARRIOLOTEPRECIOREFERENCIABC" runat="server" CssClass="form-control"
                            MaxLength="20"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOLOTEADHESIONREFERENCIA" runat="server" Text="MONTO ADHESIÓN EN PESOS:"
                            CssClass="control-label ancho-imp"></asp:Label>
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

                    <div class="margenes-y">
                        <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="olblGestionDescripcion" runat="server" Text="" CssClass="d-block text-center">
                        </asp:Label>
                    </div>
                    <div class="contenedor-flexible">
                        <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirma Alta"
                            CssClass="btn btn-success btn-basic btn-inline" />
                        <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandona Alta"
                            CssClass="btn btn-danger btn-basic btn-inline" />
                    </div>
                </form>
                <div>
                    <button class="btn-basic btn btn-primary btn-imprimir" id="btn-imprimir">Imprimir <i
                            class="bi bi-printer-fill"></i></button>
                </div>
            </asp:Panel>



            <script>
                document.addEventListener("DOMContentLoaded", () => {

                    const tabla = document.querySelector("#tabla-barrio-manzana table");
                    const columnas = tabla.querySelectorAll("td");
                    const columnasTh = tabla.querySelectorAll("th");
                    console.log(tabla)
                    console.log("Columnas", columnasTh)

                    document.getElementById("btn-expandir").addEventListener("click", (event) => {

                        event.preventDefault();
                        for (let i = 0; i < columnas.length; i++) {
                            // columnasTh[i].classList.toggle("espaciar");
                            columnas[i].classList.toggle("espaciar");
                            columnasTh[i].classList.toggle("espaciar");
                            // columnas[i].style.maxWidth = "fit-content";
                            columnasTh[i].style.maxWidth = "fit-content";
                            columnas[i].style.overflow = "visible";
                        }
                    })
                })
            </script>

        </asp:Content>