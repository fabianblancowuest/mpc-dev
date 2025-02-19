<%@ Page Title="Estado de talones pendientes por vendedor de un supervisor." Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="rptSupervisorVendedoresSorteoTalonEstado.aspx.vb" Inherits="Administracion_rptSupervisorVendedoresSorteoTalonEstado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h4>
    Estado de talones pendientes por vendedor de un supervisor.
</h4>
<div>
    <asp:Label ID="Label1" runat="server" Text="Supervisor:"></asp:Label>
    <asp:SqlDataSource ID="odsSupervisor" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SUPERVISORTRAERODDL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:DropDownList ID="oddlSupervisor" runat="server" AutoPostBack="True" DataSourceID="odsSupervisor" DataTextField="supervisorDescripcion" DataValueField="idSupervisor"></asp:DropDownList>
</div>
    <div>
        <asp:SqlDataSource ID="odsrptSupervisorVendedoresSorteoTalonEstado" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rptSupervisorVendedoresSorteoTalonEstado" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                <asp:ControlParameter ControlID="oddlSupervisor" Name="idSupervisor" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="ogvrptSupervisorVendedoresSorteoTalonEstado" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsrptSupervisorVendedoresSorteoTalonEstado" EmptyDataText="El supervisor seleccionado no tiene vendores a su cargo o no se le/les asignado talones de sorteo." Font-Size="X-Small">
            <Columns>
                <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" Visible="False" />
                <asp:BoundField DataField="Operador" HeaderText="Operador" SortExpression="Operador" />
                <asp:BoundField DataField="BonosAsignados" HeaderText="Bonos Asignados" ReadOnly="True" SortExpression="BonosAsignados">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="BonosVendidos" HeaderText="Bonos Vendidos" ReadOnly="True" SortExpression="BonosVendidos">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PorcentajeVendido" HeaderText="Porcentaje Vendido" ReadOnly="True" SortExpression="PorcentajeVendido">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="totalRecaudado" DataFormatString="{0:c}" HeaderText="Total Recaudado" SortExpression="totalRecaudado">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="TotalRendido" DataFormatString="{0:c}" HeaderText="Total Rendido" SortExpression="TotalRendido">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="TotalPendienteRendicion" DataFormatString="{0:c}" HeaderText="Total Pendiente Rendicion" SortExpression="TotalPendienteRendicion">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="BonosPendientes" HeaderText="Bonos Pendientes" ReadOnly="True" SortExpression="BonosPendientes">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FechaUltToma" HeaderText="Ultima Actividad" SortExpression="FechaUltToma" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

