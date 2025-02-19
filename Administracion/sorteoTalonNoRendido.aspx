<%@ Page Title="Control fisico de billetes por vendedor." Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="sorteoTalonNoRendido.aspx.vb" Inherits="Administracion_sorteoTalonNoRendido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Control fisico de billetes por vendedor." Font-Bold="true" Font-Size ="Larger"></asp:Label>

    </div>

    <div>
        <asp:Label ID="Label2" runat="server" Text="Seleccione operador a controlar"></asp:Label>
        <asp:SqlDataSource ID="odsOperador" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="OPERADORTRAERVENDEDOR" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:DropDownList ID="oddlOperador" runat="server" AutoPostBack="True" DataSourceID="odsOperador" DataTextField="operadorDescripcion" DataValueField="idOperador"></asp:DropDownList>
        
         <asp:SqlDataSource ID="odssorteoTalonControlOperadorNovedad" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select * from sorteoTalonControlOperadorNovedad where sorteoTalonControlOperadorNovedadRol in (0,1) order by sorteoTalonControlOperadorNovedadCodigo"></asp:SqlDataSource>
        <asp:SqlDataSource ID="odsSorteoTalonNoRendido" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoTalonNoRendido" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="oddlOperador" Name="idOperador" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div>

        <asp:Label ID="Label3" runat="server" Text="Billetes no rendidos."></asp:Label> 
        <asp:Button ID="obutAuditoriaGraba" runat="server" Text="Grabar Auditoria" />
        <asp:Label ID="olblidSorteoTalonControlOperadorCabecera" runat="server" Text="" Visible="false"></asp:Label>

    </div>
    <div>
        <asp:Label ID="olblValidacionMensajeError" runat="server" Text="" Font-Bold="true" ForeColor ="Red"></asp:Label>
    </div>
    <div>
        <asp:GridView ID="ogvSorteoTalonNoRendido" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataKeyNames="idSorteoTalon" DataSourceID="odsSorteoTalonNoRendido">
            <Columns>
                <asp:TemplateField HeaderText="idSorteoTalon" InsertVisible="False" SortExpression="idSorteoTalon" Visible="False">
                   
                    <ItemTemplate>
                        <asp:Label ID="olblIDSorteoTalon" runat="server" Text='<%# Bind("idSorteoTalon") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Numero" HeaderText="Numero" SortExpression="Numero" >
                <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="AsignadoFecha" HeaderText="Fecha de asigacion" SortExpression="AsignadoFecha" />
                <asp:BoundField DataField="sorteoPremioDescripcion" HeaderText="Premio" ReadOnly="True" SortExpression="sorteoPremioDescripcion" />
                <asp:TemplateField HeaderText="Control" SortExpression="idSorteoTalonControlOperadorNovedad">
                       <ItemTemplate>
                        <asp:DropDownList ID="oddlEstado" runat="server" DataSourceID="odssorteoTalonControlOperadorNovedad" DataTextField="SorteoTalonControlOperadorNovedadDescripcion" DataValueField="idSorteoTalonControlOperadorNovedad" SelectedValue='<%# Bind("idSorteoTalonControlOperadorNovedad") %>'>
                        </asp:DropDownList>
                           <asp:Label ID="olblIdEstado" runat="server" Text='<%# Bind("idSorteoTalonControlOperadorNovedad") %>' Visible ="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="apellidoYNombres" HeaderText="Comprador" SortExpression="apellidoYNombres" />
                <asp:BoundField DataField="celularNumero" HeaderText="Numero Celular" SortExpression="celularNumero" />
                <asp:BoundField DataField="correoElectronico" HeaderText="Correo Electronico" SortExpression="correoElectronico" />
            </Columns>
        </asp:GridView>

    </div>
</asp:Content>

