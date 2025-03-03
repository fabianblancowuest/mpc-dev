<%@ Page Title="Llamadas a adherentes que estan pagando cuotas por barrio " Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="rptLoteVentaLlamada.aspx.vb" Inherits="Administracion_rptLoteVentaLlamada" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="PanelPanelSuperior" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Seleccione Barrio "></asp:Label>
        </div>


        <div>
            <asp:Label ID="Label2" runat="server" Text="Reporte de lotes por manzana en barrio"></asp:Label>
        </div>

        <div>
            <asp:SqlDataSource ID="LoteVentaBarrioRecibo" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select * from barrio where idBarrio in (select idBarrio from cuotaPagada ) 
order by barrioDescripcion "></asp:SqlDataSource>
            <asp:DropDownList ID="oddlLoteVentaBarrioRecibo" runat="server" AutoPostBack="True" DataSourceID="LoteVentaBarrioRecibo" DataTextField="barrioDescripcion" DataValueField="idBarrio"></asp:DropDownList>
        </div>

        <div>
            <asp:Label ID="Label5" runat="server" Text="Seleccione tipo de encuesta."></asp:Label>
        </div>
        <div>
            <asp:SqlDataSource ID="odsLoteVentaLlamada" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="LOTEVENTALLAMADATraeroddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:DropDownList ID="oddlLoteVentaLlamada" runat="server" AutoPostBack="True" DataSourceID="odsLoteVentaLlamada" DataTextField="loteVentaLlamadaDescripcion" DataValueField="idLoteVentaLlamada"></asp:DropDownList>

            <asp:Button ID="obutReporteActualiza" runat="server" Text="Actualizar ulimas novedades" BackColor="Green" ForeColor="White" />

            <asp:Button ID="obutReportePeriodo" runat="server" Text="Reporte por periodo" BackColor="Brown" ForeColor="White" />

        </div>






        <asp:Panel ID="PanelGestion" runat="server">
            <asp:Panel ID="PanelReporte" runat="server" Visible="true">
                <div>
                    <asp:SqlDataSource ID="odsrptloteVentaLlamada" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rptloteVentaLlamada" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="oddlLoteVentaBarrioRecibo" Name="idBarrio" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="oddlLoteVentaLlamada" Name="idLoteVentaPregunta" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="ogvrptloteVentaLlamada" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="odsrptloteVentaLlamada" Font-Size="X-Small" CssClass="table-cemmi" DataKeyNames="Manzana,parcela,cliente01Nombre,cliente01Domicilio,cliente01Telefono,cliente02Nombre,cliente02Domicilio,cliente02Telefono,idLoteVenta">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="idBarrio" HeaderText="idBarrio" SortExpression="idBarrio" Visible="False" />
                            <asp:BoundField DataField="Manzana" HeaderText="Manzana" ReadOnly="True" SortExpression="Manzana" />
                            <asp:BoundField DataField="parcela" HeaderText="parcela" ReadOnly="True" SortExpression="parcela" />
                            <asp:BoundField DataField="recibos" HeaderText="recibos" ReadOnly="True" SortExpression="recibos" />
                            <asp:BoundField DataField="GestionLlamada" HeaderText="Llamadas" SortExpression="GestionLlamada" />
                            <asp:BoundField DataField="MesesPagados" HeaderText="Meses Pagados" SortExpression="MesesPagados" />
                            <asp:BoundField DataField="MesesTranscurridos" HeaderText="Meses Transcurridos" SortExpression="MesesTranscurridos" />
                            <asp:BoundField DataField="desde" HeaderText="Fecha pago primer cuota" ReadOnly="True" SortExpression="desde" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="hasta" HeaderText="Fecha pago ultima cuota" ReadOnly="True" SortExpression="hasta" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="Diferencia1" HeaderText="Diferencia Meses entre pagos  vs. meses pagados" SortExpression="Diferencia1" />
                            <asp:BoundField DataField="difeTranscurridosPagados" HeaderText="Diferencia meses Transcurridos vs Pagados" SortExpression="difeTranscurridosPagados" />
                            <asp:BoundField DataField="idBarriolote" HeaderText="id lote" ReadOnly="True" SortExpression="idBarriolote" />
                            <asp:BoundField DataField="idLoteVenta" HeaderText="id Venta" InsertVisible="False" ReadOnly="True" SortExpression="idLoteVenta" />
                            <asp:BoundField DataField="idBarrioLote1" HeaderText="idBarrioLote1" SortExpression="idBarrioLote1" Visible="False" />
                            <asp:BoundField DataField="loteVentaCodigo" HeaderText="loteVentaCodigo" SortExpression="loteVentaCodigo" Visible="False" />
                            <asp:BoundField DataField="loteVentaDescripcion" HeaderText="loteVentaDescripcion" SortExpression="loteVentaDescripcion" Visible="False" />
                            <asp:BoundField DataField="idBarrio1" HeaderText="idBarrio1" SortExpression="idBarrio1" Visible="False" />
                            <asp:BoundField DataField="idVendedor" HeaderText="idVendedor" SortExpression="idVendedor" Visible="False" />
                            <asp:BoundField DataField="loteVentaFechaVisita" HeaderText="Fecha Visita" SortExpression="loteVentaFechaVisita" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="loteVentaAdhesionMonto" HeaderText="Adhesion" SortExpression="loteVentaAdhesionMonto" Visible="False" />
                            <asp:BoundField DataField="loteVentaCuotaMonto" HeaderText="Cuota Monto" SortExpression="loteVentaCuotaMonto" />
                            <asp:BoundField DataField="cliente01Nombre" HeaderText="cliente 1" SortExpression="cliente01Nombre" />
                            <asp:BoundField DataField="cliente01DNI" HeaderText="cliente 1DNI" SortExpression="cliente01DNI" />
                            <asp:BoundField DataField="cliente01Domicilio" HeaderText="cliente 1 Domicilio" SortExpression="cliente01Domicilio" />
                            <asp:BoundField DataField="cliente01Telefono" HeaderText="cliente  1 Telefono" SortExpression="cliente01Telefono" />
                            <asp:BoundField DataField="cliente02Nombre" HeaderText="cliente 2 Nombre" SortExpression="cliente02Nombre" />
                            <asp:BoundField DataField="cliente02DNI" HeaderText="cliente 2 DNI" SortExpression="cliente02DNI" />
                            <asp:BoundField DataField="cliente02Domicilio" HeaderText="cliente 2 Domicilio" SortExpression="cliente02Domicilio" />
                            <asp:BoundField DataField="cliente02Telefono" HeaderText="cliente 2 Telefono" SortExpression="cliente02Telefono" />
                            <asp:BoundField DataField="idClienteIVA" HeaderText="idClienteIVA" SortExpression="idClienteIVA" Visible="False" />
                            <asp:BoundField DataField="clienteCUIT" HeaderText="cliente 1 CUIT" SortExpression="clienteCUIT" />
                            <asp:BoundField DataField="idLoteDimension" HeaderText="idLoteDimension" SortExpression="idLoteDimension" Visible="False" />
                            <asp:BoundField DataField="idCuotasCantidad" HeaderText="idCuotasCantidad" SortExpression="idCuotasCantidad" />
                            <asp:BoundField DataField="idLoteTipo" HeaderText="idLoteTipo" SortExpression="idLoteTipo" />
                            <asp:BoundField DataField="loteVentafechaCancelacion" HeaderText="loteVentafechaCancelacion" SortExpression="loteVentafechaCancelacion" Visible="False" />
                            <asp:BoundField DataField="LOTEPRECIOBC" HeaderText="LOTE BC" SortExpression="LOTEPRECIOBC" />
                            <asp:BoundField DataField="CUOTABC" HeaderText="CUOTA BC" SortExpression="CUOTABC" />
                            <asp:BoundField DataField="idLoteEstado" HeaderText="idLoteEstado" SortExpression="idLoteEstado" />
                            <asp:BoundField DataField="idBarrioLote01" HeaderText="idBarrioLote01" SortExpression="idBarrioLote01" />
                        </Columns>
                    </asp:GridView>
                </div>


            </asp:Panel>
            <asp:Panel ID="PanelRegistroLlamada" runat="server" Visible="false">
                <div>
                    <asp:Label ID="Label31" runat="server" Text="Lote Seleccionado:"></asp:Label>
                    <asp:Label ID="olblIdLoteVenta" runat="server" Text="" Font-Bold="true" ForeColor="Green"></asp:Label>
                    <asp:Label ID="olblLoteSeleccionado" runat="server" Text="" Font-Bold="true" ForeColor="Blue"></asp:Label>

                    <asp:Button ID="obutVolverAlReporte" runat="server" Height="61px" Text="Volver al Reporte" />

                </div>
                <div>
                    <asp:Label ID="Label41" runat="server" Text="Datos del / los compradores "></asp:Label>
                </div>
                <div>
                    <asp:Label ID="olblClienteNombres" runat="server" Text="" Font-Bold="true" ForeColor="Blue"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="Label61" runat="server" Text="Domicilio del / los compradores "></asp:Label>
                </div>
                <div>
                    <asp:Label ID="olblClienteDomicilio" runat="server" Text="" Font-Bold="true" ForeColor="Blue"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="Label71" runat="server" Text="Teléfonos del / los compradores."></asp:Label>
                </div>
                <div>
                    <asp:Label ID="olblClienteTelefonos" runat="server" Text="" Font-Bold="true" ForeColor="Blue"></asp:Label>
                </div>


                <div>
                    <asp:Label ID="Label81" runat="server" Text="Llamadas realizadas"></asp:Label>
                </div>
                <div>
                    <asp:SqlDataSource ID="odsLoteVentaLlamadaRealizadas" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="loteVentaLlamadaIDLoteVenta" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="olblIdLoteVenta" Name="idLoteVenta" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="ogvLlamadasRegistradas" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsLoteVentaLlamadaRealizadas" EmptyDataText="No se han registrado llamadas hasta el momento." Font-Size="Small">
                        <Columns>
                            <asp:BoundField DataField="idLoteVentaLlamadaGestion" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="idLoteVentaLlamadaGestion" />
                            <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" Visible="False" />
                            <asp:BoundField DataField="idLoteVenta" HeaderText="idLoteVenta" SortExpression="idLoteVenta" Visible="False" />
                            <asp:BoundField DataField="idLoteVentaLlamadaTipo" HeaderText="idLoteVentaLlamadaTipo" SortExpression="idLoteVentaLlamadaTipo" Visible="False" />
                            <asp:BoundField DataField="loteVentaLlamadaFecha" HeaderText="Fecha" SortExpression="loteVentaLlamadaFecha" />
                            <asp:BoundField DataField="loteVentaLLamadaTipoDescripcion" HeaderText="Tipo" SortExpression="loteVentaLLamadaTipoDescripcion" />
                            <asp:BoundField DataField="loteVentaLlamadaComentario" HeaderText="Comentario" SortExpression="loteVentaLlamadaComentario" />
                            <asp:BoundField DataField="operador" HeaderText="Operador" SortExpression="operador" />
                        </Columns>
                    </asp:GridView>
                </div>

                <div>
                    <asp:Button ID="obutNovedad" runat="server" Text="Asentar nueva llamada" />
                </div>
            </asp:Panel>
            <asp:Panel ID="PanelAlta" runat="server" Visible="false">
                <form class="form" role="form">

                    <div class="form-group">
                        <asp:Label ID="olblIDLOTEVENTALLAMADAGESTION" runat="server" Text="" Visible="false"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDOPERADOR" runat="server" Text="Operador:" CssClass="control-label"></asp:Label>
                        <asp:SqlDataSource ID="odsOPERADOR" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                            SelectCommand="OPERADORTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:DropDownList ID="oddlOPERADOR" runat="server" DataSourceID="odsOPERADOR"
                            DataTextField="OPERADORDescripcion" DataValueField="IDOPERADOR" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDLOTEVENTALLAMADATIPO" runat="server" Text="Tipificacion de llamada:" CssClass="control-label"></asp:Label>
                        <asp:SqlDataSource ID="odsLOTEVENTALLAMADATIPO" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                            SelectCommand="LOTEVENTALLAMADATIPOTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:DropDownList ID="oddlLOTEVENTALLAMADATIPO" runat="server" DataSourceID="odsLOTEVENTALLAMADATIPO"
                            DataTextField="LOTEVENTALLAMADATIPODescripcion" DataValueField="IDLOTEVENTALLAMADATIPO" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblLOTEVENTALLAMADAFECHA" runat="server" Text="Fecha:" CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtLOTEVENTALLAMADAFECHA" runat="server" CssClass="form-control" MaxLength="4"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblLOTEVENTALLAMADACOMENTARIO" runat="server" Text="Comentario del operador.:" CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtLOTEVENTALLAMADACOMENTARIO" runat="server" CssClass="form-control" MaxLength="0"></asp:TextBox>
                    </div>

                    <div class="col-sm-offset-2 col-sm-10">

                        <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirma Alta" CssClass="btn btn-success" />
                        <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandona Alta" CssClass="btn btn-danger" />
                    </div>
                </form>




            </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="PanelReportePeriodo" runat="server" Visible="false">
            <div>
                <asp:Label ID="Label9" runat="server" Text="Reporte de llamadas."></asp:Label>
            </div>


            <div>
                <asp:Label ID="Label10" runat="server" Text="Ingrese período a procesar" CssClass="subtitulo-rol"></asp:Label>
                <asp:SqlDataSource ID="odsCalendario" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select id, cONVERT(nvarchar(30),fecha , 102) fecha from calendario order by fecha desc"></asp:SqlDataSource>
            </div>

            <div class="seleccion-fechas-sp">
                <asp:Label ID="Label11" runat="server" Text="Desde Fecha :" Width="20%"></asp:Label>
                <asp:TextBox ID="otxtFechaDesde" runat="server" Visible="false"></asp:TextBox>
                <asp:DropDownList ID="oddlFechaDesde" runat="server" AutoPostBack="True" DataSourceID="odsCalendario" DataTextField="fecha" DataValueField="id"></asp:DropDownList>
                <asp:Label ID="Label12" runat="server" Text="Hasta Fecha" Width="20%"></asp:Label>
                <asp:TextBox ID="otxtFechaHasta" runat="server" Visible="false"></asp:TextBox>
                <asp:DropDownList ID="oddlFechaHasta" runat="server" AutoPostBack="True" DataSourceID="odsCalendario" DataTextField="fecha" DataValueField="id"></asp:DropDownList>
            </div>
            <div style="text-align: center;">
                <asp:Button ID="obutReporte" runat="server" Text="Generar Reporte" CssClass="btn-basic btn-success" />
                <asp:Button ID="obutReporteRetorna" runat="server" Text="Retorna" CssClass="btn-basic btn-success" />


            </div>
            <div>
                <asp:SqlDataSource ID="odsLoteVentaLlamadaOperador" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rptloteVentaLlamadaGestion" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="session_idOperador" Type="Int32" />
                        <asp:ControlParameter ControlID="oddlLoteVentaLlamada" Name="idLoteVentaLlamada" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="oddlFechaDesde" DbType="Date" Name="fechaDesde" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="oddlFechaHasta" DbType="Date" Name="fechaHasta" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <div>
                <asp:Label ID="olblMensajeActualizaDatos" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>

            <div>
                <asp:Label ID="Label13" runat="server" Text="Gestion Global en periodo " CssClass="table-cemmi"></asp:Label>
                <br />
                <asp:SqlDataSource ID="odsGlobal" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select count(*) as clientesContactados , sum(lvg.registros) llamadas from tblloteVentaLlamadaGestion lvg where idOperador = @idOperador 
