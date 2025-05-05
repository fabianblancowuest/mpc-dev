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
                <div class="contenedor-busqueda" id="barraBusquedaInicio">
                    <input type="search" name="" id="input-search" placeholder="Ingrese el rol a buscar..."
                        title="Permite la búsqueda de roles asignados">
                    <button type="button" class="btn btn-primary" id="btn-search">Buscar <i
                            class="bi bi-search"></i></button>
                </div>

                <!-- Tabla Roles -->
                <div class="contenedor-tabla-roles" id="grillaPrincipal">
                    <div class="titulo-rol titulo-roles-asignados">
                        <asp:Label runat="server" Text="ROLES ASIGNADOS POR USUARIO">
                        </asp:Label>
                        <i class="bi bi-person-workspace"></i>
                    </div>
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
                            <asp:BoundField DataField="fua" HeaderText="ULTIMO ACCESO" SortExpression="fua" />
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

                document.addEventListener("DOMContentLoaded", () => {
                    const grillaPrincipal = document.getElementById("grillaPrincipal");
                    const itemsA = grillaPrincipal.querySelectorAll("a");
                    // const arrowIco = `<i class="bi bi-box-arrow-in-right"></i>`

                    for (let i = 0; i < itemsA.length; i++) {
                        itemsA[i].classList.add("btn", "btn-primary");
                        const arrowIco = document.createElement("i");
                        arrowIco.classList.add("bi", "bi-box-arrow-in-right");
                        itemsA[i].append(arrowIco);

                    }
                })
            </script>
        </asp:Content>