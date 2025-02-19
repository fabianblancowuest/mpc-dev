<%@ Page Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="BARRIOLOTEGESTION.aspx.vb" Inherits="STRSYSTEM_Administracion_BARRIOLOTEGESTION" Title="GESTION DE LOTES EN BARRIOS" Culture="es-AR" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>


    <asp:Panel ID="PanelTitulo" runat="server">
        <div class="row">
            <h1>

                <asp:Label ID="olblBARRIOLOTETitulo" runat="server" Text="GESTION DE LOTES EN BARRIOS"></asp:Label>
            </h1>
        </div>
    </asp:Panel>

    <asp:Panel ID="Panel1" runat="server">

        <div class="row">

            <div class="">
                <asp:Label ID="Label1" runat="server" Text="SELECCIONE BARRIO:" CssClass="SS"></asp:Label>
                <asp:SqlDataSource ID="odsBARRIOOperador" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="BARRIOOPERADORSELECCIONA" SelectCommandType="StoredProcedure">
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
            <asp:SqlDataSource ID="odsbarrioManzanaTraer" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="barrioManzanaTraer" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="oddlBARRIOOperador" Name="idBarrio" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>


            <asp:DropDownList ID="oddlbarrioManzanaTraer" runat="server" AutoPostBack="True" DataSourceID="odsbarrioManzanaTraer" DataTextField="barrioManzanaDescripcion" DataValueField="barrioLoteManzanaCodigo"></asp:DropDownList>
        </div>


        <div>

            <asp:SqlDataSource ID="odsBARRIOLOTE" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                SelectCommand="BARRIOLOTETRAERIdManzana" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="oddlBARRIOOperador" Name="idBARRIO" PropertyName="SelectedValue" Type="Int16" />
                    <asp:ControlParameter ControlID="oddlbarrioManzanaTraer" Name="barrioLoteManzana" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div>
                <asp:GridView ID="ogvBARRIOLOTE" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="100" PagerStyle-CssClass="pgr"
                    DataKeyNames="IDBARRIOLOTE,IDBARRIO,BARRIOLOTEMANZANA,BARRIOLOTEPARCELA,BARRIOLOTEFRENTEMETROS,BARRIOLOTEFONDOMETROS,IDCOSTOREFERENCIA,BARRIOLOTEPRECIOREFERENCIA,BARRIOLOTEADHESIONREFERENCIA,BARRIOLOTEIMAGEN,BARRIOLOTEESTADO,BARRIOLOTEENVENTA,BARRIOLOTEBONIFICADO"
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
                    </Columns>
                    <PagerStyle CssClass="pgr" />
                </asp:GridView>

            </div>
        </div>
        <br />
        <br />



    </asp:Panel>


    <asp:Panel ID="PanelAlta" runat="server" Visible="false">
        <asp:Panel ID="PanelBarrioLote" runat="server" Enabled="false" ForeColor="Black">

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
                <div class="col-sm-2">
                    <asp:Label ID="olblBARRIOLOTEADHESIONREFERENCIA" runat="server" Text="ADHESION" CssClass="SS"></asp:Label>
                    <asp:TextBox ID="otxtBARRIOLOTEADHESIONREFERENCIA" runat="server" CssClass="SS" MaxLength="20" Width="80px"></asp:TextBox>
                </div>

            </div>

        </asp:Panel>

        <asp:Panel ID="PanelDatos01" runat="server">
            <asp:Label ID="Label2" runat="server" Text="Datos Varios"></asp:Label>
            <div class="row">
                <div class="col-sm-12">
                    <asp:Label ID="olblBARRIOLOTEIMAGEN" runat="server" Text="IMAGEN DEL LOTE:" CssClass="SS"></asp:Label>
                    <asp:TextBox ID="otxtBARRIOLOTEIMAGEN" runat="server" CssClass="SS" MaxLength="200" Visible="FALSE" Width="16px"></asp:TextBox>

                    <asp:Image ID="imgBARRIOLOTEIMAGEN" runat="server" Width="223px" Height="184px" ImageUrl="" />

                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <asp:Label ID="olblBARRIOLOTEESTADO" runat="server" Text="ESTADO DEL LOTE:" CssClass="SS"></asp:Label>
                        <asp:CheckBox ID="otxtBARRIOLOTEESTADO" runat="server" />
                    </div>
                    <div class="col-sm-3">
                        <asp:Label ID="olblBARRIOLOTEENVENTA" runat="server" Text="LOTE VENDIDO ?:" CssClass="SS"></asp:Label>
                        <asp:CheckBox ID="otxtBARRIOLOTEENVENTA" runat="server" />
                    </div>
                    <div class="col-sm-3">
                        <asp:Label ID="olblBARRIOLOTEBONIFICADO" runat="server" Text="LOTE BONIFICADO ?:" CssClass="SS"></asp:Label>
                        <asp:CheckBox ID="otxtBARRIOLOTEBONIFICADO" runat="server" />
                    </div>
                </div>
            > 




        </asp:Panel>

        <asp:Panel ID="PanelPropietario" runat="server" Visible="false">
            <asp:Label ID="Label3" runat="server" Text="Datos Propietario"></asp:Label>
            <div>

                <asp:SqlDataSource ID="odsBARRIOLOTEPROVEEDORTITULARIDAD" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="BARRIOLOTEPROVEEDORTITULARIDADTRAERID" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="olblIDBARRIOLOTE" Name="idBARRIOLOTE" PropertyName="Text" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div class="table-responsive">
                    <asp:GridView ID="ogvBARRIOLOTEPROVEEDORTITULARIDAD" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"
                        DataKeyNames="IDBARRIOLOTEPROVEEDORTITULARIDAD,IDBARRIOLOTE,IDPERSONA,BARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE,BARRIOLOTEPROVEEDORTITULARIDADEXPLICACION,BARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO,BARRIOLOTEPROVEEDORTITULARIDADESTADO"
                        DataSourceID="odsBARRIOLOTEPROVEEDORTITULARIDAD"
                        EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                        AllowSorting="True">
                        <AlternatingRowStyle CssClass="alt" />
                        <Columns>
                            <asp:CommandField SelectText="Seleccione" ShowSelectButton="True" />
                            <asp:BoundField DataField="IDBARRIOLOTEPROVEEDORTITULARIDAD" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="IDBARRIOLOTEPROVEEDORTITULARIDAD" Visible="False" />
                            <asp:BoundField DataField="personaCodigo" HeaderText="NRO DOCUMENTO" SortExpression="personaCodigo" />
                            <asp:BoundField DataField="personaDescripcion" HeaderText="APELLIDO Y NOMBRES" SortExpression="personaDescripcion" />
                            <asp:BoundField DataField="IDBARRIOLOTE" HeaderText="LOTE" InsertVisible="False" ReadOnly="True" SortExpression="IDBARRIOLOTE" Visible="False" />
                            <asp:BoundField DataField="IDPERSONA" HeaderText="PERSONA" InsertVisible="False" ReadOnly="True" SortExpression="IDPERSONA" Visible="False" />
                            <asp:BoundField DataField="BARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE" HeaderText="PORCENTAJE" SortExpression="BARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BARRIOLOTEPROVEEDORTITULARIDADEXPLICACION" HeaderText="EXPLICACION" SortExpression="BARRIOLOTEPROVEEDORTITULARIDADEXPLICACION" />
                            <asp:BoundField DataField="BARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO" HeaderText="IMAGEN DOCUMENTO" SortExpression="BARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO" />
                            <asp:TemplateField HeaderText="ESTADO" SortExpression="BARRIOLOTEPROVEEDORTITULARIDADESTADO">
                                <ItemTemplate>
                                    <asp:CheckBox ID="BARRIOLOTEPROVEEDORTITULARIDADESTADOBox" runat="server" Checked='<% # Bind("BARRIOLOTEPROVEEDORTITULARIDADESTADO")%>' Enabled="false" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pgr" />
                    </asp:GridView>

                </div>
            </div>
            <br />
            <br />

            <div class="row">
                <asp:Button ID="obutAltaPropietario" runat="server" Text="Nuevo Registro de propietario Lote" CssClass="btn btn-success" />

            </div>


        </asp:Panel>


        <asp:Panel ID="PanelComprador" runat="server" Visible="false">
            <asp:Label ID="Label4" runat="server" Text="Datos Comprador"></asp:Label>
            <asp:SqlDataSource ID="odsbarrioLoteVentaIdBarrioLote" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="barrioLoteVentaIdBarrioLote" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblIDBARRIOLOTE" Name="idBarrioLote" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataKeyNames="idBarrioLoteVenta" DataSourceID="odsbarrioLoteVentaIdBarrioLote">
                <Columns>
                    <asp:CommandField SelectText="&gt;&gt;&gt;&gt;&gt;" ShowSelectButton="True" />
                    <asp:BoundField DataField="idBarrioLoteVenta" HeaderText="idBarrioLoteVenta" InsertVisible="False" ReadOnly="True" SortExpression="idBarrioLoteVenta" Visible="False" />
                    <asp:BoundField DataField="idBarrioLote" HeaderText="idBarrioLote" SortExpression="idBarrioLote" Visible="False" />
                    <asp:BoundField DataField="idBarrioLoteVentaTipo" HeaderText="idBarrioLoteVentaTipo" SortExpression="idBarrioLoteVentaTipo" Visible="False" />
                    <asp:BoundField DataField="idActualizacionModo" HeaderText="idActualizacionModo" SortExpression="idActualizacionModo" Visible="False" />
                    <asp:BoundField DataField="barrioLoteVentaCuotaCantidad" HeaderText="Cantidad de Cuotas" SortExpression="barrioLoteVentaCuotaCantidad" />
                    <asp:BoundField DataField="barrioLoteVentaCuotaMontoReferencia" HeaderText="Monto Referencia" SortExpression="barrioLoteVentaCuotaMontoReferencia" />
                    <asp:BoundField DataField="barrioLoteVentaFechaAdhesion" DataFormatString="{0:d}" HeaderText="Fecha Adhesion" SortExpression="barrioLoteVentaFechaAdhesion" />
                    <asp:BoundField DataField="barrioLoteVentaFechaPrimerCuota" DataFormatString="{0:d}" HeaderText="Fecha Primer Cuota" SortExpression="barrioLoteVentaFechaPrimerCuota" />
                    <asp:BoundField DataField="idVendedor" HeaderText="idVendedor" SortExpression="idVendedor" Visible="False" />
                    <asp:BoundField DataField="idContactoTipo" HeaderText="idContactoTipo" SortExpression="idContactoTipo" Visible="False" />
                    <asp:BoundField DataField="idBarrioLoteVentaEstado" HeaderText="idBarrioLoteVentaEstado" SortExpression="idBarrioLoteVentaEstado" Visible="False" />
                    <asp:BoundField DataField="barrioLoteVentaTipoCodigo" HeaderText="Tipo Venta Codigo" SortExpression="barrioLoteVentaTipoCodigo" />
                    <asp:BoundField DataField="barrioLoteVentaTipoDescripcion" HeaderText="Tipo Venta Descripcion" SortExpression="barrioLoteVentaTipoDescripcion" />
                    <asp:BoundField DataField="actualizacionModoCodigo" HeaderText="Actualizacion Modo Codigo" SortExpression="actualizacionModoCodigo" />
                    <asp:BoundField DataField="actualizacionModoDescripcion" HeaderText="Actualizacion Modo Descripcion" SortExpression="actualizacionModoDescripcion" />
                    <asp:BoundField DataField="operadorCodigo" HeaderText="Vendedor Codigo" SortExpression="operadorCodigo" />
                    <asp:BoundField DataField="operadorDescripcion" HeaderText="Vendedor Descripcion" SortExpression="operadorDescripcion" />
                </Columns>
            </asp:GridView>

            <div>

                <asp:SqlDataSource ID="odsbarrioLoteVentaCompradorConsulta" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="barrioLoteVentaCompradorConsulta" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="olblIDBARRIOLOTE" Name="idBarrioLote" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:GridView ID="ogvbarrioLoteVentaCompradorConsulta" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsbarrioLoteVentaCompradorConsulta">
                    <Columns>
                        <asp:BoundField DataField="idBarrioLoteVentaComprador" HeaderText="idBarrioLoteVentaComprador" SortExpression="idBarrioLoteVentaComprador" Visible="False" />
                        <asp:BoundField DataField="barrioLoteVentaCompradorOrden" HeaderText="Orden" SortExpression="barrioLoteVentaCompradorOrden" />
                        <asp:BoundField DataField="idPersona" HeaderText="idPersona" SortExpression="idPersona" Visible="False" />
                        <asp:BoundField DataField="personaCodigo" HeaderText="DNI /CUIT" SortExpression="personaCodigo" />
                        <asp:BoundField DataField="personaDescripcion" HeaderText="COMPRADOR" ReadOnly="True" SortExpression="personaDescripcion" />
                    </Columns>
                </asp:GridView>

            </div>
        </asp:Panel>

        <asp:Panel ID="PanelComisionExtra" runat="server" Visible="false">
            <div>

                <asp:Label ID="Label6" runat="server" Text="Comision EXTRA para promocion de venta."></asp:Label>

            </div>

            <asp:SqlDataSource ID="odsBARRIOLOTECOMISIONEXTRA" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                SelectCommand="BARRIOLOTECOMISIONEXTRATRAERID" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblIDBARRIOLOTE" Name="idBARRIOLOTE" PropertyName="Text" Type="Int16" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="table-responsive">
                <asp:GridView ID="ogvBARRIOLOTECOMISIONEXTRA" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"
                    DataKeyNames="IDBARRIOLOTECOMISIONEXTRA,IDBARRIOLOTE,BARRIOLOTECOMISIONEXTRAEXPLICACION,BARRIOLOTECOMISIONEXTRAMONTO,FECHAVIGENCIADESDE,FECHAVIGENCIAHASTA"
                    DataSourceID="odsBARRIOLOTECOMISIONEXTRA"
                    EmptyDataText="No se registra comision extra asignada al lote seleccionado."
                    AllowSorting="True">
                    <AlternatingRowStyle CssClass="alt" />
                    <Columns>
                        <asp:CommandField SelectText="Seleccione" ShowSelectButton="True" />
                        <asp:BoundField DataField="IDBARRIOLOTECOMISIONEXTRA" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="IDBARRIOLOTECOMISIONEXTRA" Visible="False" />
                        <asp:BoundField DataField="IDBARRIOLOTE" HeaderText="Lote" InsertVisible="False" ReadOnly="True" SortExpression="IDBARRIOLOTE" Visible="False" />
                        <asp:BoundField DataField="BARRIOLOTECOMISIONEXTRAEXPLICACION" HeaderText="Explicacion" SortExpression="BARRIOLOTECOMISIONEXTRAEXPLICACION" />
                        <asp:BoundField DataField="BARRIOLOTECOMISIONEXTRAMONTO" DataFormatString="{0:c}" HeaderText="Monto de comision Adicional" SortExpression="BARRIOLOTECOMISIONEXTRAMONTO">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FECHAVIGENCIADESDE" DataFormatString="{0:d}" HeaderText="Vigente desde Fecha" SortExpression="FECHAVIGENCIADESDE" />
                        <asp:BoundField DataField="FECHAVIGENCIAHASTA" DataFormatString="{0:d}" HeaderText="Vigente hasta Fecha" SortExpression="FECHAVIGENCIAHASTA" />
                    </Columns>
                    <PagerStyle CssClass="pgr" />
                </asp:GridView>

            </div>
            <div class="row">
                <asp:Button ID="obutAltaBarrioLoteComisionExtra" runat="server" Text="Alta de Comision Extra" CssClass="btn btn-danger " />

            </div>

        </asp:Panel>

        <asp:Panel ID="PanelComisionExtraAlta" runat="server" Visible="false">
            <div class="form-group">
                <asp:Label ID="olblIDBARRIOLOTECOMISIONEXTRA" runat="server" Text="" Visible="false"></asp:Label>
            </div>
            <div class="form-group">
                <asp:Label ID="Label7" runat="server" Text="Lote:" CssClass="control-label"></asp:Label>
                <asp:SqlDataSource ID="odsBARRIOLOTEComisionExtra2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="BARRIOLOTECOMISIONEXTRATRAERODDL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:DropDownList ID="oddlBARRIOLOTEComisionExtra2" runat="server" DataSourceID="odsBARRIOLOTEComisionExtra"
                    DataTextField="barrioLoteComisionExtraExplicacion" DataValueField="IDBARRIOLOTECOMISIONEXTRA" CssClass="form-control">
                </asp:DropDownList>
            </div>


            <div class="form-group">
                <asp:Label ID="olblBARRIOLOTECOMISIONEXTRAEXPLICACION" runat="server" Text="Explicacion:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="otxtBARRIOLOTECOMISIONEXTRAEXPLICACION" runat="server" CssClass="form-control" TextMode="MultiLine" Height="500px"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="olblBARRIOLOTECOMISIONEXTRAMONTO" runat="server" Text="Monto de comision Adicional:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="otxtBARRIOLOTECOMISIONEXTRAMONTO" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="olblFECHAVIGENCIADESDE" runat="server" Text="Vigente desde Fecha:" CssClass="control-label"></asp:Label>
                <asp:CalendarExtender ID="oceFECHAVIGENCIADESDE" runat="server" TargetControlID="otxtFECHAVIGENCIADESDE" Format="dd/MM/yyyy" PopupPosition="BottomRight" PopupButtonID="obutFECHAVIGENCIADESDEPopup">
                </asp:CalendarExtender>
                <asp:TextBox ID="otxtFECHAVIGENCIADESDE" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:Button ID="obutFECHAVIGENCIADESDEPopup" runat="server" CssClass="obut-ocal-popup-button" />
            </div>
            <div class="form-group">
                <asp:Label ID="olblFECHAVIGENCIAHASTA" runat="server" Text="Vigente hasta Fecha:" CssClass="control-label"></asp:Label>
                <asp:CalendarExtender ID="oceFECHAVIGENCIAHASTA" runat="server" TargetControlID="otxtFECHAVIGENCIAHASTA" Format="dd/MM/yyyy" PopupPosition="BottomRight" PopupButtonID="obutFECHAVIGENCIAHASTAPopup">
                </asp:CalendarExtender>
                <asp:TextBox ID="otxtFECHAVIGENCIAHASTA" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:Button ID="obutFECHAVIGENCIAHASTAPopup" runat="server" CssClass="obut-ocal-popup-button" />
            </div>

            <div class="col-sm-offset-2 col-sm-10">

                <asp:Label ID="olblBarrioLoteComisionExtraSQLCodigo" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="olblBarrioLoteComisionExtraSQLDescripcion" runat="server" Text=""></asp:Label>
                <br />
                <asp:Button ID="obutBarrioLoteComisionExtraAltaConfirmada" runat="server" Text="Confirma Alta" CssClass="btn btn-success" />
                <asp:Button ID="obutBarrioLoteComisionExtraAltaAbandonada" runat="server" Text="Abandona Alta" CssClass="btn btn-danger" />
            </div>


        </asp:Panel>






        <div>


            <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
            <br />
            <asp:Button ID="obutVarios" runat="server" Text="Datos Varios" CssClass="btn btn-success" />
            <asp:Button ID="obutPropietario" runat="server" Text="Datos Propietario" CssClass="btn btn-success" />
            <asp:Button ID="obutComprador" runat="server" Text="Datos comprador" CssClass="btn btn-success" />
            <asp:Button ID="obutComisionExtra" runat="server" Text="Comisión extra " CssClass="btn  btn-success" />
        </div>
    </asp:Panel>


    <asp:Panel ID="PanelPropietarioAlta" runat="server" Visible="false">
        <div class="form">

            <div class="form-group">
                <asp:Label ID="olblIDBARRIOLOTEPROVEEDORTITULARIDAD" runat="server" Text="" Visible="false"></asp:Label>
            </div>

            <div class="form-group">

                <div class="form-group">
                    <asp:Label ID="olblIDPERSONA" runat="server" Text="PERSONA:" CssClass="control-label"></asp:Label>
                    <asp:SqlDataSource ID="odsPERSONA" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                        SelectCommand="PERSONATraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    <asp:DropDownList ID="oddlPERSONA" runat="server" DataSourceID="odsPERSONA"
                        DataTextField="PERSONADescripcion" DataValueField="IDPERSONA" CssClass="form-control">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label ID="olblBARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE" runat="server" Text="PORCENTAJE:" CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="otxtBARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="olblBARRIOLOTEPROVEEDORTITULARIDADEXPLICACION" runat="server" Text="EXPLICACION:" CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="otxtBARRIOLOTEPROVEEDORTITULARIDADEXPLICACION" runat="server" CssClass="form-control" TextMode="MultiLine" Height="500px"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="olblBARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO" runat="server" Text="MAGEN DOCUMENTONTO:" CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="otxtBARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO" runat="server" CssClass="form-control" TextMode="MultiLine" Height="500px"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="olblBARRIOLOTEPROVEEDORTITULARIDADESTADO" runat="server" Text="ESTADO:" CssClass="control-label"></asp:Label>
                    <asp:CheckBox ID="otxtBARRIOLOTEPROVEEDORTITULARIDADESTADO" runat="server" />
                </div>

                <div class="col-sm-offset-2 col-sm-10">

                    <asp:Label ID="olblPropietarioMensajeCodigo" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="olblPropietarioMensajeTexto" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirma Alta" CssClass="btn btn-success" />
                    <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandona Alta" CssClass="btn btn-danger" />
                </div>
            </div>
        </div>

    </asp:Panel>

</asp:Content>