">
                    <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="session_idOperador" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="ogvGlobal" runat="server" AutoGenerateColumns="False" DataSourceID="odsGlobal" CssClass="table-cemmi">
                    <Columns>
                        <asp:BoundField DataField="clientesContactados" HeaderText="Clientes Contactados" SortExpression="clientesContactados" />
                        <asp:BoundField DataField="llamadas" HeaderText="Llamadas" SortExpression="llamadas" />
                    </Columns>
                </asp:GridView>

            </div>

            <div>
                <br />
                <asp:Label ID="Label14" runat="server" Text="Getion en periodo por barrio"></asp:Label>
                <br />
                <asp:SqlDataSource ID="odsGlobalBarrio" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select lvg.Barrio ,count(*) as clientesContactados , sum(lvg.registros) llamadas from tblloteVentaLlamadaGestion lvg  where idOperador = @idOperador  group by barrio 
order by lvg.barrio 
">
                    <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="session_idOperador" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="ogvGlobalBarrio" runat="server" AutoGenerateColumns="False" DataSourceID="odsGlobalBarrio" CssClass="table-cemmi">
                    <Columns>
                        <asp:BoundField DataField="Barrio" HeaderText="Barrio" SortExpression="Barrio" />
                        <asp:BoundField DataField="clientesContactados" HeaderText="Clientes Contactados" SortExpression="clientesContactados" />
                        <asp:BoundField DataField="llamadas" HeaderText="Llamadas" SortExpression="llamadas" />
                    </Columns>
                </asp:GridView>
            </div>
            <div>
                <br />
                <asp:Label ID="Label15" runat="server" Text="Por Barrio y tipo de novedad "></asp:Label>
                <asp:SqlDataSource ID="odsGlobalBarrioNovedad" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select lvg.Barrio , lvg.loteVentaLLamadaTipoDescripcion , count(*) as clientesContactados , sum(lvg.registros) llamadas from tblloteVentaLlamadaGestion  lvg  
