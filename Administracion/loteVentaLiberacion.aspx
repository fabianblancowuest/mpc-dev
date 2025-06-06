﻿<%@ Page Title="Liberación de Lote Adherido" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false"
    CodeFile="loteVentaLiberacion.aspx.vb" Inherits="Administracion_loteVentaLiberacion" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <h1 class="titulo-rol">
            <asp:Label ID="Label1" runat="server" Text="Liberación de Lote"></asp:Label>
        </h1>

        <!-- Contenedor buscar lote -->
        <div class="contenedor-busqueda" id="barraBusquedaLote">
            <input type="search" name="" id="search-manzana" placeholder="Ingrese lote a buscar..."
                title="Permite la búsqueda de lotes">
            <button type="button" class="btn btn-danger" id="btn-search">Buscar <i class="bi bi-search"></i></button>
        </div>

        <h2 class="subtitulo-rol">
            <asp:Label ID="olblVistaTipo" runat="server" Text="Usted esta en la vista de Lotes Liberados"></asp:Label>
        </h2>
        <asp:Button ID="obutNuevaLiberacion" runat="server" Text="Nueva Liberación"
            CssClass="btn btn-basic btn-success" />
        <div>
            <asp:SqlDataSource ID="odsloteVentaUltimasLiberaciones" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="loteVentaUltimasLiberaciones"
                SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:GridView ID="ogvloteVentaUltimasLiberaciones" runat="server" AutoGenerateColumns="False" DataSourceID="odsloteVentaUltimasLiberaciones"
                EmptyDataText="No se registran liberaciones de lotes" AllowSorting="True" Font-Size="XX-Small" PageSize="100000" CssClass="table-cemmi">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                        SortExpression="id" />
                    <asp:BoundField DataField="operador" HeaderText="operador" SortExpression="operador" />
                    <asp:BoundField DataField="idLoteVenta" HeaderText="idLoteVenta" SortExpression="idLoteVenta" />
                    <asp:BoundField DataField="idBarrioLote" HeaderText="idBarrioLote" SortExpression="idBarrioLote" />
                    <asp:BoundField DataField="Barrio" HeaderText="Barrio" SortExpression="Barrio" />
                    <asp:BoundField DataField="Manzana" HeaderText="Manzana" SortExpression="Manzana" />
                    <asp:BoundField DataField="Lote" HeaderText="Lote" SortExpression="Lote" />
                    <asp:BoundField DataField="FechaLiberacion" HeaderText="FechaLiberacion"
                        SortExpression="FechaLiberacion" />
                    <asp:BoundField DataField="clienteLiberado" HeaderText="Cliente Liberado"
                        SortExpression="clienteLiberado" />
                    <asp:BoundField DataField="Vendedor" HeaderText="Vendedor" SortExpression="Vendedor" />
                </Columns>
            </asp:GridView>
        </div>

        <asp:Panel ID="PanelNuevaLiberacion" runat="server" Visible="false">
            <!-- Selecciones -->
            <div class="lote-venta-liberacion-select">

                <div>
                    <asp:Label ID="Label2" runat="server" Text="Seleccione Barrio"></asp:Label>
                </div>
                <div>
                    <asp:SqlDataSource ID="odsBarrioHabilitadoSelecciona" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="BARRIOTraerODDL"
                        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    <asp:DropDownList ID="oddlBarrioHabilitadoSelecciona" runat="server" AutoPostBack="True"
                        DataSourceID="odsBarrioHabilitadoSelecciona" DataTextField="barrioDescripcion"
                        DataValueField="idBarrio" Width="100%"></asp:DropDownList>

                </div>

                <div>
                    <asp:Label ID="Label3" runat="server" Text="Seleccione Manzana"></asp:Label>
                </div>
                <div>
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
                        DataValueField="idBarrioManzana" Width="100%"></asp:DropDownList>

                </div>
                <div>
                    <asp:Label ID="Label4" runat="server" Text="Seleccione Lote"></asp:Label>
                </div>
            </div>

            <div>

                <asp:SqlDataSource ID="odsBARRIOLOTEOperador" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="BARRIOMANZANALOTELIBERA"
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                        <asp:ControlParameter ControlID="oddlBarrioHabilitadoSelecciona" PropertyName="SelectedValue"
                            Name="idBarrio" Type="Int32"></asp:ControlParameter>
                        <asp:ControlParameter ControlID="oddlBarrioHabilitadoManzanaSelecciona"
                            PropertyName="SelectedValue" Name="idBarrioManzana" Type="Int32"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DropDownList ID="oddlBARRIOLOTEOperador" runat="server" DataSourceID="odsBARRIOLOTEOPERADOR"
                    DataTextField="BARRIOLOTEDescripcion" DataValueField="idLoteVenta" CssClass="form-control"
                    AutoPostBack="True">
                </asp:DropDownList>

            </div>

            <asp:Panel ID="PanelLiberacion" runat="server" Visible="false">
                <div class="text-center my-3">
                    <asp:Label ID="Label5" runat="server" Text="Identificador de venta:"></asp:Label>
                    <asp:Label ID="olblIDLoteVenta" runat="server" Text="No seleccionada" Font-Bold="true"></asp:Label>
                </div>

                <div class="text-center">
                    <asp:Button ID="obutLiberaLote" runat="server" Text="Liberar Lote"
                        class="btn btn-basic btn-success my-3" />

                    <asp:Button ID="obutRetorna" runat="server" Text="Abandonar" class="btn btn-basic btn-danger" />
                </div>

                <div>
                    <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="true"></asp:Label>
                    <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
                </div>
            </asp:Panel>

        </asp:Panel>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("search-manzana").addEventListener("keyup", function () {
                    let filter = this.value.toLowerCase();
                    let table = document.getElementById("<%= ogvloteVentaUltimasLiberaciones.ClientID %>");
                    let rows = table.getElementsByTagName("tr");

                    for (let i = 1; i < rows.length; i++) {
                        //columna 'Manzana'
                        let manzanaCell = rows[i].getElementsByTagName("td")[5];
                        if (manzanaCell) {
                            let text = manzanaCell.textContent || manzanaCell.innerText;
                            rows[i].style.display = text.toLowerCase().includes(filter) ? "" : "none";
                        }
                    }
                });
            });
        </script>

    </asp:Content>