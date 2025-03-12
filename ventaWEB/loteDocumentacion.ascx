<%@ Control Language="VB"  AutoEventWireup="false" CodeFile="loteDocumentacion.ascx.vb" Inherits="ventaWEB_loteDocumentacion" %>
<asp:Label ID="Label1" runat="server" Text="Identificador:" Visible="true"></asp:Label>

<asp:Label ID="olblIDLoteVenta" runat="server" Text="idloteVenta" Visible="true"></asp:Label>
<asp:Label ID="olblIdImagenTipo" runat="server" Text="idimagenTipo" Visible="false"></asp:Label>
<asp:Label ID="olblURLMensaje" runat="server" Text="URL :" Visible ="false"></asp:Label>
<asp:Label ID="olblImagenURL" runat="server" Text=""  Visible ="false"></asp:Label>




<asp:Panel ID="PanelImagen" runat="server">
    <div> 
        <br />
        <br />
<asp:Label ID="olblReferencia" runat="server" Text="" Font-Size ="Large" Font-Bold="true" ForeColor="Blue"></asp:Label>
    </div>
<div>
<asp:Label ID="olblImagenTipoDescripcion" runat="server" Text="" Font-Bold="true"></asp:Label>
</div>
<div>
<asp:Label ID="olblImagenTipoExplicacion" runat="server" Text="" Font-Italic="true"></asp:Label>
</div>
    <table>
        <tr>
           <td>
               
<asp:Image ID="oimgImagen" runat="server" Height ="80%" Width ="80%" ImageUrl="~/miPrimerCasa.png" />


           </td>
            <td>
<asp:Label ID="olblImagenTipoRequiereFechaVto" runat="server" Text=""></asp:Label>
                <br />
<asp:Label ID="olblVendedorIdOperador" runat="server" Text=""></asp:Label>
                <br />
<asp:Label ID="olblVendedorAltaFecha" runat="server" Text=""></asp:Label>
                <br />
<asp:Label ID="olblControlAdministracionOperador" runat="server" Text=""></asp:Label>
                <br />
<asp:Label ID="olblControlAdministracionFecha" runat="server" Text=""></asp:Label>
                <br />
<asp:Label ID="olblControlAdministracionIdNovedad" runat="server" Text=""></asp:Label>
                <br />
<asp:Label ID="olblcontrolTesoreriaOperador" runat="server" Text=""></asp:Label>
                <br />
<asp:Label ID="olblControlTesoreriaFecha" runat="server" Text=""></asp:Label>
                <br />

            </td>
        </tr>
    </table>
    <div>
        <asp:Label ID="Label11" runat="server" Text="Label" Visible="false"></asp:Label>
        <br />
        <asp:Label ID="olblMensajeUpload" runat="server" Text="Mensaje de subida" Visible ="false"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="" Visible ="false"></asp:Label>
        <br />
        <asp:Label ID="olblPrevisualiza" runat="server" Text="Label" Visible ="false"></asp:Label>
    </div>
<div>
    <asp:FileUpload ID="FileUpLoad2" runat="server" />
    <br />
    <asp:Button ID="UploadBtn" Text="Subir Imagen" Height ="100px" Width ="200px" OnClick="UploadBtn_Click" runat="server" CssClass="btn-basic btn btn-success" />
        <br /> <br /> <br />                
</div>



</asp:Panel>

