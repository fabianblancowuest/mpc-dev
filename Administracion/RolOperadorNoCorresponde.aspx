<%@ Page Title="Acceso a ROL No Asignado" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="RolOperadorNoCorresponde.aspx.vb" Inherits="Administracion_RolOperadorNoCorresponde" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
        <asp:Label ID="Label1" runat="server" Text="Intento de acceso a rol no asignado." Font-Bold ="true" Font-Size ="Large"></asp:Label>
  
        <br />
        <br />

     </div>

    <div>

        <asp:Label ID="Label2" runat="server" Text="El rol al que intenta acceder no le ha sido asignado o se le ha desasignado. "></asp:Label>
    </div>

    <div>

        <asp:Label ID="Label3" runat="server" Text="Solicite el rol al administrador del sistema."></asp:Label>
    </div>
    <div>
        <br />
        <br />
        <br />
        <asp:Button ID="obutRolesAsignados" runat="server" Text="Retornar a Roles Asignados." CssClass="btn btn-primary" />

    </div>
</asp:Content>

