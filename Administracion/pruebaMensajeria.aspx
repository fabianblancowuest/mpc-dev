<%@ Page Title="" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="pruebaMensajeria.aspx.vb" Inherits="Administracion_pruebaMensajeria" %>
<%@ Register Src="~/Administracion/notificacionOperador.ascx" TagPrefix="uc1" TagName="notificacionOperador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
          <uc1:notificacionOperador runat="server" ID="notificacionOperador" />
    </div>
</asp:Content>

