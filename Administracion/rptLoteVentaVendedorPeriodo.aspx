<%@ Page Title="Ventas de lotes por Vendedor por periodo" Language="VB" MasterPageFile="~/master/p.master"
    AutoEventWireup="false" CodeFile="rptLoteVentaVendedorPeriodo.aspx.vb"
    Inherits="Administracion_rptLoteVentaVendedorPeriodo" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" href="/Administracion/rptLoteVentaVendedorPeriodo.css">
        <!-- Sweet Alert -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <!-- <div>
        <asp:Label ID="Label3" runat="server" Text="Mi Primer Casa S.A." Font-Bold ="true" Font-Size ="Large" ></asp:Label>    
    </div> -->
        <h1 class="titulo-rol">
            <!-- <span class="solo-imprimir">Mi Primer Casa S.A.</span> -->
            <asp:Label ID="Label1" runat="server" Text="Control de Adhesiones concretadas por vendedor en período">
            </asp:Label>
        </h1>

        <div class="mod-imp text-center seleccion-fechas">
            <asp:Label ID="Label2" runat="server" Text="Vendedor:"></asp:Label>
            <asp:Label ID="olblVendedorNombre" runat="server" Text="" Font-Bold="true" Font-Size="Large"></asp:Label>
            <asp:Label ID="olblVendedorCorreo" runat="server" Text="" CssClass="correo-vendedor"></asp:Label>
            <!-- <span class="solo-imprimir d-inline-block m-3">Período:</span> -->
            <div class="seleccion-fechas-sp" id="venta-periodo">

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
        <div id="botones-menu" class="mx-auto">
            <button class="btn btn-light btn-imprimir no-imprimir">Imprimir <i class="bi bi-printer-fill"></i></button>
            <button class="btn btn-light no-imprimir" id="btn-espaciar">Centrar <i
                    class="bi bi-distribute-horizontal"></i></button>
            <button class="btn btn-light no-imprimir" id="btn-resaltar">Resaltar Totales <i
                    class="bi bi-highlighter"></i></button>
            <button class="btn btn-light no-imprimir" id="btn-comision">Mi Comisión del Mes <i
                    class="bi bi-currency-dollar"></i></button>
        </div>
        <div id="tabla-adhesiones" class="tabla-adhesiones contenedor-responsive">
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

        <div class="tabla-operaciones-canceladas contenedor-responsive">
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
        <div class="tabla-operaciones-señadas contenedor-responsive">
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
        </div>
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                document.querySelectorAll(".btn-imprimir").forEach((btn) => {
                    btn.addEventListener("click", () => {
                        window.print();
                    })
                })

                const tablaAdhesiones = document.getElementById("tabla-adhesiones");
                const filas = document.querySelectorAll("tr");
                const columnas = tablaAdhesiones.querySelectorAll("td");
                const menuBotones = document.getElementById("botones-menu");
                const btnEspaciar = document.getElementById("btn-espaciar");
                const btnComision = document.getElementById("btn-comision");
                const selectPeriodo = document.querySelector("#venta-periodo select option");

                console.log("Hola", selectPeriodo.textContent)

                btnEspaciar.addEventListener("click", (event) => {
                    event.preventDefault();

                    const buttonText = btnEspaciar.innerText.trim();
                    console.log("hola");

                    for (let i = 0; i < columnas.length; i++) {
                        columnas[i].classList.toggle("centrar-contenido");
                    }

                    btnEspaciar.classList.toggle("btn-light");
                    btnEspaciar.classList.toggle("btn-primary");
                })

                btnComision.addEventListener("click", (event) => {
                    event.preventDefault();
                    const comisionTotal = columnas[columnas.length - 1];

                    Swal.fire({
                        title: `<h3 style="font-size: 16x">Su comisión del mes de ${selectPeriodo.textContent} es: </h3`,
                        html: `<strong style="color: green; font-size: 24px">${comisionTotal.textContent}</strong>`,
                        // icon: "success",
                    })

                })

                const inputs = document.querySelectorAll("input");
                console.log(inputs);

                let toggle = false;
                const btnResaltar = document.getElementById("btn-resaltar");
                btnResaltar.addEventListener("click", (event) => {
                    event.preventDefault();
                    // columnas[columnas.length -1].classList.toggle("resaltar");
                    // Verificar si hay columnas para evitar errores

                    const comisionTotal = columnas[columnas.length - 1];
                    const comisionPremio = columnas[columnas.length - 2];
                    const comisionBase = columnas[columnas.length - 3];
                    const totalIngresoMes = columnas[columnas.length - 4];
                    const valorTerreno = columnas[columnas.length - 5];
                    const pagoPactado = columnas[columnas.length - 6];

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
                            if (toggle) {
                                toggle = !toggle
                                return; // Vuelve al inicio
                            } else {
                                comisionTotal.scrollIntoView({ behavior: "smooth", block: "center" }); // Va a la celda
                            }
                            toggle = !toggle;
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