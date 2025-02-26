<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="EMPRESA.aspx.vb"
   Inherits="STRSYSTEM_Administracion_EMPRESA" title="Tratamiento Tabla " Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <h1 class="titulo-rol">
               <!-- <asp:Label ID="olblEMPRESATitulo" runat="server" Text="Empresas"></asp:Label> -->
               Empresas
            </h1>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server" CssClass="empresas">

            <div class="contenedor-busqueda">
               <!-- <asp:Label ID="olblBuscar" runat="server" Text="Localizar"
                  ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR ">
               </asp:Label> -->
               <asp:TextBox ID="otxtCadena" runat="server" CssClass="form-control" placeholder="Buscar empresa..."
                  title="Ingrese empresa a buscar">Todo
               </asp:TextBox>
               <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" />
            </div>
            <div>

               <asp:SqlDataSource ID="odsEMPRESA" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                  SelectCommand="EMPRESATRAERCADENA" SelectCommandType="StoredProcedure"
                  ProviderName="System.Data.SqlClient">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvEMPRESA" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi"
                     AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"
                     DataKeyNames="IDEMPRESA,EMPRESACODIGO,EMPRESADESCRIPCION,EMPRESAEXPLICACION,EMPRESAESTADO"
                     DataSourceID="odsEMPRESA"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDEMPRESA" HeaderText="" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDEMPRESA" />
                        <asp:BoundField DataField="EMPRESACODIGO" HeaderText="" SortExpression="EMPRESACODIGO" />
                        <asp:BoundField DataField="EMPRESADESCRIPCION" HeaderText=""
                           SortExpression="EMPRESADESCRIPCION" />
                        <asp:BoundField DataField="EMPRESAEXPLICACION" HeaderText=""
                           SortExpression="EMPRESAEXPLICACION" />
                        <asp:TemplateField HeaderText="" SortExpression="EMPRESAESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="EMPRESAESTADOBox" runat="server" Checked='<% # Bind("EMPRESAESTADO") %>'
                                 Enabled="false" />
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
               <asp:Button ID="obutAlta" runat="server" Text="Nuevo Registro" CssClass="btn-basic btn btn-success" />

            </div>

         </asp:Panel>


         <asp:Panel ID="PanelAlta" runat="server" Visible="false">
            <form class="form" role="form">

               <div class="form-group">
                  <asp:Label ID="olblIDEMPRESA" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEMPRESACODIGO" runat="server" Text=":" CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtEMPRESACODIGO" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEMPRESADESCRIPCION" runat="server" Text=":" CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtEMPRESADESCRIPCION" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEMPRESAEXPLICACION" runat="server" Text=":" CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtEMPRESAEXPLICACION" runat="server" CssClass="form-control" TextMode="MultiLine"
                     height="500px"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEMPRESAESTADO" runat="server" Text=":" CssClass="control-label"></asp:Label>
                  <asp:CheckBox ID="otxtEMPRESAESTADO" runat="server" />
               </div>

               <div class="col-sm-offset-2 col-sm-10">

                  <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
                  <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
                  <br />
                  <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirma Alta"
                     CssClass="btn-basic btn btn-success" />
                  <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandona Alta"
                     CssClass="btn-basic btn btn-danger" />
               </div>
            </form>




         </asp:Panel>


      </asp:Content>