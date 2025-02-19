<%@ Page Title="Ventas de lotes por Vendedor por periodo" Language="VB" MasterPageFile="~/master/p.master"
    AutoEventWireup="false" CodeFile="rptLoteVentaVendedorPeriodo.aspx.vb"
    Inherits="Administracion_rptLoteVentaVendedorPeriodo" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" href="/Administracion/rptLoteVentaVendedorPeriodo.css">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <!-- <div>
        <asp:Label ID="Label3" runat="server" Text="Mi Primer Casa S.A." Font-Bold ="true" Font-Size ="Large" ></asp:Label>    
    </div> -->
        <h1 class="titulo-rol no-padding-imp">
            <span class="solo-imprimir">Mi Primer Casa S.A.</span>
            <asp:Label ID="Label1" runat="server" Text="Control de Adhesiones concretadas por vendedor en período">
            </asp:Label>
        </h1>

        <div class="mod-imp text-center">
            <asp:Label ID="Label2" runat="server" Text="Vendedor:"></asp:Label>
            <asp:Label ID="olblVendedorNombre" runat="server" Text="" Font-Bold="true" Font-Size="Large"></asp:Label>
            <asp:Label ID="olblVendedorCorreo" runat="server" Text="" CssClass="correo-vendedor"></asp:Label>
            <!-- <span class="solo-imprimir d-inline-block m-3">Período:</span> -->
            <div class="seleccion-fechas-sp">

                <asp:DropDownList CssClass="m-3" ID="oddlUltimosPeriodos" runat="server" AutoPostBack="True"
                    DataSourceID="odsUltimosPeriodos" DataTextField="ejercicioDetalleDescripcion"
                    DataValueField="idEjercicioDetalle"></asp:DropDownList>
                <asp:SqlDataSource ID="odsrptLoteVentaVendedorIdPeriodo" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rptLoteVentaVendedorIdPeriodo"
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idVendedor" SessionField="idOperador" Type="Int32" />
                        <asp:ControlParameter ControlID="oddlUltimosPeriodos" Name="idEjercicioDetalle"
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="tabla-adhesiones">
            <asp:SqlDataSource ID="odsUltimosPeriodos" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select top 12 * from ejercicioDetalle  where  ejercicioDetalleFechaDesde &lt;= getdate()
