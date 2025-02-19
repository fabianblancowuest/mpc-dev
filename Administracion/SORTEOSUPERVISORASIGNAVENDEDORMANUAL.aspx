<%@ Page Title="ASIGNACION DE CUPONES A VENDEDORES POR PARTE DE SUPERVISORES" Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="SORTEOSUPERVISORASIGNAVENDEDORMANUAL.aspx.vb" Inherits="Administracion_SORTEOSUPERVISORASIGNAVENDEDORMANUAL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>






<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>

        <h3>
            <asp:Label ID="Label1" runat="server" Text="ASIGNACION DE RANGO DE TALONARIO A VENDEDOR POR PARTE DE SUPERVISOR"></asp:Label>
        </h3>

    </div>
    <asp:Panel ID="PanelTalonario" runat="server" Visible="FALSE">
        <div>
            <asp:SqlDataSource ID="odsSORTEOSUPERVISORASIGNAVENDEDORSTOCK" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SORTEOSUPERVISORASIGNAVENDEDORSTOCK" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idSupervisor" SessionField="idOperador" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="ogvSORTEOTALONARIOPENDIENTEASIGNACIONSUPERVISOR" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsSORTEOSUPERVISORASIGNAVENDEDORSTOCK" EmptyDataText ="NO EXISTEN TALONES LIBRES PARA ASIGNAR" DataKeyNames="idSorteo,idSorteoTalonario,sorteoCodigo,sorteoDescripcion,sorteoNumeroDesde,sorteoNumeroHasta,sorteoTalonTipoDescripcion,DisponibleDesde,DisponibleHasta,Cantidad">
                <Columns>
                    <asp:CommandField SelectText="SELECCIONA TALONARIO" ShowSelectButton="True" />
                    <asp:BoundField DataField="idSorteo" HeaderText="idSorteo" SortExpression="idSorteo" Visible="False" />
                    <asp:BoundField DataField="idSorteoTalonario" HeaderText="idSorteoTalonario" InsertVisible="False" SortExpression="idSorteoTalonario" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="sorteoCodigo" HeaderText="Codigo" SortExpression="sorteoCodigo" />
                    <asp:BoundField DataField="sorteoDescripcion" HeaderText="Sorteo" SortExpression="sorteoDescripcion" />
                    <asp:BoundField DataField="sorteoNumeroDesde" HeaderText="sorteoNumeroDesde" SortExpression="sorteoNumeroDesde" Visible="False" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="sorteoNumeroHasta" HeaderText="sorteoNumeroHasta" SortExpression="sorteoNumeroHasta" Visible="False" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="sorteoTalonTipoDescripcion" HeaderText="Tipo" SortExpression="sorteoTalonTipoDescripcion" >
                    </asp:BoundField>
                    <asp:BoundField DataField="DisponibleDesde" HeaderText="DisponibleDesde" SortExpression="DisponibleDesde" ReadOnly="True" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DisponibleHasta" HeaderText="DisponibleHasta" SortExpression="DisponibleHasta" ReadOnly="True" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" ReadOnly="True" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            
       
        </div>
    </asp:Panel>


    <asp:Panel ID="PanelSupervisor" runat="server" Visible="TRUE">
        <div>
             <asp:Label ID="olblIdSorteoTalonario" runat="server" Text=""  Visible ="false" ></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="Seleccione Vendedor"></asp:Label>
        </div>
        <div>
            <asp:SqlDataSource ID="odsOperador" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SUPERVISORVENDEDORTRAERODDL" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idSupervisor" SessionField="idOperador" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList  ID ="oddlOperador" runat="server" AutoPostBack="True" DataSourceID="odsOperador" DataTextField="operadorDescripcion" DataValueField="idOperador"></asp:DropDownList>
        </div>
        <div>

            <asp:Label ID="Label3" runat="server" Text="Rango Disponible" Font-Bold="true" ></asp:Label>

        </div>
        <div>
               <asp:Label ID="Label4" runat="server" Text="Desde:"></asp:Label>
              <asp:TextBox ID="olblRangoDesde" runat="server"></asp:TextBox>
            <br />

             <asp:Label ID="Label5" runat="server" Text="Hasta:"></asp:Label>
               
            <asp:TextBox ID="olblRangoHasta" runat="server" Enabled ="false"></asp:TextBox>

        </div>

        <div>
            <asp:Label ID="Label6" runat="server" Text="Cantidad de Talones a entregar:"></asp:Label>
            <asp:TextBox ID="otxtCantidadAAsignar" runat="server" Text ="100"></asp:TextBox>
        </div>


          <div>
          <asp:Label ID="Label7" runat="server" Text="Numeracion a asignar:  desde el numero "></asp:Label>
               <asp:Label ID="olblAsignaDesde" runat="server" Text="" Font-Bold="true" ></asp:Label>
               <asp:Label ID="Label8" runat="server" Text= "  al numero " Font-Bold="true" ></asp:Label>

                  <asp:Label ID="olblAsignaHasta" runat="server" Text="" Font-Bold="true" ></asp:Label>
               <asp:Label ID="Label9" runat="server" Text= "  Total: " Font-Bold="true" ></asp:Label>
 <asp:Label ID="olblAsignaCantidad" runat="server" Text= "" Font-Bold="true" ></asp:Label>

              </div>
        <div>
            <asp:SqlDataSource ID="odsSorteoTalonTipo" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SORTEOTALONTIPOTraeroddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                      <asp:DropDownList  ID ="oddlSorteoTalonTipo" runat="server" AutoPostBack="True" DataSourceID="odsSorteoTalontipo" DataTextField="sorteoTalonTipoDescripcion" DataValueField="idSorteoTalonTipo" Enabled ="false"></asp:DropDownList>

        </div>
        <div>
            <asp:Label ID="olblMensaje" runat="server" Text=""></asp:Label>

        </div>
         <div>
            <asp:Button ID="obutPrevisualizar" runat="server" Text="Previsualizar" />

        </div> 
        <asp:Panel ID="PanelSupervisorConfirma" runat="server" Visible ="false">
        <div>

            <br />
            <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible ="false" ></asp:Label>
            <br />

            <asp:Label ID="olblGestionDescripcion" runat="server" Text="" Visible ="true" ForeColor ="Red" Font-Bold ="true"  ></asp:Label>

            <asp:Button ID="obutAsignar" runat="server" Text="Asignar a vendedor" />
             <br />
            <asp:Button ID="obutReingresar" runat="server" Text="Corregir" />
        </div>
  </asp:Panel>

             <div>
                <br />
                <asp:Label ID="Label10" runat="server" Text="Ultimas asignaciones a Vendedores"></asp:Label>
                <asp:SqlDataSource ID="odsSorteoTalonRangoAsignaSupervisorVendedorTraeUltimas" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="[sorteoTalonRangoAsignaSupervisorAVendedorTraeUltimas]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:GridView ID="ogvSorteoTalonRangoAsignaSupervisorTraeUltimas" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsSorteoTalonRangoAsignaSupervisorVendedorTraeUltimas" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="supervisor" HeaderText="supervisor" SortExpression="supervisor" />
                        <asp:BoundField DataField="operador" HeaderText="operador" SortExpression="operador" />
                        <asp:BoundField DataField="desde" HeaderText="desde" SortExpression="desde" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="hasta" HeaderText="hasta" SortExpression="hasta" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cantidadEntregada" HeaderText="cantidad Entregada" SortExpression="cantidadEntregada" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fechaOperacion" HeaderText="fecha Operacion" SortExpression="fechaOperacion" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>     
                
                
                 </div>





    </asp:Panel>

    
</asp:Content>


