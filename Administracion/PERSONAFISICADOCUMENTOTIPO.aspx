<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false"
   CodeFile="PERSONAFISICADOCUMENTOTIPO.aspx.vb" Inherits="STRSYSTEM_Administracion_PERSONAFISICADOCUMENTOTIPO" title="Tratamiento Tabla TIPOS DE
DOCUMENTOS PARA PERSONA F�SICA." Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <h1 class="titulo-rol">
               <asp:Label ID="olblPERSONAFISICADOCUMENTOTIPOTitulo" runat="server"
                  Text="TIPOS DE DOCUMENTOS PARA PERSONA FÍSICA"></asp:Label>
            </h1>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server">

            <div class="contenedor-busqueda">
               <!-- <asp:Label ID="olblBuscar" runat="server" Text="Localizar"
                  ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el botón BUSCAR ">
               </asp:Label> -->
               <asp:TextBox ID="otxtCadena" runat="server" CssClass="input">Todo</asp:TextBox>
               <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" />
            </div>
            <div>

               <asp:SqlDataSource ID="odsPERSONAFISICADOCUMENTOTIPO" runat="server"
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                  SelectCommand="PERSONAFISICADOCUMENTOTIPOTRAERCADENA" SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvPERSONAFISICADOCUMENTOTIPO" runat="server" AutoGenerateColumns="False"
                     CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15"
                     PagerStyle-CssClass="pgr"
                     DataKeyNames="IDPERSONAFISICADOCUMENTOTIPO          ,PERSONAFISICADOCUMENTOTIPOCODIGO             ,PERSONAFISICADOCUMENTOTIPODESCRIPCION              ,PERSONAFISICADOCUMENTOTIPOEXPLICACION             ,PERSONAFISICADOCUMENTOTIPOESTADO             "
                     DataSourceID="odsPERSONAFISICADOCUMENTOTIPO"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDPERSONAFISICADOCUMENTOTIPO" HeaderText="ID" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDPERSONAFISICADOCUMENTOTIPO" />
                        <asp:BoundField DataField="PERSONAFISICADOCUMENTOTIPOCODIGO"
                           HeaderText="TIPO DE DOCUMENTO PERSONA FÍSICA"
                           SortExpression="PERSONAFISICADOCUMENTOTIPOCODIGO" />
                        <asp:BoundField DataField="PERSONAFISICADOCUMENTOTIPODESCRIPCION"
                           HeaderText="DESCRIPCIÓN DEL TIPO DE DOCUMENTO"
                           SortExpression="PERSONAFISICADOCUMENTOTIPODESCRIPCION" />
                        <asp:BoundField DataField="PERSONAFISICADOCUMENTOTIPOEXPLICACION"
                           HeaderText="EXPLICACIÓN DEL TIPO DE DOCUMENTO DE IDENTIFICACION DE LAS PERSONAS"
                           SortExpression="PERSONAFISICADOCUMENTOTIPOEXPLICACION" />
                        <asp:TemplateField HeaderText="ESTADO (VERDADERO = Activo / FALSO=Inactivo)"
                           SortExpression="PERSONAFISICADOCUMENTOTIPOESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="PERSONAFISICADOCUMENTOTIPOESTADOBox" runat="server"
                                 Checked='<% # Bind("PERSONAFISICADOCUMENTOTIPOESTADO") %>' Enabled="false" />
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
                  <asp:Label ID="olblIDPERSONAFISICADOCUMENTOTIPO" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblPERSONAFISICADOCUMENTOTIPOCODIGO" runat="server"
                     Text="TIPO DE DOCUMENTO PERSONA FÍSICA:" CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtPERSONAFISICADOCUMENTOTIPOCODIGO" runat="server" CssClass="form-control"
                     MaxLength="10"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblPERSONAFISICADOCUMENTOTIPODESCRIPCION" runat="server"
                     Text="DESCRIPCIÓN DEL TIPO DE DOCUMENTO:" CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtPERSONAFISICADOCUMENTOTIPODESCRIPCION" runat="server" CssClass="form-control"
                     MaxLength="100"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblPERSONAFISICADOCUMENTOTIPOEXPLICACION" runat="server"
                     Text="EXPLICACIÓN DEL TIPO DE DOCUMENTO DE IDENTIFICACIÓN DE LAS PERSONAS:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtPERSONAFISICADOCUMENTOTIPOEXPLICACION" runat="server" CssClass="form-control"
                     TextMode="MultiLine" height="500px"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblPERSONAFISICADOCUMENTOTIPOESTADO" runat="server"
                     Text="ESTADO (VERDADERO = Activo / FALSO=Inactivo):" CssClass="control-label"></asp:Label>
                  <asp:CheckBox ID="otxtPERSONAFISICADOCUMENTOTIPOESTADO" runat="server" />
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