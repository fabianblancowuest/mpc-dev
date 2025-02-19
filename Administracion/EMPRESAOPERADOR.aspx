<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="EMPRESAOPERADOR.aspx.vb"
   Inherits="STRSYSTEM_Administracion_EMPRESAOPERADOR" title="Tratamiento Tabla " Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <div class="row">
               <h1>
                  <asp:Label ID="olblEMPRESAOPERADORTitulo" runat="server" Text=""></asp:Label>
               </h1 class="titulo-rol">
            </div>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server">

            <div class="row">

               <div class="form-group">
                  <asp:Label ID="Label1" runat="server" Text="SELECCIONE OPERADOR:" CssClass="control-label">
                  </asp:Label>
                  <asp:SqlDataSource ID="odsOPERADOROperador" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="OPERADOROPERADORSELECCIONA"
                     SelectCommandType="StoredProcedure">
                     <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                     </SelectParameters>
                  </asp:SqlDataSource>
                  <asp:DropDownList ID="oddlOPERADOROperador" runat="server" DataSourceID="odsOPERADOROPERADOR"
                     DataTextField="OPERADORDescripcion" DataValueField="idOPERADOR" CssClass="form-control"
                     AutoPostBack="True">
                  </asp:DropDownList>
               </div>
            </div>
            <div>

               <asp:SqlDataSource ID="odsEMPRESAOPERADOR" runat="server"
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EMPRESAOPERADORTRAERID"
                  SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="oddlOPERADOROperador" Name="idOPERADOR"
                        PropertyName="SelectedValue" Type="Int16" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvEMPRESAOPERADOR" runat="server" AutoGenerateColumns="False"
                     CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15"
                     PagerStyle-CssClass="pgr"
                     DataKeyNames="IDEMPRESAOPERADOR        ,IDOPERADOR    ,IDEMPRESA    ,IDEMPRESASUCURSAL        ,IDEMPRESASECTOR       ,EMPRESAOPERADORESTADO           "
                     DataSourceID="odsEMPRESAOPERADOR"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDEMPRESAOPERADOR" HeaderText="id" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDEMPRESAOPERADOR" />
                        <asp:BoundField DataField="IDOPERADOR" HeaderText="OPERADOR" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDOPERADOR" />
                        <asp:BoundField DataField="IDEMPRESA" HeaderText="EMPRESA" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDEMPRESA" />
                        <asp:BoundField DataField="IDEMPRESASUCURSAL" HeaderText="SUCURSAL" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDEMPRESASUCURSAL" />
                        <asp:BoundField DataField="IDEMPRESASECTOR" HeaderText="SECTOR" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDEMPRESASECTOR" />
                        <asp:TemplateField HeaderText="ESTADO" SortExpression="EMPRESAOPERADORESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="EMPRESAOPERADORESTADOBox" runat="server"
                                 Checked='<% # Bind("EMPRESAOPERADORESTADO") %>' Enabled="false" />
                           </ItemTemplate>
                           <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                     </Columns>
                  </asp:GridView>

               </div>
            </div>
            <br />
            <br />


            <div class="row">
               <asp:Button ID="obutAlta" runat="server" Text="Nuevo Registro" CssClass="btn btn-success" />

            </div>

         </asp:Panel>


         <asp:Panel ID="PanelAlta" runat="server" Visible="false">
            <form class="form" role="form">

               <div class="form-group">
                  <asp:Label ID="olblIDEMPRESAOPERADOR" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblIDOPERADOR" runat="server" Text="OPERADOR:" CssClass="control-label"></asp:Label>
                  <asp:SqlDataSource ID="odsOPERADOR" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="OPERADORTraerOddl"
                     SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  <asp:DropDownList ID="oddlOPERADOR" runat="server" DataSourceID="odsOPERADOR"
                     DataTextField="OPERADORDescripcion" DataValueField="IDOPERADOR" CssClass="form-control">
                  </asp:DropDownList>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblIDEMPRESA" runat="server" Text="EMPRESA:" CssClass="control-label"></asp:Label>
                  <asp:SqlDataSource ID="odsEMPRESA" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EMPRESATraerOddl"
                     SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  <asp:DropDownList ID="oddlEMPRESA" runat="server" DataSourceID="odsEMPRESA"
                     DataTextField="EMPRESADescripcion" DataValueField="IDEMPRESA" CssClass="form-control">
                  </asp:DropDownList>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblIDEMPRESASUCURSAL" runat="server" Text="SUCURSAL:" CssClass="control-label">
                  </asp:Label>
                  <asp:SqlDataSource ID="odsEMPRESASUCURSAL" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EMPRESASUCURSALTraerOddl"
                     SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  <asp:DropDownList ID="oddlEMPRESASUCURSAL" runat="server" DataSourceID="odsEMPRESASUCURSAL"
                     DataTextField="EMPRESASUCURSALDescripcion" DataValueField="IDEMPRESASUCURSAL"
                     CssClass="form-control">
                  </asp:DropDownList>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblIDEMPRESASECTOR" runat="server" Text="SECTOR:" CssClass="control-label">
                  </asp:Label>
                  <asp:SqlDataSource ID="odsEMPRESASECTOR" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EMPRESASECTORTraerOddl"
                     SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  <asp:DropDownList ID="oddlEMPRESASECTOR" runat="server" DataSourceID="odsEMPRESASECTOR"
                     DataTextField="EMPRESASECTORDescripcion" DataValueField="IDEMPRESASECTOR" CssClass="form-control">
                  </asp:DropDownList>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEMPRESAOPERADORESTADO" runat="server" Text="ESTADO:" CssClass="control-label">
                  </asp:Label>
                  <asp:CheckBox ID="otxtEMPRESAOPERADORESTADO" runat="server" />
               </div>

               <div class="col-sm-offset-2 col-sm-10">

                  <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
                  <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
                  <br />
                  <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirma Alta" CssClass="btn btn-success" />
                  <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandona Alta" CssClass="btn btn-danger" />
               </div>
            </form>




         </asp:Panel>


      </asp:Content>