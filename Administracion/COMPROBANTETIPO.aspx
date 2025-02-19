<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="COMPROBANTETIPO.aspx.vb"
   Inherits="STRSYSTEM_Administracion_COMPROBANTETIPO" title="Tratamiento Tabla " Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <div class="row">
               <h1 class="titulo-rol">
                  <asp:Label ID="olblCOMPROBANTETIPOTitulo" runat="server" Text="Tipos de comprobante"></asp:Label>
               </h1>
            </div>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server">
            <h2 class="titulo-rol">Tipos de comprobante</h2>

            <div class="row contenedor-flexible margenes-y">
               <asp:Label ID="olblBuscar" runat="server" Text="Localizar"
                  ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR ">
               </asp:Label>
               <asp:TextBox ID="otxtCadena" runat="server" CssClass="form-control">Todo</asp:TextBox>
               <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary btn-basic" />
            </div>
            <div>

               <asp:SqlDataSource ID="odsCOMPROBANTETIPO" runat="server"
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="COMPROBANTETIPOTRAERCADENA"
                  SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvCOMPROBANTETIPO" runat="server" AutoGenerateColumns="False"
                     CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15"
                     PagerStyle-CssClass="pgr"
                     DataKeyNames="IDCOMPROBANTETIPO       ,COMPROBANTETIPOCODIGO         ,COMPROBANTETIPODESCRIPCION          ,COMPROBANTETIPOLETRA         ,COMPROBANTETIPOPUNTO         ,COMPROBANTETIPOEXPLICACION          ,IDEMPRESASECTOR       ,COMPROBANTETIPOESTADO          "
                     DataSourceID="odsCOMPROBANTETIPO"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDCOMPROBANTETIPO" HeaderText="ID" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDCOMPROBANTETIPO" />
                        <asp:BoundField DataField="COMPROBANTETIPOCODIGO" HeaderText="CODIGO TIPO COMPROBANTE"
                           SortExpression="COMPROBANTETIPOCODIGO" />
                        <asp:BoundField DataField="COMPROBANTETIPODESCRIPCION" HeaderText="DESCRIPCION TIPO COMPROBANTE"
                           SortExpression="COMPROBANTETIPODESCRIPCION" />
                        <asp:BoundField DataField="COMPROBANTETIPOLETRA" HeaderText="LETRA COMPROBANTE"
                           SortExpression="COMPROBANTETIPOLETRA" />
                        <asp:BoundField DataField="COMPROBANTETIPOPUNTO" HeaderText="PUNTO"
                           SortExpression="COMPROBANTETIPOPUNTO">
                           <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="COMPROBANTETIPOEXPLICACION" HeaderText="EXPLICACION"
                           SortExpression="COMPROBANTETIPOEXPLICACION" />
                        <asp:BoundField DataField="IDEMPRESASECTOR" HeaderText="SECTOR EMPRESA" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDEMPRESASECTOR" />
                        <asp:TemplateField HeaderText="ESTADO" SortExpression="COMPROBANTETIPOESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="COMPROBANTETIPOESTADOBox" runat="server"
                                 Checked='<% # Bind("COMPROBANTETIPOESTADO") %>' Enabled="false" />
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
                  <asp:Label ID="olblIDCOMPROBANTETIPO" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCOMPROBANTETIPOCODIGO" runat="server" Text="CODIGO TIPO COMPROBANTE:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtCOMPROBANTETIPOCODIGO" runat="server" CssClass="form-control" MaxLength="10">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCOMPROBANTETIPODESCRIPCION" runat="server" Text="DESCRIPCION TIPO COMPROBANTE:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtCOMPROBANTETIPODESCRIPCION" runat="server" CssClass="form-control"
                     MaxLength="100"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCOMPROBANTETIPOLETRA" runat="server" Text="LETRA COMPROBANTE:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtCOMPROBANTETIPOLETRA" runat="server" CssClass="form-control" MaxLength="1">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCOMPROBANTETIPOPUNTO" runat="server" Text="PUNTO:" CssClass="control-label">
                  </asp:Label>
                  <asp:TextBox ID="otxtCOMPROBANTETIPOPUNTO" runat="server" CssClass="form-control" MaxLength="4">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCOMPROBANTETIPOEXPLICACION" runat="server" Text="EXPLICACION:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtCOMPROBANTETIPOEXPLICACION" runat="server" CssClass="form-control"
                     TextMode="MultiLine" height="500px"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblIDEMPRESASECTOR" runat="server" Text="SECTOR EMPRESA:" CssClass="control-label">
                  </asp:Label>
                  <asp:SqlDataSource ID="odsEMPRESASECTOR" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EMPRESASECTORTraerOddl"
                     SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  <asp:DropDownList ID="oddlEMPRESASECTOR" runat="server" DataSourceID="odsEMPRESASECTOR"
                     DataTextField="EMPRESASECTORDescripcion" DataValueField="IDEMPRESASECTOR" CssClass="form-control">
                  </asp:DropDownList>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCOMPROBANTETIPOESTADO" runat="server" Text="ESTADO:" CssClass="control-label">
                  </asp:Label>
                  <asp:CheckBox ID="otxtCOMPROBANTETIPOESTADO" runat="server" />
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