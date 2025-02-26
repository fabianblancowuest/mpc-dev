<%@ Page Title="Reporte de sumas y saldos" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false"
    CodeFile="rptSumaSaldos.aspx.vb" Inherits="Administracion_rptSumaSaldos" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

        <asp:Panel ID="PanelSumaSaldos" runat="server" CssClass="suma-y-saldos">
            <h1 class="titulo-rol">
                <asp:Label ID="Label1" runat="server" Text="Suma y saldos"></asp:Label>
            </h1>

            <div>
                <asp:Label ID="Label3" runat="server" Text="Período:"></asp:Label>
                <asp:SqlDataSource ID="odsCalendario" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="select id, cONVERT(nvarchar(30),fecha , 102) fecha from calendario order by fecha desc">
                </asp:SqlDataSource>
            </div>
            <div>
                <asp:Label ID="Label4" runat="server" Text="Desde Fecha :" Width="20%"></asp:Label>
                <asp:DropDownList ID="oddlFechaDesde" runat="server" AutoPostBack="True" DataSourceID="odsCalendario"
                    DataTextField="fecha" DataValueField="fecha" Font-Bold="true"></asp:DropDownList>
            </div>
            <div>

                <asp:Label ID="Label5" runat="server" Text="Hasta Fecha" Width="20%"></asp:Label>
                <asp:DropDownList ID="oddlFechaHasta" runat="server" AutoPostBack="True" DataSourceID="odsCalendario"
                    DataTextField="fecha" DataValueField="fecha" Font-Bold="true"></asp:DropDownList>
            </div>

            <div>
                <asp:Label ID="Label2" runat="server" Text="Incluye cuentas sin movimientos" Width="20%"></asp:Label>
                <asp:CheckBox ID="ochkImputaciones" runat="server" Checked="false" AutoPostBack="true" />
            </div>
            <div>
                <asp:SqlDataSource ID="odsSumaSaldos" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rptSumaSaldosGlobalOptimo"
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                        <asp:ControlParameter ControlID="oddlFechaDesde" Name="fechaDesde" PropertyName="SelectedValue"
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="oddlFechaHasta" Name="fechaHasta" PropertyName="SelectedValue"
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="ochkImputaciones" Name="imputaciones" PropertyName="Checked"
                            Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="ogvSumaSaldos" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi"
                    DataSourceID="odsSumaSaldos" DataKeyNames="idPlanCuenta,planCuentaCodigo,planCuentaImputable"
                    Font-Size="X-Small" EmptyDataText="No existen imputaciones contables en el período seleccionado.">
                    <Columns>
                        <asp:CommandField SelectText="Detalle" ShowSelectButton="True" />
                        <asp:BoundField DataField="idPlanCuenta" HeaderText="id" SortExpression="idPlanCuenta"
                            InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="planCuentaCodigo" HeaderText="Codigo"
                            SortExpression="planCuentaCodigo" />
                        <asp:BoundField DataField="planCuentaDescripcion" HeaderText="Cuenta"
                            SortExpression="planCuentaDescripcion">
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="planCuentaImputable" HeaderText="Imputable"
                            SortExpression="planCuentaImputable">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CheckBoxField>
                        <asp:BoundField DataField="Imputaciones" HeaderText="Cantidad imputaciones" ReadOnly="True"
                            SortExpression="Imputaciones">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Debe" HeaderText="Debe" ReadOnly="True" SortExpression="Debe"
                            DataFormatString="{0:c}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Haber" HeaderText="Haber" ReadOnly="True" SortExpression="Haber"
                            DataFormatString="{0:c}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Saldo" HeaderText="Saldo" ReadOnly="True" SortExpression="Saldo"
                            DataFormatString="{0:c}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>

        </asp:Panel>
        <asp:Panel ID="PanelCuenta" runat="server" Visible="false">

            <div>
                <asp:Label ID="Label6" runat="server" Text="Movimientos por cuenta."></asp:Label>
            </div>
            <div>
                <asp:Label ID="olblIdPlanCuenta" runat="server" Text=""></asp:Label>
                <asp:Label ID="olblPlanCuentaCodigo" runat="server" Text=""></asp:Label>
                <asp:Label ID="olblPlanCuentaDescripcion" runat="server" Text=""></asp:Label>
            </div>
            <div>
                <asp:Label ID="Label7" runat="server" Text="Desde Fecha"></asp:Label>
                <asp:Label ID="olblFechaDesde" runat="server" Text=""></asp:Label>

            </div>
            <div>
                <asp:Label ID="Label8" runat="server" Text="Hasta Fecha"></asp:Label>
                <asp:Label ID="olblFechaHasta" runat="server" Text=""></asp:Label>

            </div>
            <div>
                <asp:SqlDataSource ID="odsRptCuenta" runat="server"></asp:SqlDataSource>

            </div>
        </asp:Panel>


    </asp:Content>