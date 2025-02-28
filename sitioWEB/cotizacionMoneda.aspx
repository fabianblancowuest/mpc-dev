<%@ Page Title="Carga de cotizacion de moneda extranjera." Language="VB" MasterPageFile="~/master/p.master"
    AutoEventWireup="false" CodeFile="cotizacionMoneda.aspx.vb" Inherits="sitioWEB_cotizacionMoneda" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <h1 class="titulo-rol">
            <asp:Label ID="olblACCESOROLTitulo" runat="server" Text="COTIZACIÓN DE MONEDA EXTRANJERA"></asp:Label>
        </h1>

        <div>

            <asp:Label ID="Label1" runat="server" Text="SELECCIONE FECHA:"></asp:Label>
            <asp:SqlDataSource ID="odsCotizacionFecha" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="cotizacionFechaODDL"
                SelectCommandType="StoredProcedure"></asp:SqlDataSource>

            <asp:DropDownList ID="oddlCotizacionFecha" runat="server" AutoPostBack="True"
                DataSourceID="odsCotizacionFecha" DataTextField="cotizacionFecha" DataValueField="cotizacionFecha">
            </asp:DropDownList>

        </div>

        <div class="contenedor-responsive">
            <asp:SqlDataSource ID="odsCotizacionFechaTrae" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="cotizacionFechaTrae"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="oddlCotizacionFecha" DbType="Date" Name="cotizacionFecha"
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvCotizacionFechaTrae" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi"
                DataKeyNames="idCotizacion" DataSourceID="odsCotizacionFechaTrae">
                <Columns>
                    <asp:TemplateField HeaderText="idCotizacion" InsertVisible="False" SortExpression="idCotizacion">

                        <ItemTemplate>
                            <asp:Label ID="idCotizacion" runat="server" Text='<%# Bind("idCotizacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="cotizacionFecha" DataFormatString="{0:d}"
                        HeaderText="Fecha de Cotizacion" SortExpression="cotizacionFecha" />
                    <asp:BoundField DataField="idMoneda" HeaderText="idMoneda" SortExpression="idMoneda"
                        Visible="False" />
                    <asp:BoundField DataField="monedaCodigo" HeaderText="Código Moneda "
                        SortExpression="monedaCodigo" />
                    <asp:BoundField DataField="monedaDescripcion" HeaderText="Descripción Moneda"
                        SortExpression="monedaDescripcion" />

                    <asp:TemplateField HeaderText="Valor de Compra" SortExpression="cotizacionValorCompra">
                        <ItemTemplate>
                            <asp:TextBox ID="otxtCotizacionValorCompra" runat="server"
                                Text='<%# Bind("cotizacionValorCompra") %>'></asp:TextBox>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Valor de Venta" SortExpression="cotizacionValorVenta">
                        <ItemTemplate>
                            <asp:TextBox ID="otxtCotizacionValorVenta" runat="server"
                                Text='<%# Bind("cotizacionValorVenta") %>'></asp:TextBox>
                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>
            </asp:GridView>

            <div>
                <asp:Label ID="olblMensajeGestion" runat="server" Text="" ForeColor="Blue"></asp:Label>

            </div>
            <div>
                <asp:Label ID="olblValidacionMensajeError" runat="server" Text="" ForeColor="Red"></asp:Label>

            </div>
        </div>

        <div class="contenedor-flexible margenes-y">

            <asp:Button ID="obutCotizacionActualiza" runat="server" Text="Actualizar cotización"
                CssClass="btn btn-basic btn-success" />
            <asp:Button ID="obutCotizacionFechaAlta" runat="server" Text="Agregar nueva fecha"
                CssClass="btn btn-basic btn-primary" />


        </div>

    </asp:Content>