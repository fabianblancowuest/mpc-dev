<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="CBARRIO.aspx.vb"
   Inherits="STRSYSTEM_Administracion_CBARRIO" title="Tratamiento Tabla CONTENEDOR DE BARRIO" Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <h1 class="titulo-rol">
               <asp:Label ID="olblCBARRIOTitulo" runat="server" Text="CONTENEDOR DE BARRIO"></asp:Label>
            </h1>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server" CssClass="contenedor-barrio">

            <div class="contenedor-busqueda">
               <!-- <asp:Label ID="olblBuscar" runat="server" Text="Localizar"
                  ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR ">
               </asp:Label> -->
               <asp:TextBox ID="otxtCadena" runat="server" CssClass="input">Todo</asp:TextBox>
               <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" />
            </div>
            <div>

               <asp:SqlDataSource ID="odsCBARRIO" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                  SelectCommand="CBARRIOTRAERCADENA" SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvCBARRIO" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi"
                     AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"
                     DataKeyNames="IDCBARRIO   ,CBARRIOCODIGO     ,CBARRIODESCRIPCION      ,CBARRIOEXPLICACION      ,CBARRIOPLANO     ,CBARRIOESTADO      "
                     DataSourceID="odsCBARRIO"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDCBARRIO" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDCBARRIO" />
                        <asp:BoundField DataField="CBARRIOCODIGO" HeaderText="CODIGO" SortExpression="CBARRIOCODIGO" />
                        <asp:BoundField DataField="CBARRIODESCRIPCION" HeaderText="NOMBRE CONTENEDOR"
                           SortExpression="CBARRIODESCRIPCION" />
                        <asp:BoundField DataField="CBARRIOEXPLICACION" HeaderText="EXPLICACION"
                           SortExpression="CBARRIOEXPLICACION" />
                        <asp:BoundField DataField="CBARRIOPLANO" HeaderText="PLANO" SortExpression="CBARRIOPLANO" />
                        <asp:TemplateField HeaderText="ESTADO" SortExpression="CBARRIOESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="CBARRIOESTADOBox" runat="server" Checked='<% # Bind("CBARRIOESTADO") %>'
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
                  <asp:Label ID="olblIDCBARRIO" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCBARRIOCODIGO" runat="server" Text="CODIGO:" CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtCBARRIOCODIGO" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCBARRIODESCRIPCION" runat="server" Text="NOMBRE CONTENEDOR:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtCBARRIODESCRIPCION" runat="server" CssClass="form-control" MaxLength="200">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCBARRIOEXPLICACION" runat="server" Text="EXPLICACION:" CssClass="control-label">
                  </asp:Label>
                  <asp:TextBox ID="otxtCBARRIOEXPLICACION" runat="server" CssClass="form-control" TextMode="MultiLine"
                     height="500px"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCBARRIOPLANO" runat="server" Text="PLANO:" CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtCBARRIOPLANO" runat="server" CssClass="form-control" MaxLength="200">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCBARRIOESTADO" runat="server" Text="ESTADO:" CssClass="control-label"></asp:Label>
                  <asp:CheckBox ID="otxtCBARRIOESTADO" runat="server" />
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