<%@ Page Title="Consulta de adhesiones por Barrio" Language="VB" MasterPageFile="~/master/p.master"
    AutoEventWireup="false" CodeFile="BarrioLoteAdhesionConsulta.aspx.vb"
    Inherits="Administracion_BarrioLoteAdhesionConsulta" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"
        CssClass="consulta-adhesiones-por-barrio">
        <h1 class="titulo-rol">CONSULTA DE ADHESIONES POR BARRIO</h1>
        <div class="contenedor-busqueda consulta-adhesiones-por-barrio">
            <asp:Label ID="olblSeleccionaBarrio" runat="server" Text="Seleccione Barrio:"></asp:Label>
            <asp:SqlDataSource ID="odsBarrioHabilitadoSelecciona" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="barrioHabilitadoSelecciona"
                SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:DropDownList ID="oddlBarrioHabilitadoSelecciona" runat="server" AutoPostBack="True"
                DataSourceID="odsBarrioHabilitadoSelecciona" DataTextField="barrioDescripcion" DataValueField="idBarrio"
                CssClass="form-select"></asp:DropDownList>
        </div>


        <div id="radio-mz-apellido">
            <asp:RadioButtonList ID="orbOpcion" runat="server" AutoPostBack="True" class="radio-mz-apellido">
                <asp:ListItem Value="1">Lotes por manzana</asp:ListItem>
                <asp:ListItem Value="2">Busqueda por apellido </asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <asp:Panel ID="PanelManzana" runat="server" Visible="false">
            <div>
                <div class="text-center">
                    <asp:Label ID="olblSeleccionaManzana" runat="server" Text="Seleccione Manzana:"></asp:Label>
                </div>
                <div class="contenedor-busqueda">
                    <asp:SqlDataSource ID="odsBarrioHabilitadoManzanaSelecciona" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                        SelectCommand="barrioHabilitadoManzanaSelecciona" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="oddlBarrioHabilitadoSelecciona" Name="idBarrio"
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="oddlBarrioHabilitadoManzanaSelecciona" runat="server" AutoPostBack="True"
                        DataSourceID="odsBarrioHabilitadoManzanaSelecciona" DataTextField="barrioManzanaDescripcion"
                        DataValueField="idBarrioManzana" CssClass="form-select"></asp:DropDownList>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="PanelCadena" runat="server" Visible="false">
            <div class="text-center">
                <asp:Label ID="Label2" runat="server" Text="Apellido a buscar:"></asp:Label>
            </div>
            <div class="contenedor-busqueda">
                <asp:TextBox ID="otxtCadena" runat="server" CssClass="form-control"
                    placeholder="Ingrese apellido a buscar"></asp:TextBox>
                <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn btn-basic btn-primary" />
            </div>
        </asp:Panel>

        <div>

            <asp:SqlDataSource ID="odsrptBarrioManzanaParcelaVenta" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rptBarrioManzanaParcelaVenta"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="oddlBarrioHabilitadoSelecciona" Name="idBarrio"
                        PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="oddlBarrioHabilitadoManzanaSelecciona" Name="idBarrioManzana"
                        PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="orbOpcion" Name="tipo" PropertyName="SelectedValue"
                        Type="String" />
                    <asp:ControlParameter ControlID="otxtCadena" DefaultValue="" Name="cadenaBusqueda"
                        PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="contenedor-responsive">

                <asp:GridView ID="ogvrptBarrioManzanaParcelaVenta" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsrptBarrioManzanaParcelaVenta"
                    Font-Size="X-Small" PageSize="50"
                    EmptyDataText="La consulta no ha recuperado datos con el argumento solicitado">
                    <Columns>
                        <asp:BoundField DataField="idBarrioLote" HeaderText="id Lote" SortExpression="idBarrioLote" />
                        <asp:BoundField DataField="idBarrio" HeaderText="idBarrio" SortExpression="idBarrio"
                            Visible="False" />
                        <asp:BoundField DataField="idBarrioManzana" HeaderText="idBarrioManzana"
                            SortExpression="idBarrioManzana" Visible="False" />
                        <asp:BoundField DataField="idLoteVenta" HeaderText="id Venta" InsertVisible="False"
                            ReadOnly="True" SortExpression="idLoteVenta" />
                        <asp:BoundField DataField="Manzana" HeaderText="Manzana" SortExpression="Manzana" />
                        <asp:BoundField DataField="Parcela" HeaderText="Parcela" SortExpression="Parcela" />
                        <asp:BoundField DataField="Vendedor" HeaderText="Vendedor" SortExpression="Vendedor" />
                        <asp:BoundField DataField="loteVentaCodigo" HeaderText="loteVentaCodigo"
                            SortExpression="loteVentaCodigo" Visible="False" />
                        <asp:BoundField DataField="loteVentaDescripcion" HeaderText="loteVentaDescripcion"
                            SortExpression="loteVentaDescripcion" Visible="False" />
                        <asp:BoundField DataField="idBarrio1" HeaderText="idBarrio1" SortExpression="idBarrio1"
                            Visible="False" />
                        <asp:BoundField DataField="idVendedor" HeaderText="idVendedor" SortExpression="idVendedor"
                            Visible="False" />
                        <asp:BoundField DataField="loteVentaFechaVisita" DataFormatString="{0:d}"
                            HeaderText="Fecha Visita" SortExpression="loteVentaFechaVisita" />
                        <asp:BoundField DataField="loteVentaAdhesionMonto" HeaderText="Monto Adhesion"
                            SortExpression="loteVentaAdhesionMonto" />
                        <asp:BoundField DataField="loteVentaCuotaMonto" HeaderText="Monto Cuota"
                            SortExpression="loteVentaCuotaMonto" />
                        <asp:BoundField DataField="cliente01Nombre" HeaderText="cliente 01 "
                            SortExpression="cliente01Nombre" />
                        <asp:BoundField DataField="cliente01DNI" HeaderText="cliente 01 DNI"
                            SortExpression="cliente01DNI" />
                        <asp:BoundField DataField="cliente01Domicilio" HeaderText="01 Domicilio"
                            SortExpression="cliente01Domicilio" />
                        <asp:BoundField DataField="cliente01Telefono" HeaderText="Telefono"
                            SortExpression="cliente01Telefono" />
                        <asp:BoundField DataField="cliente02Nombre" HeaderText="cliente02 "
                            SortExpression="cliente02Nombre" />
                        <asp:BoundField DataField="cliente02DNI" HeaderText="DNI" SortExpression="cliente02DNI" />
                        <asp:BoundField DataField="cliente02Domicilio" HeaderText="02 Domicilio"
                            SortExpression="cliente02Domicilio" />
                        <asp:BoundField DataField="cliente02Telefono" HeaderText="02Telefono"
                            SortExpression="cliente02Telefono" />
                        <asp:BoundField DataField="idClienteIVA" HeaderText="idClienteIVA" SortExpression="idClienteIVA"
                            Visible="False" />
                        <asp:BoundField DataField="clienteCUIT" HeaderText="clienteCUIT" SortExpression="clienteCUIT" />
                        <asp:BoundField DataField="idLoteDimension" HeaderText="idLoteDimension"
                            SortExpression="idLoteDimension" Visible="False" />
                        <asp:BoundField DataField="idCuotasCantidad" HeaderText="idCuotasCantidad"
                            SortExpression="idCuotasCantidad" Visible="False" />
                        <asp:BoundField DataField="idLoteTipo" HeaderText="idLoteTipo" SortExpression="idLoteTipo"
                            Visible="False" />
                        <asp:BoundField DataField="loteVentafechaCancelacion" HeaderText="Fecha Cancelacion"
                            SortExpression="loteVentafechaCancelacion" />
                        <asp:BoundField DataField="LOTEPRECIOBC" HeaderText="LOTE PRECIO BC"
                            SortExpression="LOTEPRECIOBC" />
                        <asp:BoundField DataField="CUOTABC" HeaderText="CUOTA BC" SortExpression="CUOTABC" />
                        <asp:BoundField DataField="clienteIVaDescripcion" HeaderText="IVA Cliente"
                            SortExpression="clienteIVaDescripcion" />
                        <asp:BoundField DataField="loteTipoDescripcion" HeaderText="Tipo de Lote"
                            SortExpression="loteTipoDescripcion" />
                        <asp:BoundField DataField="cuotasCantidadDescripcion" HeaderText="Cantidad cuotas"
                            SortExpression="cuotasCantidadDescripcion" />
                        <asp:BoundField DataField="EstadoImpresion" HeaderText="Impreso" ReadOnly="True"
                            SortExpression="EstadoImpresion" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <script>

            document.addEventListener("DOMContentLoaded", () => {
                const radio = document.querySelector("#ContentPlaceHolder1_orbOpcion_0");
                const radio2 = document.querySelector("#ContentPlaceHolder1_orbOpcion_0");


                // radio2.addEventListener("click", () => {
                //     radio.click();

                // })

                // window.onload = function () {
                //     setTimeout(() => {
                //         __doPostBack('ctl00$ContentPlaceHolder1$orbOpcion$0', '');
                //     }, 0);
                // };

                // window.onload = function () {
                //     if (!sessionStorage.getItem("postbackExecuted")) {
                //         sessionStorage.setItem("postbackExecuted", "true");
                //         setTimeout(() => {
                //             __doPostBack('ctl00$ContentPlaceHolder1$orbOpcion$0', '');
                //         }, 0);
                //     }
                // };


                const button = document.getElementById("ContentPlaceHolder1_obutBuscar");

                button.addEventListener("click", () => {
                    __doPostBack('ctl00$ContentPlaceHolder1$orbOpcion$1', '');
                })

                console.log(button)



            })


        </script>

    </asp:Content>