where idOperador = @idOperador 
group by lvg.barrio , lvg.loteVentaLLamadaTipoDescripcion
order by lvg.barrio , lvg.loteVentaLLamadaTipoDescripcion">
                    <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="session_idOperador" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:GridView ID="ogvGlobalBarrioNovedad" runat="server" AutoGenerateColumns="False" DataSourceID="odsGlobalBarrioNovedad" CssClass="table-cemmi">
                    <Columns>
                        <asp:BoundField DataField="Barrio" HeaderText="Barrio" SortExpression="Barrio" />
                        <asp:BoundField DataField="loteVentaLLamadaTipoDescripcion" HeaderText="Tipo de llamada" SortExpression="loteVentaLLamadaTipoDescripcion" />
                        <asp:BoundField DataField="clientesContactados" HeaderText="Clientes Contactados" SortExpression="clientesContactados" />
                        <asp:BoundField DataField="llamadas" HeaderText="Llamadas" SortExpression="llamadas" />
                    </Columns>
                </asp:GridView>


            </div>


        </asp:Panel>
    </asp:Panel>
    <asp:Panel ID="PanelInferior" runat="server" Visible="true">
        <asp:Panel ID="PanelLlamadasPorLote" runat="server">
            <div>
                <asp:Label ID="Label16" runat="server" Text="Detalle por lote."></asp:Label>
                 <asp:Button ID="obutReporteVolver" runat="server" Text="Volver a reporte general" />
            </div>
            <div>
                <asp:SqlDataSource ID="odsLlamadaDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select * from   tblloteVentaLlamadaGestion  where idOperador = @idOperador
