<%@ Control Language="VB" AutoEventWireup="false" CodeFile="notificacionOperador.ascx.vb" Inherits="SisFar_ordenCompra_notificacionOperador" %>
<asp:Panel ID="PanelPrincipal" runat="server">

<div>
    <table width = "800px">
    <tr>
        <td>
            <asp:Button ID="olblNotificacionesTitulo" runat="server" Text="Button" />
   
            <asp:Label ID="olblNotificacionesOperador" runat="server" Text=""></asp:Label>
        </td>
 
        <td>
            <asp:Button ID="obutMI" runat="server" Text="MI" ToolTip ="Ir a Rol de Operador para Mensajería Interna" />
        </td>
        <td>
            <asp:Button ID="obutOCP" runat="server" Text="OCP" ToolTip ="Ir a Rol de Operador para tratamiento de ORDENES de Compra Pendientes entrega." />
        </td>
        <td>
            <asp:Button ID="obutPPOC" runat="server" Text="PPOC" ToolTip ="Ir a Rol de Operador para tratamiento de Pedidos con OC pendientes de confección." />
        </td>
        
    
    </tr>
</table>







</div>


</asp:Panel>


<asp:Panel ID="PanelNotificaciones" runat="server" Visible="false">
<div>
    
    <asp:Button ID="obutNotificacionesVolver" runat="server" Text="Volver" />
   
</div>

<div>
    <asp:SqlDataSource ID="odsBusqueda" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ordenCompra %>" 
        SelectCommand="notificacionOperadorPendienteLecturaTipo" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idOperador" SessionField="idOperador" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="ogvBusqueda" runat="server" 
        AutoGenerateColumns="False" CssClass="table-cemmi" 
        DataSourceID="odsBusqueda" 
        DataKeyNames="idNotificacionTipo,notificacionTipoPagina">
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="VER" />
            <asp:BoundField DataField="idNotificacionTipo" 
                HeaderText="idNotificacionTipo" ReadOnly="True" 
                SortExpression="idNotificacionTipo" Visible="False" 
                InsertVisible="False" />
            <asp:BoundField DataField="notificacionTipoCodigo" 
                HeaderText="notificacionTipoCodigo" SortExpression="notificacionTipoCodigo" 
                Visible="False" />
            <asp:BoundField DataField="TipoNotificacion" HeaderText="TipoNotificacion" 
                SortExpression="TipoNotificacion" />
            <asp:BoundField DataField="CantidadNotificaciones" 
                HeaderText="Cantidad Notificaciones" ReadOnly="True" 
                SortExpression="CantidadNotificaciones" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="notificacionTipoPagina" 
                HeaderText="notificacionTipoPagina" SortExpression="notificacionTipoPagina" 
                Visible="False" />
        </Columns>
    </asp:GridView>
</div>



</asp:Panel>