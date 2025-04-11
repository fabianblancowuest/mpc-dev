<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="EMPRESASUCURSAL.aspx.vb"
   Inherits="STRSYSTEM_Administracion_EMPRESASUCURSAL" title="Tratamiento Tabla " Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <h1 class="titulo-rol">
               <asp:Label ID="olblEMPRESASUCURSALTitulo" runat="server" Text="Sucursales por Empresa"></asp:Label>
               Sucursales por empresa
            </h1>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server" CssClass="sucursales-por-empresa">

            <div class="row">

               <div class="contenedor-busqueda">
                  <asp:Label ID="Label1" runat="server" Text="SELECCIONE EMPRESA:" CssClass="control-label"></asp:Label>
                  <asp:SqlDataSource ID="odsEMPRESAOperador" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EMPRESAOPERADORSELECCIONA"
                     SelectCommandType="StoredProcedure">
                     <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                     </SelectParameters>
                  </asp:SqlDataSource>
                  <asp:DropDownList ID="oddlEMPRESAOperador" runat="server" DataSourceID="odsEMPRESAOPERADOR"
                     DataTextField="EMPRESADescripcion" DataValueField="idEMPRESA" CssClass="input" AutoPostBack="True">
                  </asp:DropDownList>
               </div>
            </div>
            <div>

               <asp:SqlDataSource ID="odsEMPRESASUCURSAL" runat="server"
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EMPRESASUCURSALTRAERID"
                  SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="oddlEMPRESAOperador" Name="idEMPRESA" PropertyName="SelectedValue"
                        Type="Int16" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvEMPRESASUCURSAL" runat="server" AutoGenerateColumns="False"
                     CssClass="table-cemmi fuente-mediana" AlternatingRowStyle-CssClass="alt" AllowPaging="True"
                     PageSize="15" PagerStyle-CssClass="pgr"
                     DataKeyNames="IDEMPRESASUCURSAL        ,IDEMPRESA    ,EMPRESASUCURSALCODIGO          ,EMPRESASUCURSALDESCRIPCION           ,EMPRESASUCURSALEXPLICACION           ,EMPRESASUCURSALESTADO          "
                     DataSourceID="odsEMPRESASUCURSAL"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDEMPRESASUCURSAL" HeaderText="id" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDEMPRESASUCURSAL" />
                        <asp:BoundField DataField="IDEMPRESA" HeaderText="Empresa" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDEMPRESA" />
                        <asp:BoundField DataField="EMPRESASUCURSALCODIGO" HeaderText="Codigo Sucursal"
                           SortExpression="EMPRESASUCURSALCODIGO" />
                        <asp:BoundField DataField="EMPRESASUCURSALDESCRIPCION" HeaderText="Descripción Sucursal"
                           SortExpression="EMPRESASUCURSALDESCRIPCION" />
                        <asp:BoundField DataField="EMPRESASUCURSALEXPLICACION" HeaderText="Descripción Adicional"
                           SortExpression="EMPRESASUCURSALEXPLICACION" />
                        <asp:TemplateField HeaderText="Estado (habilitado / inhabilitado)"
                           SortExpression="EMPRESASUCURSALESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="EMPRESASUCURSALESTADOBox" runat="server"
                                 Checked='<% # Bind("EMPRESASUCURSALESTADO") %>' Enabled="false" />
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
               <asp:Button ID="obutAlta" runat="server" Text="Nuevo Registro" CssClass="btn btn-basic btn-success" />

            </div>

         </asp:Panel>


         <asp:Panel ID="PanelAlta" runat="server" Visible="false">
            <form class="form" role="form">

               <div class="form-group">
                  <asp:Label ID="olblIDEMPRESASUCURSAL" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblIDEMPRESA" runat="server" Text="Empresa:" CssClass="control-label"></asp:Label>
                  <asp:SqlDataSource ID="odsEMPRESA" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EMPRESATraerOddl"
                     SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  <asp:DropDownList ID="oddlEMPRESA" runat="server" DataSourceID="odsEMPRESA"
                     DataTextField="EMPRESADescripcion" DataValueField="IDEMPRESA" CssClass="form-control">
                  </asp:DropDownList>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEMPRESASUCURSALCODIGO" runat="server" Text="Codigo Sucursal:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtEMPRESASUCURSALCODIGO" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEMPRESASUCURSALDESCRIPCION" runat="server" Text="Descripción Sucursal:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtEMPRESASUCURSALDESCRIPCION" runat="server" CssClass="form-control"
                     MaxLength="50"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEMPRESASUCURSALEXPLICACION" runat="server" Text="Descripción Adicional:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtEMPRESASUCURSALEXPLICACION" runat="server" CssClass="form-control"
                     TextMode="MultiLine" height="500px"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEMPRESASUCURSALESTADO" runat="server" Text="Estado (habilitado / inhabilitado):"
                     CssClass="control-label"></asp:Label>
                  <asp:CheckBox ID="otxtEMPRESASUCURSALESTADO" runat="server" />
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