order by Barrio,Manzana , barrioLoteParcela ">
                    <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="session_idOperador" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="ogvLlamadaDetalle" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataKeyNames="idLoteventa,Barrio,Manzana,barrioLoteParcela,cliente,telefono,registros,loteVentaLLamadaTipoDescripcion" DataSourceID="odsLlamadaDetalle" Font-Size="Small">
                    <Columns>
                        <asp:CommandField SelectText="Ver Detalle" ShowSelectButton="True" />
                        <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" Visible="False" />
                        <asp:BoundField DataField="idLoteventa" HeaderText="id Lote venta" SortExpression="idLoteventa" />
                        <asp:BoundField DataField="registros" HeaderText="Llamadas" SortExpression="registros" />
                        <asp:BoundField DataField="cliente" HeaderText="Cliente" SortExpression="cliente" />
                        <asp:BoundField DataField="telefono" HeaderText="Telefono" SortExpression="telefono" />
                        <asp:BoundField DataField="primerContacto" HeaderText="Primer Contacto" SortExpression="primerContacto" />
                        <asp:BoundField DataField="Barrio" HeaderText="Barrio" SortExpression="Barrio" />
                        <asp:BoundField DataField="Manzana" HeaderText="Manzana" SortExpression="Manzana" />
                        <asp:BoundField DataField="barrioLoteParcela" HeaderText="Lote" SortExpression="barrioLoteParcela" />
                        <asp:BoundField DataField="idLoteVentaLlamadaTipo" HeaderText="idLoteVentaLlamadaTipo" SortExpression="idLoteVentaLlamadaTipo" Visible="False" />
                        <asp:BoundField DataField="loteVentaLLamadaTipoDescripcion" HeaderText="Ultimo estado" SortExpression="loteVentaLLamadaTipoDescripcion" />
                    </Columns>
                </asp:GridView>
            </div>



        </asp:Panel>
        <asp:Panel ID="PanelConsultaDesdeReporte" runat="server" Visible="true">
            <div>
                <asp:Label ID="Label17" runat="server" Text="Listado de acciones por lote desde reporte."></asp:Label>
            </div>
           
            <div>
                <asp:Label ID="olblDescripcionConsulta" runat="server" Text="" Font-Bold="true"></asp:Label>
            </div>
            <div>
                <div>
                    <asp:Label ID="Label3" runat="server" Text="Lote Seleccionado:"></asp:Label>
                    <asp:Label ID="olblReporteIdLoteVenta" runat="server" Text="" Font-Bold="true" ForeColor="Green"></asp:Label>
                    <asp:Label ID="olblReporteLoteSeleccionado" runat="server" Text="" Font-Bold="true" ForeColor="Blue"></asp:Label>

                    <asp:Button ID="obutReporteVolverAlReporte" runat="server" Height="61px" Text="Volver al Reporte" />

                </div>
                <div>
                    <asp:Label ID="Label4" runat="server" Text="Datos del / los compradores "></asp:Label>
                </div>
                <div>
                    <asp:Label ID="olblReporteClienteNombres" runat="server" Text="" Font-Bold="true" ForeColor="Blue"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="Label6" runat="server" Text="Domicilio del / los compradores "></asp:Label>
                </div>
                <div>
                    <asp:Label ID="olblReporteClienteDomicilio" runat="server" Text="" Font-Bold="true" ForeColor="Blue"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="Label7" runat="server" Text="Teléfonos del / los compradores."></asp:Label>
                </div>
                <div>
                    <asp:Label ID="olblReporteClienteTelefonos" runat="server" Text="" Font-Bold="true" ForeColor="Blue"></asp:Label>
                </div>


                <div>
                    <asp:Label ID="Label8" runat="server" Text="Llamadas realizadas"></asp:Label>
                </div>
                <div>
                    <asp:SqlDataSource ID="odsReporteLoteVentaLlamadaRealizadas" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="loteVentaLlamadaIDLoteVenta" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="olblReporteIdLoteVenta" Name="idLoteVenta" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="ogvReporteLlamadasRegistradas" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsReporteLoteVentaLlamadaRealizadas" EmptyDataText="No se han registrado llamadas hasta el momento." Font-Size="Small">
                        <Columns>
                            <asp:BoundField DataField="idLoteVentaLlamadaGestion" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="idLoteVentaLlamadaGestion" />
                            <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" Visible="False" />
                            <asp:BoundField DataField="idLoteVenta" HeaderText="idLoteVenta" SortExpression="idLoteVenta" Visible="False" />
                            <asp:BoundField DataField="idLoteVentaLlamadaTipo" HeaderText="idLoteVentaLlamadaTipo" SortExpression="idLoteVentaLlamadaTipo" Visible="False" />
                            <asp:BoundField DataField="loteVentaLlamadaFecha" HeaderText="Fecha" SortExpression="loteVentaLlamadaFecha" />
                            <asp:BoundField DataField="loteVentaLLamadaTipoDescripcion" HeaderText="Tipo" SortExpression="loteVentaLLamadaTipoDescripcion" />
                            <asp:BoundField DataField="loteVentaLlamadaComentario" HeaderText="Comentario" SortExpression="loteVentaLlamadaComentario" />
                            <asp:BoundField DataField="operador" HeaderText="Operador" SortExpression="operador" />
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </asp:Panel>
    </asp:Panel>
</asp:Content>

