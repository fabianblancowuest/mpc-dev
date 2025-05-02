<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="BARRIOESTADISTICAPROVEEDOR.aspx.vb"
    Inherits="STRSYSTEM_Administracion_BARRIOESTADISTICAPROVEEDOR" Title="ESTADISTICA DE AVANCE POR BARRIO" Culture="es-AR" %>

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
                        <asp:Label ID="olblBARRIOLOTETitulo" runat="server" Text="ESTADISTICAS POR BARRIO"></asp:Label>
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

                    
                    </div>
                </div>


                <div>
                    <asp:SqlDataSource ID="odsBARRIOESTADISTICA" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="barrioEstadisticas"
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="oddlBARRIOOperador" Name="idBarrio"
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="table-responsive tabla-barrio-manzana" id="tabla-barrio-manzana">
                        <!-- Botones de tabla -->
                        <!-- <button class="btn btn-light margenes-y text-center mx-auto d-block" id="btn-expandir">Expandir contenido</button> -->

                        <asp:GridView ID="ogvBARRIOESTADISTICA" runat="server" AutoGenerateColumns="False"
                            CssClass="table-cemmi fuente-mas-chica" AlternatingRowStyle-CssClass="alt" PageSize="100"
                            PagerStyle-CssClass="pgr"
                            DataSourceID="odsBARRIOESTADISTICA"
                            EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                            AllowSorting="True">
                            <AlternatingRowStyle CssClass="alt fila-barrio-mz-lote" />
                            <Columns>
                                <asp:BoundField DataField="CODIGO" HeaderText="CODIGO" ReadOnly="True" SortExpression="CODIGO" Visible="False" />
                                <asp:BoundField DataField="Manzana" HeaderText="Manzana" ReadOnly="True" SortExpression="Manzana" />
                                <asp:BoundField DataField="Total Lotes" HeaderText="Total Lotes" ReadOnly="True" SortExpression="Total Lotes" />
                                <asp:BoundField DataField="Total m2 manzana" HeaderText="Total m2 manzana" ReadOnly="True" SortExpression="Total m2 manzana" />
                                <asp:BoundField DataField="Total BC manzana" HeaderText="Total BC manzana" ReadOnly="True" SortExpression="Total BC manzana" />
                                <asp:BoundField DataField="Lotes adheridos" HeaderText="Lotes adheridos" ReadOnly="True" SortExpression="Lotes adheridos" />
                                <asp:BoundField DataField="Lotes libres" HeaderText="Lotes libres" ReadOnly="True" SortExpression="Lotes libres" />
                                <asp:BoundField DataField="Avance Ventas" HeaderText="Avance Ventas" ReadOnly="True" SortExpression="Avance Ventas" />
                                <asp:BoundField DataField="Superficie adherida" HeaderText="Superficie adherida" ReadOnly="True" SortExpression="Superficie adherida" />
                                <asp:BoundField DataField="BC adheridas" HeaderText="BC adheridas" ReadOnly="True" SortExpression="BC adheridas" />
                            </Columns>
                            <PagerStyle CssClass="pgr" />
                        </asp:GridView>

                    </div>
                </div>

                <div>
                    


                       <asp:SqlDataSource ID="odsBarrioEstadisticaPorcentaje" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="barrioEstadisticasPorcentajeProveedor2"
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="oddlBARRIOOperador" Name="idBarrio"
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="table-responsive tabla-barrio-manzana" id="tabla-barrio-manzana">
                        <div align="center">
                        <br />
                    <asp:Label ID="Label2" runat="server" Text="ESTADISTICAS DEL BARRIO"></asp:Label>
                    <br />
                            </div>
                        <!-- Botones de tabla -->
                        <!-- <button class="btn btn-light margenes-y text-center mx-auto d-block" id="btn-expandir">Expandir contenido</button> -->

                        <asp:GridView ID="ogvBarrioEstadisticaPorcentaje" runat="server" AutoGenerateColumns="False"
                            CssClass="table-cemmi fuente-mas-chica" AlternatingRowStyle-CssClass="alt" PageSize="100"
                            PagerStyle-CssClass="pgr"
                            DataSourceID="odsBarrioEstadisticaPorcentaje"
                            EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                            AllowSorting="True" Width="60%">
                            <AlternatingRowStyle CssClass="alt fila-barrio-mz-lote" />
                            <Columns>
                                <asp:BoundField DataField="ORDEN" HeaderText="ORDEN" SortExpression="ORDEN" ReadOnly="True" />
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" ReadOnly="True" />
                                <asp:BoundField DataField="TOTAL " HeaderText="TOTAL " SortExpression="TOTAL " ReadOnly="True" />
                                <asp:BoundField DataField=" % SOBRE TOTAL" HeaderText=" % SOBRE TOTAL" SortExpression=" % SOBRE TOTAL" ReadOnly="True" />
                            </Columns>
                            <PagerStyle CssClass="pgr" />
                        </asp:GridView>

                    </div>
         


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