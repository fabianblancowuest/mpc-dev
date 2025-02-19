<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="SORTEOPREMIO.aspx.vb"
   Inherits="STRSYSTEM_Administracion_SORTEOPREMIO" title="Tratamiento Tabla PREMIOS DE SORTEOS" Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <div class="row">
               <h1 class="titulo-rol">
                  <asp:Label ID="olblSORTEOPREMIOTitulo" runat="server" Text="PREMIOS DE SORTEOS"></asp:Label>
               </h1>
            </div>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server">

            <div class="row">

               <div class="form-group">
                  <asp:Label ID="Label1" runat="server" Text="SELECCIONE SORTEO:" CssClass="control-label"></asp:Label>
                  <asp:SqlDataSource ID="odsSORTEOOperador" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SORTEOOPERADORSELECCIONA"
                     SelectCommandType="StoredProcedure">
                     <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                     </SelectParameters>
                  </asp:SqlDataSource>
                  <asp:DropDownList ID="oddlSORTEOOperador" runat="server" DataSourceID="odsSORTEOOPERADOR"
                     DataTextField="SORTEODescripcion" DataValueField="idSORTEO" CssClass="form-control"
                     AutoPostBack="True">
                  </asp:DropDownList>
               </div>
            </div>
            <div>

               <asp:SqlDataSource ID="odsSORTEOPREMIO" runat="server"
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SORTEOPREMIOTRAERID"
                  SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="oddlSORTEOOperador" Name="idSORTEO" PropertyName="SelectedValue"
                        Type="Int16" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvSORTEOPREMIO" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi"
                     AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"
                     DataKeyNames="IDSORTEOPREMIO      ,IDSORTEO   ,SORTEOPREMIOCODIGO        ,SORTEOPREMIODESCRIPCION         ,SORTEOPREMIOEXPLICACION         ,SORTEOPREMIOORDEN        ,SORTEOPREMIOCOSTO        ,SORTEOPREMIOESTADO        "
                     DataSourceID="odsSORTEOPREMIO"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDSORTEOPREMIO" HeaderText="id" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDSORTEOPREMIO" />
                        <asp:BoundField DataField="IDSORTEO" HeaderText="SORTEO" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDSORTEO" />
                        <asp:BoundField DataField="SORTEOPREMIOCODIGO" HeaderText="CODIGO PREMIO"
                           SortExpression="SORTEOPREMIOCODIGO" />
                        <asp:BoundField DataField="SORTEOPREMIODESCRIPCION" HeaderText="DESCRIPCION PREMIO"
                           SortExpression="SORTEOPREMIODESCRIPCION" />
                        <asp:BoundField DataField="SORTEOPREMIOEXPLICACION" HeaderText="EXPLICACION PREMIO"
                           SortExpression="SORTEOPREMIOEXPLICACION" />
                        <asp:BoundField DataField="SORTEOPREMIOORDEN" HeaderText="ORDEN DEL PREMIO EN EL SORTEO"
                           SortExpression="SORTEOPREMIOORDEN">
                           <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SORTEOPREMIOCOSTO" HeaderText="COSTO DEL PREMIO"
                           SortExpression="SORTEOPREMIOCOSTO">
                           <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="ESTADO DEL PREMIO" SortExpression="SORTEOPREMIOESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="SORTEOPREMIOESTADOBox" runat="server"
                                 Checked='<% # Bind("SORTEOPREMIOESTADO") %>' Enabled="false" />
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
                  <asp:Label ID="olblIDSORTEOPREMIO" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblIDSORTEO" runat="server" Text="SORTEO:" CssClass="control-label"></asp:Label>
                  <asp:SqlDataSource ID="odsSORTEO" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                     SelectCommand="SORTEOTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  <asp:DropDownList ID="oddlSORTEO" runat="server" DataSourceID="odsSORTEO"
                     DataTextField="SORTEODescripcion" DataValueField="IDSORTEO" CssClass="form-control">
                  </asp:DropDownList>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblSORTEOPREMIOCODIGO" runat="server" Text="CODIGO PREMIO:" CssClass="control-label">
                  </asp:Label>
                  <asp:TextBox ID="otxtSORTEOPREMIOCODIGO" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblSORTEOPREMIODESCRIPCION" runat="server" Text="DESCRIPCION PREMIO:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtSORTEOPREMIODESCRIPCION" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblSORTEOPREMIOEXPLICACION" runat="server" Text="EXPLICACION PREMIO:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtSORTEOPREMIOEXPLICACION" runat="server" CssClass="form-control"
                     TextMode="MultiLine" height="500px"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblSORTEOPREMIOORDEN" runat="server" Text="ORDEN DEL PREMIO EN EL SORTEO:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtSORTEOPREMIOORDEN" runat="server" CssClass="form-control" MaxLength="4">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblSORTEOPREMIOCOSTO" runat="server" Text="COSTO DEL PREMIO:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtSORTEOPREMIOCOSTO" runat="server" CssClass="form-control" MaxLength="20">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblSORTEOPREMIOESTADO" runat="server" Text="ESTADO DEL PREMIO:"
                     CssClass="control-label"></asp:Label>
                  <asp:CheckBox ID="otxtSORTEOPREMIOESTADO" runat="server" />
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