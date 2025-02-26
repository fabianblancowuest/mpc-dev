<%@ Page Title="Llamadas a adherentes que estan pagando cuotas por barrio " Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="rptLoteVentaLlamada.aspx.vb" Inherits="Administracion_rptLoteVentaLlamada" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
        
           <asp:Button ID="obutReporteActualiza" runat="server" Text="Actualizar ulimas novedades" BackColor="Green" ForeColor ="White" />
        
           </div>







     <asp:Panel ID="PanelReporte" runat="server" Visible ="true" >
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

      <asp:Panel ID="PanelRegistroLlamada" runat="server" Visible ="false">
        <div>
            <asp:Label ID="Label3" runat="server" Text="Lote Seleccionado:"></asp:Label>
            <asp:Label ID="olblIdLoteVenta" runat="server" Text="" Font-Bold ="true" ForeColor ="Green" ></asp:Label>
            <asp:Label ID="olblLoteSeleccionado" runat="server" Text="" Font-Bold ="true" ForeColor ="Blue" ></asp:Label>

            <asp:Button ID="obutVolverAlReporte" runat="server" Height="61px" Text="Volver al Reporte" />

        </div>
        <div>
            <asp:Label ID="Label4" runat="server" Text="Datos del / los compradores "></asp:Label>
        </div>
        <div>
            <asp:Label ID="olblClienteNombres" runat="server" Text="" Font-Bold ="true" ForeColor ="Blue" ></asp:Label>
        </div>


        <div>
            <asp:Label ID="Label6" runat="server" Text="Domicilio del / los compradores "></asp:Label>
        </div>
        <div>
            <asp:Label ID="olblClienteDomicilio" runat="server" Text="" Font-Bold ="true" ForeColor ="Blue" ></asp:Label>
        </div>


        <div>
            <asp:Label ID="Label7" runat="server" Text="Tel[efonos del / los compradores."></asp:Label>
        </div>
        <div>
            <asp:Label ID="olblClienteTelefonos" runat="server" Text="" Font-Bold ="true" ForeColor ="Blue" ></asp:Label>
        </div>


        <div>
            <asp:Label ID="Label8" runat="server" Text="Llamadas realizadas"></asp:Label>
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
               <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirma Alta" CssClass="btn btn-success"  />
               <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandona Alta" CssClass="btn btn-danger" />
</div>               
</form> 




</asp:Panel> 
</asp:Content>

