<%@ Page Language="VB" Debug="true" MasterPageFile="~/master/p.master" AutoEventWireup="false"
    CodeFile="iniciocorrecto.aspx.vb" Inherits="iniciocorrecto" title="Inicio Correcto" %>

    <%--<%@ Register Src="~/Administracion/notificacionOperador.ascx" TagPrefix="uc1" TagName="notificacionOperador"
        %>--%>
        <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        </asp:Content>
        <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <asp:Panel ID="opanelRoles" runat="server" Width="100%" CssClass="table-cemmi formulario-roles">
                <div>
                    <%-- <uc1:notificacionOperador runat="server" ID="notificacionOperador" />--%>
                </div>
                <div class="contenedor-busqueda">
                    <input type="search" name="" id="input-search" placeholder="Buscar...">
                    <button type="button" class="btn btn-primary" id="btn-search">Buscar</button>
                </div>

                <!-- Tabla Roles -->
                <div class="contenedor-tabla-roles" id="grillaPrincipal">
                    <asp:Label runat="server" Text="ROLES ASIGNADOS POR USUARIO" CssClass="titulo-rol"></asp:Label>
                    <asp:GridView CssClass="mGrid tabla-roles" AlternatingRowStyle-CssClass="alt" ID="ogvRolesUsuario"
                        runat="server" AutoGenerateColumns="False"
                        DataKeyNames="idAccesoRol,accesoRolCodigo,accesoRolDescripcion,accesoRolExplicacion,accesoRolPagina,accesoRolDocumentoOperativo,accesoRolEstado"
                        DataSourceID="odsEmpresaOperadorRolDespilega"
                        EmptyDataText="El usuario ingresado no tiene roles asignados en la Empresa seleccionada. Comuniquese con el Administrador del Sistema.">
                        <AlternatingRowStyle CssClass="alt" />
                        <Columns>

                            <asp:CommandField SelectText="Acceder" ShowSelectButton="True" />

                            <asp:BoundField DataField="idAccesoRol" HeaderText="idAccesoRol" InsertVisible="False"
                                ReadOnly="True" SortExpression="idAccesoRol" Visible="False" />
                            <asp:TemplateField HeaderText="Rol" SortExpression="accesoRolCodigo" Visible="False">

                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("accesoRolCodigo") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Descripción" SortExpression="accesoRolDescripcion">

                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("accesoRolDescripcion") %>'
                                        Font-Bold="true" CssClass="acceso-rol"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("accesoRolExplicacion") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="accesoRolPagina" HeaderText="Pagina"
                                SortExpression="accesoRolPagina" Visible="False" />
                            <asp:BoundField DataField="accesoRolDocumentoOperativo" HeaderText="Documento"
                                SortExpression="accesoRolDocumentoOperativo" Visible="False" />
                            <asp:CheckBoxField DataField="accesoRolEstado" HeaderText="Estado"
                                SortExpression="accesoRolEstado" Visible="False" />
                        </Columns>
                    </asp:GridView>

                </div>
                <asp:SqlDataSource ID="odsEmpresaOperadorRolDespilega" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="empresaOperadorRolDespilega"
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idEmpresaOperador" SessionField="idEmpresaOperador" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:Panel>
            <script>
                const grillaPrincipal = document.getElementById("grillaPrincipal");
                const itemsA = grillaPrincipal.querySelectorAll("a");


                for (let i = 0; i < itemsA.length; i++) {
                    itemsA[i].classList.add("btn");
                    itemsA[i].classList.add("btn-primary");

                }
            </script>
        </asp:Content>