order by idEjercicioDetalle DEsc"></asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                CssClass="table-cemmiSinFormato ancho-absoluto" DataSourceID="odsrptLoteVentaVendedorIdPeriodo"
                Font-Size="X-Small">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                        SortExpression="id" Visible="False" />
                    <asp:BoundField DataField="idBarrioLote" HeaderText="Cod. Lote" SortExpression="idBarrioLote">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="idLoteVenta" HeaderText="Cod. Venta" SortExpression="idLoteVenta">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="idVendedor" HeaderText="idVendedor" SortExpression="idVendedor"
                        Visible="False" />
                    <asp:BoundField DataField="FechaVenta" HeaderText="F  Venta" SortExpression="FechaVenta"
                        DataFormatString="{0:d}">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FechaCancelacion" HeaderText="F  Canc." SortExpression="FechaCancelacion"
                        DataFormatString="{0:d}">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="cliente01Nombre" HeaderText="Cliente" SortExpression="cliente01Nombre" />
                    <asp:BoundField DataField="Barrio" HeaderText="Barrio" SortExpression="Barrio" />
                    <asp:BoundField DataField="Manzana" HeaderText="Manzana" SortExpression="Manzana" />
                    <asp:BoundField DataField="Parcela" HeaderText="Parcela" SortExpression="Parcela" />
                    <asp:BoundField DataField="Seña" HeaderText="Seña" SortExpression="Seña" />
                    <asp:BoundField DataField="PagoPactado" DataFormatString="{0:c}" HeaderText="Pago Pactado"
                        SortExpression="PagoPactado">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="valorTerreno" DataFormatString="{0:c}" HeaderText="Valor Terreno"
                        SortExpression="valorTerreno">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Total Ingreso Mes" DataFormatString="{0:c}"
                        HeaderText="Total Ingreso Mes" SortExpression="Total Ingreso Mes">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="comisionBase" DataFormatString="{0:c}" HeaderText="Comision Base"
                        SortExpression="comisionBase">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="comisioPremio" DataFormatString="{0:c}" HeaderText=" Comision Premio"
                        SortExpression="comisioPremio">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="comisionTotal" DataFormatString="{0:c}" HeaderText="Comision Total"
                        SortExpression="comisionTotal">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>

        <div class="tabla-operaciones-canceladas">
            <asp:SqlDataSource ID="odsrptLoteVentaVendedorPeriodoResumen" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rptLoteVentaVendedorPeriodoResumen"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idVendedor" SessionField="idOperador" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvrptLoteVentaVendedorPeriodoResumen" runat="server" AutoGenerateColumns="False"
                CssClass="table-cemmi" DataSourceID="odsrptLoteVentaVendedorPeriodoResumen">
                <Columns>
                    <asp:BoundField DataField="descripcion" HeaderText="Resumen Operaciones canceladas" ReadOnly="True"
                        SortExpression="descripcion" />
                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad" ReadOnly="True"
                        SortExpression="cantidad">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>

        <asp:Label ID="Label4" runat="server" Text="Operaciones Señadas" CssClass="subtitulo-rol"></asp:Label>
        <div class="tabla-operaciones-señadas">
            <asp:SqlDataSource ID="odsrptLoteVentaVendedorIdPeriodoAdhesionPendiente" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                SelectCommand="rptLoteVentaVendedorIdPeriodoAdhesionPendiente" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idVendedor" SessionField="idOperador" Type="Int32" />
                    <asp:ControlParameter ControlID="oddlUltimosPeriodos" Name="idEjercicioDetalle"
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvrptLoteVentaVendedorIdPeriodoAdhesionPendiente" runat="server"
                AutoGenerateColumns="False" CssClass="table-cemmi"
                DataSourceID="odsrptLoteVentaVendedorIdPeriodoAdhesionPendiente" Font-Size="XX-Small">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                        SortExpression="id" Visible="False" />
                    <asp:BoundField DataField="idBarrioLote" HeaderText="Cod. Lote" SortExpression="idBarrioLote">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="idLoteVenta" HeaderText="Cod. Venta" SortExpression="idLoteVenta">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="idVendedor" HeaderText="idVendedor" SortExpression="idVendedor"
                        Visible="False" />
                    <asp:BoundField DataField="FechaVenta" HeaderText="F  Venta" SortExpression="FechaVenta"
                        DataFormatString="{0:d}">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FechaCancelacion" HeaderText="F  Canc." SortExpression="FechaCancelacion"
                        DataFormatString="{0:d}">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="cliente01Nombre" HeaderText="Cliente" SortExpression="cliente01Nombre" />
                    <asp:BoundField DataField="Barrio" HeaderText="Barrio" SortExpression="Barrio" />
                    <asp:BoundField DataField="Manzana" HeaderText="Manzana" SortExpression="Manzana" />
                    <asp:BoundField DataField="Parcela" HeaderText="Parcela" SortExpression="Parcela" />
                    <asp:BoundField DataField="PagoPactado" DataFormatString="{0:c}" HeaderText="Pago Pactado"
                        SortExpression="PagoPactado">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="valorTerreno" DataFormatString="{0:c}" HeaderText="Valor Terreno"
                        SortExpression="valorTerreno">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <div class="text-center no-imprimir my-4">
                <button class="btn btn-primary btn-basic" id="imp-venta-vend-periodo">Imprimir <i
                        class="bi bi-printer-fill"></i></button>
            </div>
        </div>
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                document.getElementById("imp-venta-vend-periodo").addEventListener("click", () => {
                    window.print();
                })
            })
        </script>
    </asp:Content>