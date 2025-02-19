<%@ Page Title="Roles por Operador y empresa" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="operadorRolEmpresa.aspx.vb" Inherits="Administracion_operadorRolEmpresa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h4>
    Roles asignados a operadores por Empresa.
</h4>
<div>
    <asp:Label ID="Label1" runat="server" Text="Seleccione Operador"></asp:Label>
    <asp:SqlDataSource ID="odsOperadorCorreo" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="operadorCorreo" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:DropDownList ID="oddlOperadorCorreo" runat="server" DataSourceID="odsOperadorCorreo" DataTextField="operadorDescripcion" DataValueField="idOperador" AutoPostBack ="true"></asp:DropDownList>

</div>
    <div>
        <asp:Label ID="Label2" runat="server" Text="Roles por empresa"></asp:Label>
        <asp:SqlDataSource ID="odsEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EMPRESATraeroddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
   
        <asp:DropDownList ID="oddlEmpresa" runat="server" DataSourceID="odsEmpresa" DataTextField="empresaDescripcion" DataValueField="idEmpresa" AutoPostBack="True"></asp:DropDownList> 
         </div>

    <div>
        <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible ="false" ></asp:Label>
        <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
    </div>

<div>
    <asp:Label ID="Label3" runat="server" Text="Roles asignados."></asp:Label>
</div>
<div>
    <asp:SqlDataSource ID="odsOperadorEmpresaRoles" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="OperadorEmpresaRoles" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="oddlOperadorCorreo" Name="idOperador" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="oddlEmpresa" Name="idEmpresa" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="ogvOperadorEmpresaRoles" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataKeyNames="idEmpresaRolOperador" DataSourceID="odsOperadorEmpresaRoles" Font-Size="X-Small" EmptyDataText="El operador no tiene roles asignados">
        <Columns>
            <asp:CommandField SelectText="Desasignar" ShowSelectButton="True" />
            <asp:BoundField DataField="idEmpresaRolOperador" HeaderText="idEmpresaRolOperador" InsertVisible="False" ReadOnly="True" SortExpression="idEmpresaRolOperador" Visible="False" />
            <asp:BoundField DataField="idEmpresa" HeaderText="idEmpresa" SortExpression="idEmpresa" Visible="False" />
            <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" Visible="False" />
            <asp:BoundField DataField="idRol" HeaderText="idRol" SortExpression="idRol" Visible="False" />
            <asp:BoundField DataField="empresaRolOperadorFechaAsignacion" HeaderText="Fecha Asignacion" SortExpression="empresaRolOperadorFechaAsignacion" />
            <asp:CheckBoxField DataField="empresaRolOperadorEstado" HeaderText="Activo" SortExpression="empresaRolOperadorEstado" />
            <asp:TemplateField HeaderText="Rol " SortExpression="accesoRolDescripcion">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("accesoRolDescripcion") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("accesoRolDescripcion") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Explicacion" SortExpression="accesoRolExplicacion">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("accesoRolExplicacion") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("accesoRolExplicacion") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>

<div>
    <asp:Label ID="Label4" runat="server" Text="Roles no asignados  "></asp:Label>

</div>
<div>
    <asp:SqlDataSource ID="odsOperadorRolEmpresaNoAsignados" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="operadorRolEmpresaNoAsignados" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="oddlOperadorCorreo" Name="idOperador" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="oddlEmpresa" Name="idEmpresa" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="ogvOperadorRolEmpresaNoAsignados" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsOperadorRolEmpresaNoAsignados" Font-Size ="X-Small" DataKeyNames="idAccesoRol" EmptyDataText="Se han asignado todos los roles al operador." >
        <Columns>
            <asp:CommandField SelectText="Asignar Rol" ShowSelectButton="True" />
            <asp:BoundField DataField="idAccesoRol" HeaderText="idAccesoRol" InsertVisible="False" ReadOnly="True" SortExpression="idAccesoRol" Visible="False" />
            <asp:BoundField DataField="accesoRolDescripcion" HeaderText="Rol" SortExpression="accesoRolDescripcion" />
            <asp:BoundField DataField="accesoRolExplicacion" HeaderText="Explicacion" SortExpression="accesoRolExplicacion" />
        </Columns>
    </asp:GridView>
</div>


</asp:Content>

