<%@ Page Title="Tesoreria" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="tesoreria.aspx.vb" Inherits="Administracion_tesoreria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>
    <asp:Label ID="Label1" runat="server" Text="Tesoreria"></asp:Label>
</h3>
    <div>
        <asp:RadioButtonList ID="orbTipoOperacion" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True" Value="1">Cobrar</asp:ListItem>
            <asp:ListItem Value="2">Pagar</asp:ListItem>
        </asp:RadioButtonList>

    </div>
</asp:Content>

