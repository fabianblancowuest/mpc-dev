<%@ Page Title="ASIGNACION DE RANGO DE TALONARIO A SUPERVISOR" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="SORTEOASIGNARANGOSUP.aspx.vb" Inherits="Administracion_SORTEOASIGNARANGOSUP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>

        <h1>
            <asp:Label ID="Label1" runat="server" Text="ASIGNACIÓN DE RANGO DE TALONARIO A SUPERVISOR"></asp:Label>
        </h1>

    </div>
    <asp:Panel ID="PanelTalonario" runat="server" Visible="true">
        <div>
            <asp:SqlDataSource ID="odsSORTEOTALONARIOPENDIENTEASIGNACIONSUPERVISOR" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SORTEOTALONARIOPENDIENTEASIGNACIONSUPERVISOR" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

            <asp:GridView ID="ogvSORTEOTALONARIOPENDIENTEASIGNACIONSUPERVISOR" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi talonarios-grid" DataKeyNames="idSorteo,idSorteoTalonario,sorteoCodigo,sorteoDescripcion,fechaHasta,sorteoNumeroDesde,sorteoNumeroHasta,ENTREGADODESDE,ENTREGADOHASTA,ENTREGADOS,RESTAN" DataSourceID="odsSORTEOTALONARIOPENDIENTEASIGNACIONSUPERVISOR" EmptyDataText ="NO EXISTEN TALONES LIBRES PARA ASIGNAR">
                <Columns>
                    <asp:CommandField SelectText="Selecciona Talonario" ShowSelectButton="True"/>
                    <asp:BoundField DataField="idSorteo" HeaderText="idSorteo" InsertVisible="False" ReadOnly="True" SortExpression="idSorteo" Visible="False" />
                    <asp:BoundField DataField="idSorteoTalonario" HeaderText="idSorteoTalonario" InsertVisible="False" SortExpression="idSorteoTalonario" Visible="False" />
                    <asp:BoundField DataField="sorteoCodigo" HeaderText="Sorteo" SortExpression="sorteoCodigo" />
                    <asp:BoundField DataField="sorteoDescripcion" HeaderText="Descripcion Sorteo" SortExpression="sorteoDescripcion" />
                    <asp:BoundField DataField="fechaHasta" HeaderText="Fecha Limite Venta" SortExpression="fechaHasta" />
                    <asp:BoundField DataField="sorteoNumeroDesde" HeaderText="Numero Desde" SortExpression="sorteoNumeroDesde" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="sorteoNumeroHasta" HeaderText="Numero Hasta" SortExpression="sorteoNumeroHasta" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ENTREGADODESDE" HeaderText="ENTREGADO DESDE" SortExpression="ENTREGADODESDE" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ENTREGADOHASTA" HeaderText="ENTREGADO HASTA" SortExpression="ENTREGADOHASTA" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ENTREGADOS" HeaderText="ENTREGADOS" SortExpression="ENTREGADOS" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="RESTAN" HeaderText="RESTAN" SortExpression="RESTAN" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <div>
                <asp:Label ID="Label11" runat="server" Text="Talones sin asignar por supervisor" CssClass="subtitulo-rol"></asp:Label>
                <asp:SqlDataSource ID="odsSorteoSupervisorTalonStock" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoSupervisorTalonStock" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:GridView ID="ogvSorteoSupervisorTalonStock" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsSorteoSupervisorTalonStock">
                    <Columns>
                        <asp:BoundField DataField="idSupervisor" HeaderText="idSupervisor" SortExpression="idSupervisor" Visible="False" />
                        <asp:BoundField DataField="operadorDescripcion" HeaderText="operador" SortExpression="operadorDescripcion" />
                        <asp:BoundField DataField="sorteoTalonTipoDescripcion" HeaderText="Tipo Talon" SortExpression="sorteoTalonTipoDescripcion" />
                        <asp:BoundField DataField="NoAsignados" HeaderText="No Asignados" ReadOnly="True" SortExpression="NoAsignados">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
            <div>
                <br />
                <asp:Label ID="Label10" runat="server" Text="Ultimas asignaciones a supervisores" CssClass="subtitulo-rol"></asp:Label>
                <asp:SqlDataSource ID="odsSorteoTalonRangoAsignaSupervisorTraeUltimas" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoTalonRangoAsignaSupervisorTraeUltimas" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:GridView ID="ogvSorteoTalonRangoAsignaSupervisorTraeUltimas" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsSorteoTalonRangoAsignaSupervisorTraeUltimas">
                    <Columns>
                        <asp:BoundField DataField="operador" HeaderText="operador" SortExpression="operador" />
                        <asp:BoundField DataField="supervisor" HeaderText="supervisor" SortExpression="supervisor" />
                        <asp:BoundField DataField="desde" HeaderText="desde" SortExpression="desde" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="hasta" HeaderText="hasta" SortExpression="hasta" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cantidadEntregada" HeaderText="cantidad Entregada" SortExpression="cantidadEntregada">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="tipoTalonario" HeaderText="tipoTalonario" SortExpression="tipoTalonario" />
                        <asp:BoundField DataField="fechaOperacion" HeaderText="fechaOperacion" SortExpression="fechaOperacion" />
                    </Columns>
                </asp:GridView>     
                
                
                 </div>
        </div>
    </asp:Panel>


    <asp:Panel ID="PanelSupervisor" runat="server" Visible="false" CssClass="contenedor-flexible margenes-y talonario-supervisor">
        <div>
             <asp:Label ID="olblIdSorteoTalonario" runat="server" Text="" ></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="Seleccione Supervisor"></asp:Label>
        </div>
        <div>
            <asp:SqlDataSource ID="odsSupervisor" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SUPERVISORTRAERODDL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:DropDownList  ID ="oddlSupervisor" runat="server" AutoPostBack="True" DataSourceID="odsSupervisor" DataTextField="supervisorDescripcion" DataValueField="idSupervisor"></asp:DropDownList>
        </div>
        <div>

            <asp:Label ID="Label3" runat="server" Text="Rango Disponible" Font-Bold="true" ></asp:Label>

        </div>
        <div>
               <asp:Label ID="Label4" runat="server" Text="Desde:"></asp:Label>
               <asp:Label ID="olblRangoDesde" runat="server" Text="" Font-Bold ="true" ></asp:Label>
            <br />

             <asp:Label ID="Label5" runat="server" Text="Hasta:"></asp:Label>
               <asp:Label ID="olblRangoHasta" runat="server" Text="" Font-Bold="true" ></asp:Label>


        </div>

        <div>
            <asp:Label ID="Label6" runat="server" Text="Cantidad de Talones a entregar:"></asp:Label>
            <asp:TextBox ID="otxtCantidadAAsignar" runat="server" Text ="100"></asp:TextBox>
        </div>


          <div>
          <asp:Label ID="Label7" runat="server" Text="Numeración a asignar:  desde el numero "></asp:Label>
               <asp:Label ID="olblAsignaDesde" runat="server" Text="" Font-Bold="true" ></asp:Label>
               <asp:Label ID="Label8" runat="server" Text= "  al numero " Font-Bold="true" ></asp:Label>

                  <asp:Label ID="olblAsignaHasta" runat="server" Text="" Font-Bold="true" ></asp:Label>
               <asp:Label ID="Label9" runat="server" Text= "  Total: " Font-Bold="true" ></asp:Label>
 <asp:Label ID="olblAsignaCantidad" runat="server" Text= "" Font-Bold="true" ></asp:Label>

              </div>
        <div>
            <asp:SqlDataSource ID="odsSorteoTalonTipo" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SORTEOTALONTIPOTraeroddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                      <asp:DropDownList  ID ="oddlSorteoTalonTipo" runat="server" AutoPostBack="True" DataSourceID="odsSorteoTalontipo" DataTextField="sorteoTalonTipoDescripcion" DataValueField="idSorteoTalonTipo"></asp:DropDownList>

        </div>
        <div>
            <asp:Label ID="olblMensaje" runat="server" Text=""></asp:Label>

        </div>
         <div>
            <asp:Button ID="obutPrevisualizar" runat="server" Text="Previsualizar" CssClass="btn btn-basic btn-primary" />

        </div>  </asp:Panel>

    <asp:Panel ID="PanelSupervisorConfirma" runat="server" Visible ="false">
        <div>

            <br />
            <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible ="false" ></asp:Label>
            <br />

            <asp:Label ID="olblGestionDescripcion" runat="server" Text="" Visible ="true" ForeColor ="Red" Font-Bold ="true"  ></asp:Label>

            <asp:Button ID="obutAsignar" runat="server" Text="Asignar a Supervisor" />
             <br />
            <asp:Button ID="obutReingresar" runat="server" Text="Corregir" />
        </div>
  </asp:Panel>
</asp:Content>

