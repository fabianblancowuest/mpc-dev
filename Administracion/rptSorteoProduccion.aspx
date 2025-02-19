<%@ Page Title="Producción sorteo billetes sorteo por vendedor" MaintainScrollPositionOnPostback="true" Language="VB"
    MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="rptSorteoProduccion.aspx.vb"
    Inherits="Administracion_rptSorteoProduccion" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server" CssClass="espaciado-interno">

        <h3 class="titulo-rol">Producción sorteo billetes sorteo por vendedor</h3>

        <div class="cuadro-info espaciado-interno">
            <asp:Label ID="Label1" runat="server"
                Text="Este reporte toma las cargas realizadas por cada operador en el sistema."></asp:Label>
            <asp:Label ID="Label2" runat="server"
                Text="Este reporte puede ordenarse tocando cada nombre de columna de manera que pueda verse en modo ascendente o descendente.">
            </asp:Label>
        </div>

        <div>
            <asp:Label ID="Label3" runat="server" Text="Ingrese período a procesar" CssClass="subtitulo-rol">
            </asp:Label>
            <asp:SqlDataSource ID="odsCalendario" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                SelectCommand="select id, cONVERT(nvarchar(30),fecha , 102) fecha from calendario order by fecha desc">
            </asp:SqlDataSource>
        </div>
        <!-- Fechas -->
        <div class="seleccion-fechas-sp">
            <asp:Label ID="Label4" runat="server" Text="Desde Fecha:" Width="20%" CssClass="fecha-sorteo-produccion">
            </asp:Label>
            <asp:DropDownList ID="oddlFechaDesde" runat="server" AutoPostBack="True" DataSourceID="odsCalendario"
                DataTextField="fecha" DataValueField="fecha"></asp:DropDownList>
            <asp:Label ID="Label5" runat="server" Text="Hasta Fecha:" Width="20%" CssClass="fecha-sorteo-produccion">
            </asp:Label>
            <asp:DropDownList ID="oddlFechaHasta" runat="server" AutoPostBack="True" DataSourceID="odsCalendario"
                DataTextField="fecha" DataValueField="fecha"></asp:DropDownList>
        </div>

        <asp:SqlDataSource ID="odsRptSorteoProduccionResumen" runat="server"
            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rptSorteoProduccionResumen"
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="oddlFechaDesde" Name="fechaDesde" PropertyName="SelectedValue"
                    Type="DateTime" />
                <asp:ControlParameter ControlID="oddlFechaHasta" Name="fechaHasta" PropertyName="SelectedValue"
                    Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div>
            <asp:GridView ID="ogvRptSorteoProduccionResumen" runat="server" AutoGenerateColumns="False"
                CssClass="table-cemmi" DataSourceID="odsRptSorteoProduccionResumen">
                <Columns>
                    <asp:BoundField DataField="idSorteoPremio" HeaderText="idSorteoPremio" ReadOnly="True"
                        SortExpression="idSorteoPremio" Visible="False" />
                    <asp:BoundField DataField="sorteoPremioDescripcion" HeaderText="Premio" ReadOnly="True"
                        SortExpression="sorteoPremioDescripcion" />
                    <asp:BoundField DataField="billetes" HeaderText="billetes" ReadOnly="True"
                        SortExpression="billetes">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="recaudado" DataFormatString="{0:c}" HeaderText="recaudado"
                        ReadOnly="True" SortExpression="recaudado">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="%Billete" HeaderText="%Billete" SortExpression="%Billete">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="%Venta" HeaderText="%Venta" SortExpression="%Venta">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
        <div>
            <asp:SqlDataSource ID="odsrptSorteoProduccion" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rptSorteoProduccion"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="oddlFechaDesde" Name="fechaDesde" PropertyName="SelectedValue"
                        Type="DateTime" />
                    <asp:ControlParameter ControlID="oddlFechaHasta" Name="fechaHasta" PropertyName="SelectedValue"
                        Type="DateTime" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvrptSorteoProduccion" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                CssClass="table-cemmi" DataSourceID="odsrptSorteoProduccion" Font-Size="Small">
                <Columns>
                    <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador"
                        Visible="False" />
                    <asp:BoundField DataField="operadorDescripcion" HeaderText="Operador"
                        SortExpression="operadorDescripcion" />
                    <asp:BoundField DataField="efectivo" DataFormatString="{0:c}" HeaderText="Efectivo" ReadOnly="True"
                        SortExpression="efectivo">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="transferencia" DataFormatString="{0:c}" HeaderText="Transferencia"
                        ReadOnly="True" SortExpression="transferencia">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="totalVenta" DataFormatString="{0:c}" HeaderText="Total Venta"
                        ReadOnly="True" SortExpression="totalVenta">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="totalCupones" HeaderText="Total Cupones" ReadOnly="True"
                        SortExpression="totalCupones">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="operaciones-en-proceso">
            <asp:Label ID="Label6" runat="server" Text="Operaciones en proceso" CssClass="subtitulo-rol"></asp:Label>
            <asp:SqlDataSource ID="odsrptSorteoTalonControl" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rptSorteoTalonControl"
                SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:GridView ID="ogvodsrptSorteoTalonControl" runat="server" AutoGenerateColumns="False"
                CssClass="table-cemmi" DataKeyNames="idSorteoTalonCobranza" DataSourceID="odsrptSorteoTalonControl"
                EmptyDataText="No se registran operaciones en proceso." Font-Size="X-Small">
                <Columns>
                    <asp:BoundField DataField="operadorDescripcion" HeaderText="Operador"
                        SortExpression="operadorDescripcion" />
                    <asp:BoundField DataField="idSorteoTalonCobranza" HeaderText="Talón " InsertVisible="False"
                        ReadOnly="True" SortExpression="idSorteoTalonCobranza" Visible="True">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="totalCobranza" DataFormatString="{0:c}" HeaderText="Cobranza"
                        ReadOnly="True" SortExpression="totalCobranza">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TalonMonto" DataFormatString="{0:c}" HeaderText="Suma montos billetes"
                        ReadOnly="True" SortExpression="TalonMonto">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Billetes" HeaderText="Billetes" SortExpression="Billetes" />
                    <asp:BoundField DataField="tipoTalon" HeaderText="Tipo de talón" SortExpression="tipoTalon" />
                </Columns>
            </asp:GridView>
        </div>
    </asp:Content>