<%@ Page Title="Ventas de lotes por Vendedor por periodo" Language="VB" MasterPageFile="~/master/p.master"
    AutoEventWireup="false" CodeFile="rptLoteVentaVendedorPeriodoAdministracion.aspx.vb"
    Inherits="Administracion_rptLoteVentaVendedorPeriodoAdministracion" %>
    <%@ Register Src="~/ventaWEB/loteDocumentacion.ascx" TagPrefix="uc1" TagName="loteDocumentacion" %>

        <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        </asp:Content>
        <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"
            CssClass="rptloteVentaVendedorPeriodoAdministracion">

            <!-- <div>
        <asp:Label ID="Label3" runat="server" Text="Mi Primer Casa S.A." Font-Bold ="true" Font-Size ="Large" ></asp:Label>    
    </div> -->
            <h2 class="titulo-rol">
                <asp:Label ID="Label1" runat="server" Text="Control de Adhesiones concretadas por vendedor en período">
                </asp:Label>
            </h2>
            <div class="contenedor-flexible control-adhesiones-encabezado">
                <asp:Label ID="Label2" runat="server" Text="Vendedor:"></asp:Label>
                <asp:SqlDataSource ID="odsVendedorLote" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="oddlVendedorLote"
                    SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:DropDownList ID="oddlVendedorLote" runat="server" AutoPostBack="True"
                    DataSourceID="odsVendedorLote" DataTextField="operadorDescripcion" DataValueField="idOperador">
                </asp:DropDownList>
                <asp:SqlDataSource ID="odsUltimosPeriodos" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select top 12 * from ejercicioDetalle  where  ejercicioDetalleFechaDesde &lt;= getdate()
        order by idEjercicioDetalle DEsc"></asp:SqlDataSource>
                <asp:DropDownList ID="oddlUltimosPeriodos" runat="server" AutoPostBack="True"
                    DataSourceID="odsUltimosPeriodos" DataTextField="ejercicioDetalleDescripcion"
                    DataValueField="idEjercicioDetalle"></asp:DropDownList>
                <asp:SqlDataSource ID="odsrptLoteVentaVendedorIdPeriodo" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rptLoteVentaVendedorIdPeriodo"
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="oddlVendedorLote" Name="idVendedor"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="oddlUltimosPeriodos" Name="idEjercicioDetalle"
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <!-- Botones menú -->
                <div id="botones-menu">
                    <button class="btn btn-light btn-imprimir no-imprimir">Imprimir <i
                            class="bi bi-printer-fill"></i></button>
                    <button class="btn btn-light no-imprimir" id="btn-espaciar">Centrar <i
                            class="bi bi-distribute-horizontal"></i></button>
                    <button class="btn btn-light no-imprimir" id="btn-resaltar">Resaltar Totales <i
                            class="bi bi-highlighter"></i></button>
                </div>
            </div>
            <asp:Panel ID="PanelPrincipal" runat="server">
                <div class="venta-vendedor-periodo contenedor-responsive" id="ventaVendedorPeriodo">

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        CssClass="table-cemmiSinFormato" DataSourceID="odsrptLoteVentaVendedorIdPeriodo"
                        Font-Size="X-Small"
                        DataKeyNames="idBarrioLote,cliente01Nombre,idLoteVenta,Barrio,Manzana,Parcela">
                        <Columns>
                            <asp:CommandField SelectText="DOC" ShowSelectButton="True" />
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                                SortExpression="id" Visible="False" />
                            <asp:BoundField DataField="idBarrioLote" HeaderText="Cod. Lote"
                                SortExpression="idBarrioLote">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="idLoteVenta" HeaderText="Cod. Venta"
                                SortExpression="idLoteVenta">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="idVendedor" HeaderText="idVendedor" SortExpression="idVendedor"
                                Visible="False" />
                            <asp:BoundField DataField="FechaVenta" HeaderText="F  Venta" SortExpression="FechaVenta"
                                DataFormatString="{0:d}">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FechaCancelacion" HeaderText="F  Canc."
                                SortExpression="FechaCancelacion" DataFormatString="{0:d}">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cliente01Nombre" HeaderText="Cliente"
                                SortExpression="cliente01Nombre" />
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
                            <asp:BoundField DataField="comisioPremio" DataFormatString="{0:c}"
                                HeaderText=" Comision Premio" SortExpression="comisioPremio">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="comisionTotal" DataFormatString="{0:c}"
                                HeaderText="Comision Total" SortExpression="comisionTotal">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fechaRelocaliza" HeaderText="Fecha Reloc."
                                SortExpression="fechaRelocaliza" />
                            <asp:BoundField DataField="FechaCierre" HeaderText="Fecha Cancel."
                                SortExpression="FechaCierre" />
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="venta-vendedor-periodo operaciones-señadas">
                    <asp:SqlDataSource ID="odsrptLoteVentaVendedorPeriodoResumen" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                        SelectCommand="rptLoteVentaVendedorPeriodoResumen" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="oddlVendedorLote" Name="idVendedor"
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="ogvrptLoteVentaVendedorPeriodoResumen" runat="server" AutoGenerateColumns="False"
                        CssClass="table-cemmi" DataSourceID="odsrptLoteVentaVendedorPeriodoResumen">
                        <Columns>
                            <asp:BoundField DataField="descripcion" HeaderText="Resumen Operaciones canceladas"
                                ReadOnly="True" SortExpression="descripcion" />
                            <asp:BoundField DataField="cantidad" HeaderText="Cantidad" ReadOnly="True"
                                SortExpression="cantidad">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>

                <asp:Label ID="Label4" runat="server" Text="Operaciones Señadas" CssClass="subtitulo-rol"></asp:Label>
                <div class="venta-vendedor-periodo contenedor-responsive">
                    <asp:SqlDataSource ID="odsrptLoteVentaVendedorIdPeriodoAdhesionPendiente" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                        SelectCommand="rptLoteVentaVendedorIdPeriodoAdhesionPendiente"
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="oddlVendedorLote" Name="idVendedor"
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="oddlUltimosPeriodos" Name="idEjercicioDetalle"
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="ogvrptLoteVentaVendedorIdPeriodoAdhesionPendiente" runat="server"
                        AutoGenerateColumns="False" CssClass="table-cemmi"
                        DataSourceID="odsrptLoteVentaVendedorIdPeriodoAdhesionPendiente" Font-Size="X-Small"
                        DataKeyNames="idBarrioLote,idLoteVenta,cliente01Nombre,Barrio,Manzana,Parcela">
                        <Columns>
                            <asp:CommandField SelectText="DOC" ShowSelectButton="True" />
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                                SortExpression="id" Visible="False" />
                            <asp:BoundField DataField="idBarrioLote" HeaderText="Cod. Lote"
                                SortExpression="idBarrioLote">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="idLoteVenta" HeaderText="Cod. Venta"
                                SortExpression="idLoteVenta">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="idVendedor" HeaderText="idVendedor" SortExpression="idVendedor"
                                Visible="False" />
                            <asp:BoundField DataField="FechaVenta" HeaderText="F  Venta" SortExpression="FechaVenta"
                                DataFormatString="{0:d}">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FechaCancelacion" HeaderText="F  Canc."
                                SortExpression="FechaCancelacion" DataFormatString="{0:d}">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cliente01Nombre" HeaderText="Cliente"
                                SortExpression="cliente01Nombre" />
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
                </div>

            </asp:Panel>


            <asp:Panel ID="PanelDocumentacion" runat="server" Visible="false">
                <div class="text-center panel-documentacion-encabezado">
                    <asp:Button ID="obutDocumentacionVolver" runat="server" Text="Volver" class="btn btn-primary"
                        style="display: block" />
                    <asp:Label ID="olblIDLOTEVENTA" runat="server" Text="" style="font-weight: bold;"></asp:Label>
                    <asp:Label ID="olblCLIENTE01NOMBRE" runat="server" Text="" style="font-weight: bold;"></asp:Label>
                </div>

                <div class="panel-documentacion" id="panelDoc">
                    <uc1:loteDocumentacion runat="server" ID="persona1DocumentoAnverso" />
                    <uc1:loteDocumentacion runat="server" ID="persona1DocumentoReverso" />
                    <uc1:loteDocumentacion runat="server" ID="persona2DocumentoAnverso" />
                    <uc1:loteDocumentacion runat="server" ID="persona2DocumentoReverso" />
                    <uc1:loteDocumentacion runat="server" ID="consentimientoInformado" />
                    <uc1:loteDocumentacion runat="server" ID="recibo1" />
                    <uc1:loteDocumentacion runat="server" ID="transferencia1" />
                    <uc1:loteDocumentacion runat="server" ID="recibo2" />
                    <uc1:loteDocumentacion runat="server" ID="transferencia2" />
                    <uc1:loteDocumentacion runat="server" ID="recibo3" />
                    <uc1:loteDocumentacion runat="server" ID="transferencia3" />
                </div>



            </asp:Panel>
            <!-- <div class="text-center">
                <button class="btn btn-primary no-imprimir btn-imprimir">Imprimir <i
                        class="bi bi-printer-fill"></i></button>
            </div> -->

            <script>
                document.addEventListener("DOMContentLoaded", () => {

                    document.querySelectorAll(".btn-imprimir").forEach((btn) => {
                        btn.addEventListener("click", () => {
                            window.print();
                        })
                    })

                    const tablaVPeriodo = document.getElementById("ventaVendedorPeriodo");
                    const panelDocumentacion = document.getElementById("panelDoc");
                    const filas = document.querySelectorAll("tr");
                    const columnas = tablaVPeriodo.querySelectorAll("td");
                    // Botones
                    const menuBotones = document.getElementById("botones-menu");
                    const btnEspaciar = document.getElementById("btn-espaciar");

                    console.log(panelDocumentacion)

                    if (tablaVPeriodo) {
                        menuBotones.style.display = "flex";
                    } else if (panelDocumentacion) {
                        menuBotones.style.backgroundColor = "red";
                    }

                    btnEspaciar.addEventListener("click", (event) => {
                        event.preventDefault();

                        const buttonText = btnEspaciar.innerText.trim();
                        //    if (buttonText === "Centrar") {
                        //        btnEspaciar.innerHTML = `<i class="bi bi-align-center"></i> Quitar Centrado`; // Cambia el ícono y texto
                        //    } else if (buttonText === "Quitar Centrado") {
                        //        btnEspaciar.innerHTML = `<i class="bi bi-align-middle"></i> Centrar`; // Cambia el ícono y texto
                        //    }

                        console.log("hola");
                        console.log(tablaVPeriodo);

                        for (let i = 0; i < columnas.length; i++) {
                            columnas[i].classList.toggle("centrar-contenido");
                        }

                        btnEspaciar.classList.toggle("btn-light");
                        btnEspaciar.classList.toggle("btn-primary");
                    })

                    const inputs = document.querySelectorAll("input");

                    const btnResaltar = document.getElementById("btn-resaltar");
                    btnResaltar.addEventListener("click", (event) => {
                        event.preventDefault();
                        // columnas[columnas.length -1].classList.toggle("resaltar");
                        // Verificar si hay columnas para evitar errores

                        const comisionTotal = columnas[columnas.length - 3];
                        const comisionPremio = columnas[columnas.length - 4];
                        const comisionBase = columnas[columnas.length - 5];
                        const totalIngresoMes = columnas[columnas.length - 6];
                        const valorTerreno = columnas[columnas.length - 7];
                        const pagoPactado = columnas[columnas.length - 8];

                        if (columnas && columnas.length > 0) {
                            // Alternar clase en la última columna
                            if (comisionTotal.textContent.trim() !== "") {

                                comisionTotal.classList.toggle("resaltar");
                                comisionPremio.classList.toggle("resaltar2");
                                comisionBase.classList.toggle("resaltar3");
                                totalIngresoMes.classList.toggle("resaltar4");
                                valorTerreno.classList.toggle("resaltar5");
                                pagoPactado.classList.toggle("resaltar6");
                                btnResaltar.classList.toggle("btn-light");
                                btnResaltar.classList.toggle("btn-primary");
                            } else {
                                alert("El vendedor seleccionado no persive comisión")
                            }
                        } else {
                            console.warn("No hay columnas disponibles para resaltar.");
                        }


                    })
                })
            </script>

        </asp:Content>