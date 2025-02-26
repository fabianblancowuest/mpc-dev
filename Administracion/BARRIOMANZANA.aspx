<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="BARRIOMANZANA.aspx.vb"
   Inherits="STRSYSTEM_Administracion_BARRIOMANZANA" title="Tratamiento Tabla MANZANAS EN BARRIOS" Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <h1>
               <asp:Label ID="olblBARRIOMANZANATitulo" runat="server" Text="MANZANAS EN BARRIOS"></asp:Label>
            </h1>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server" CssClass="manzanas-en-barrios">

            <div class="row">

               <div class="contenedor-busqueda">
                  <asp:Label ID="Label1" runat="server" Text="SELECCIONE BARRIO:" CssClass="control-label"></asp:Label>
                  <asp:SqlDataSource ID="odsBARRIOOperador" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="BARRIOOPERADORSELECCIONA"
                     SelectCommandType="StoredProcedure">
                     <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                     </SelectParameters>
                  </asp:SqlDataSource>
                  <asp:DropDownList ID="oddlBARRIOOperador" runat="server" DataSourceID="odsBARRIOOPERADOR"
                     DataTextField="BARRIODescripcion" DataValueField="idBARRIO" CssClass="select-busqueda"
                     AutoPostBack="True">
                  </asp:DropDownList>
               </div>
            </div>
            <div class="contenedor-responsive">

               <asp:SqlDataSource ID="odsBARRIOMANZANA" runat="server"
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="BARRIOMANZANATRAERID"
                  SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="oddlBARRIOOperador" Name="idBARRIO" PropertyName="SelectedValue"
                        Type="Int16" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvBARRIOMANZANA" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi"
                     AlternatingRowStyle-CssClass="alt" AllowPaging="False" PageSize="15" PagerStyle-CssClass="pgr"
                     DataKeyNames="IDBARRIOMANZANA      ,IDBARRIO  ,BARRIOMANZANACODIGO        ,BARRIOMANZANADESCRIPCION         ,BARRIOMANZANAEXPLICACION         ,IDBARRIOMANZANASTATUS        ,BARRIOMANZANAESTADO         ,BARRIOMANZANAPRECIOBC         ,BARRIOMANZANABONIFICACION         ,BARRIOMANZANALOTEABLE         "
                     DataSourceID="odsBARRIOMANZANA"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDBARRIOMANZANA" HeaderText="id" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDBARRIOMANZANA" />
                        <asp:BoundField DataField="IDBARRIO" HeaderText="BARRIO" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDBARRIO" />
                        <asp:BoundField DataField="BARRIOMANZANACODIGO" HeaderText="CODIGO MANZANA"
                           SortExpression="BARRIOMANZANACODIGO" />
                        <asp:BoundField DataField="BARRIOMANZANADESCRIPCION" HeaderText="DESCRIPCION MANZANA"
                           SortExpression="BARRIOMANZANADESCRIPCION" />
                        <asp:BoundField DataField="BARRIOMANZANAEXPLICACION" HeaderText="EXPLICACION MANZANA"
                           SortExpression="BARRIOMANZANAEXPLICACION" />
                        <asp:BoundField DataField="IDBARRIOMANZANASTATUS" HeaderText="STATUS" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDBARRIOMANZANASTATUS" />
                        <asp:TemplateField HeaderText="ESTADO" SortExpression="BARRIOMANZANAESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="BARRIOMANZANAESTADOBox" runat="server"
                                 Checked='<% # Bind("BARRIOMANZANAESTADO") %>' Enabled="false" />
                           </ItemTemplate>
                           <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="BARRIOMANZANAPRECIOBC" HeaderText="PRECIO BC"
                           SortExpression="BARRIOMANZANAPRECIOBC">
                           <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="BARRIOMANZANABONIFICACION"
                           HeaderText="BONIFICACION POR COMPRA CONTADO" SortExpression="BARRIOMANZANABONIFICACION">
                           <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="ES LOTEABLE ?" SortExpression="BARRIOMANZANALOTEABLE">
                           <ItemTemplate>
                              <asp:CheckBox ID="BARRIOMANZANALOTEABLEBox" runat="server"
                                 Checked='<% # Bind("BARRIOMANZANALOTEABLE") %>' Enabled="false" />
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
                  <asp:Label ID="olblIDBARRIOMANZANA" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblIDBARRIO" runat="server" Text="BARRIO:" CssClass="control-label"></asp:Label>
                  <asp:SqlDataSource ID="odsBARRIO" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                     SelectCommand="BARRIOTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  <asp:DropDownList ID="oddlBARRIO" runat="server" DataSourceID="odsBARRIO"
                     DataTextField="BARRIODescripcion" DataValueField="IDBARRIO" CssClass="form-control">
                  </asp:DropDownList>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblBARRIOMANZANACODIGO" runat="server" Text="CODIGO MANZANA:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtBARRIOMANZANACODIGO" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblBARRIOMANZANADESCRIPCION" runat="server" Text="DESCRIPCION MANZANA:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtBARRIOMANZANADESCRIPCION" runat="server" CssClass="form-control" MaxLength="150">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblBARRIOMANZANAEXPLICACION" runat="server" Text="EXPLICACION MANZANA:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtBARRIOMANZANAEXPLICACION" runat="server" CssClass="form-control"
                     TextMode="MultiLine" height="500px"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblIDBARRIOMANZANASTATUS" runat="server" Text="STATUS:" CssClass="control-label">
                  </asp:Label>
                  <asp:SqlDataSource ID="odsBARRIOMANZANASTATUS" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="BARRIOMANZANASTATUSTraerOddl"
                     SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  <asp:DropDownList ID="oddlBARRIOMANZANASTATUS" runat="server" DataSourceID="odsBARRIOMANZANASTATUS"
                     DataTextField="BARRIOMANZANASTATUSDescripcion" DataValueField="IDBARRIOMANZANASTATUS"
                     CssClass="form-control">
                  </asp:DropDownList>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblBARRIOMANZANAESTADO" runat="server" Text="ESTADO:" CssClass="control-label">
                  </asp:Label>
                  <asp:CheckBox ID="otxtBARRIOMANZANAESTADO" runat="server" />
               </div>
               <div class="form-group">
                  <asp:Label ID="olblBARRIOMANZANAPRECIOBC" runat="server" Text="PRECIO BC:" CssClass="control-label">
                  </asp:Label>
                  <asp:TextBox ID="otxtBARRIOMANZANAPRECIOBC" runat="server" CssClass="form-control" MaxLength="17">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblBARRIOMANZANABONIFICACION" runat="server" Text="BONIFICACION POR COMPRA CONTADO:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtBARRIOMANZANABONIFICACION" runat="server" CssClass="form-control" MaxLength="17">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblBARRIOMANZANALOTEABLE" runat="server" Text="ES LOTEABLE ?:"
                     CssClass="control-label"></asp:Label>
                  <asp:CheckBox ID="otxtBARRIOMANZANALOTEABLE" runat="server" />
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