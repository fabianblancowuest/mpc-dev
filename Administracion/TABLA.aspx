<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="TABLA.aspx.vb"
   Inherits="STRSYSTEM_Administracion_TABLA" title="Tratamiento Tabla " Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <div class="row">
               <h1 class="titulo-rol">
                  TABLAS DEL SISTEMA
                  <asp:Label ID="olblTABLATitulo" runat="server" Text=""></asp:Label>
               </h1>
            </div>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server">

            <div class="row contenedor-flexible margenes-y">
               <asp:Label ID="olblBuscar" runat="server" Text="Localizar"
                  ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR ">
               </asp:Label>
               <asp:TextBox ID="otxtCadena" runat="server" CssClass="form-control">Todo</asp:TextBox>
               <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn-basic btn btn-primary" />
            </div>
            <div>

               <asp:SqlDataSource ID="odsTABLA" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                  SelectCommand="TABLATRAERCADENA" SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvTABLA" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi"
                     AlternatingRowStyle-CssClass="alt" AllowPaging="false" PageSize="15" PagerStyle-CssClass="pgr"
                     DataKeyNames="IDTABLA  ,TABLACODIGO    ,TABLADESCRIPCION      ,TABLAEXPLICACION     ,TABLAESTADO     "
                     DataSourceID="odsTABLA"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDTABLA" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDTABLA" />
                        <asp:BoundField DataField="TABLACODIGO" HeaderText="CODIGO TABLA"
                           SortExpression="TABLACODIGO" />
                        <asp:BoundField DataField="TABLADESCRIPCION" HeaderText="NOMBRE TABLA"
                           SortExpression="TABLADESCRIPCION" />
                        <asp:BoundField DataField="TABLAEXPLICACION" HeaderText="EXPLICACION TABLA"
                           SortExpression="TABLAEXPLICACION" />
                        <asp:TemplateField HeaderText="ESTADO TABLA" SortExpression="TABLAESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="TABLAESTADOBox" runat="server" Checked='<% # Bind("TABLAESTADO") %>'
                                 Enabled="false" />
                           </ItemTemplate>
                           <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                     </Columns>
                  </asp:GridView>

               </div>
            </div>

            <div class="row margenes-y">
               <asp:Button ID="obutAlta" runat="server" Text="Nuevo Registro" CssClass="btn-basic btn btn-success" />

            </div>

         </asp:Panel>


         <asp:Panel ID="PanelAlta" runat="server" Visible="false">
            <form class="form" role="form">

               <div class="form-group">
                  <asp:Label ID="olblIDTABLA" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblTABLACODIGO" runat="server" Text="CODIGO TABLA:" CssClass="control-label">
                  </asp:Label>
                  <asp:TextBox ID="otxtTABLACODIGO" runat="server" CssClass="form-control" MaxLength="200">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblTABLADESCRIPCION" runat="server" Text="NOMBRE TABLA:" CssClass="control-label">
                  </asp:Label>
                  <asp:TextBox ID="otxtTABLADESCRIPCION" runat="server" CssClass="form-control" MaxLength="200">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblTABLAEXPLICACION" runat="server" Text="EXPLICACION TABLA:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtTABLAEXPLICACION" runat="server" CssClass="form-control" TextMode="MultiLine"
                     height="500px"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblTABLAESTADO" runat="server" Text="ESTADO TABLA:" CssClass="control-label">
                  </asp:Label>
                  <asp:CheckBox ID="otxtTABLAESTADO" runat="server" />
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