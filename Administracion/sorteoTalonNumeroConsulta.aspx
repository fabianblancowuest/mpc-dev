<%@ Page Title="Consulta de billetes" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="sorteoTalonNumeroConsulta.aspx.vb" Inherits="Administracion_sorteoTalonNumeroConsulta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div>
    <asp:Label ID="Label1" runat="server" Text="Consulta de billetes por multiples argumentos."></asp:Label>

</div>
    
<div>
    <asp:Label ID="Label2" runat="server" Text="Puede realizar la busqueda de billetes por Numero, Apellido y nombre del cliente, numero de telefono o correo electronico"></asp:Label>

</div>
<div>

   <asp:Label ID="Label3" runat="server" Text="Ingrese el argumento de busqueda"></asp:Label>
    <asp:TextBox ID="otxtCadena" runat="server"></asp:TextBox>
    <asp:Button ID="obutBuscar" runat="server" Text="Buscar" />
</div>
    <div>
        <asp:SqlDataSource ID="odsSorteoTalonNumeroConsulta" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoTalonNumeroConsulta" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="otxtCadena" Name="cadenaBusqueda" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="ogvSorteoTalonNumeroConsulta" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataKeyNames="idSorteoTalon" DataSourceID="odsSorteoTalonNumeroConsulta" Font-Size="Small">
            <Columns>
                <asp:BoundField DataField="idSorteoTalon" HeaderText="idSorteoTalon" InsertVisible="False" ReadOnly="True" SortExpression="idSorteoTalon" Visible="False" />
                <asp:BoundField DataField="idSorteoTalonario" HeaderText="idSorteoTalonario" SortExpression="idSorteoTalonario" Visible="False" />
                <asp:BoundField DataField="sorteoTalonNumero" HeaderText="Numero Billete" SortExpression="sorteoTalonNumero" />
                <asp:BoundField DataField="operadorFechaAsignacion" HeaderText="idSupervisor" SortExpression="idSupervisor" Visible="False" />
                <asp:BoundField DataField="supervisor" HeaderText="supervisor" SortExpression="supervisor" />
                <asp:BoundField DataField="supervisorFechaAsignacion" HeaderText="Fecha Asignacion a Supervisor" SortExpression="supervisorFechaAsignacion" />
                <asp:BoundField DataField="idSorteoTalonTipo" HeaderText="idSorteoTalonTipo" SortExpression="idSorteoTalonTipo" Visible="False" />
                <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" Visible="False" />
                <asp:BoundField DataField="vendedor" HeaderText="vendedor" SortExpression="vendedor" />
                <asp:BoundField DataField="operadorFechaAsignacion" HeaderText="Fecha Asignacion a vendedor" SortExpression="operadorFechaAsignacion" />
                <asp:BoundField DataField="idSorteoPremio" HeaderText="idSorteoPremio" SortExpression="idSorteoPremio" Visible="False" />
                <asp:BoundField DataField="sorteoPremioDescripcion" HeaderText="Premio" SortExpression="sorteoPremioDescripcion" />
                <asp:BoundField DataField="sorteoTalonMonto" HeaderText="Monto" SortExpression="sorteoTalonMonto" />
                <asp:BoundField DataField="apellidoYNombres" HeaderText="Apellido y Nombres Cliente" SortExpression="apellidoYNombres" />
                <asp:BoundField DataField="celularNumero" HeaderText="Numero Celular" SortExpression="celularNumero" />
                <asp:BoundField DataField="correoElectronico" HeaderText="Correo Electronico" SortExpression="correoElectronico" />
                <asp:CheckBoxField DataField="sorteoTalonTomado" HeaderText="Talon Tomado" SortExpression="sorteoTalonTomado" />
                <asp:BoundField DataField="idSorteoTalonCobranza" HeaderText="Cobranza" SortExpression="idSorteoTalonCobranza" />
                <asp:BoundField DataField="idSorteoTalonRendicion" HeaderText="Rendicion" SortExpression="idSorteoTalonRendicion" />
                <asp:BoundField DataField="sorteoTalonTomadoFecha" HeaderText="Fecha Toma" SortExpression="sorteoTalonTomadoFecha" />
                <asp:BoundField DataField="sorteoTalonSession" HeaderText="sorteoTalonSession" SortExpression="sorteoTalonSession" Visible="False" />
                <asp:CheckBoxField DataField="sorteoTalonBonificado" HeaderText="Bonificado" SortExpression="sorteoTalonBonificado" />
                <asp:BoundField DataField="RendicionNumero" HeaderText="Nro Rendicion" SortExpression="RendicionNumero">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

