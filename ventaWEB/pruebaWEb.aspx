<%@ Page Title="" Language="VB" MasterPageFile="~/ventaWEB/sorteo.master" AutoEventWireup="false" CodeFile="pruebaWEb.aspx.vb" Inherits="ventaWEB_pruebaWEb" %>

<%@ Register Src="~/Administracion/correoElectronicoValidador.ascx" TagPrefix="uc1" TagName="correoElectronicoValidador" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div>
        <h1>Prueba </h1>
    </div>
    <uc1:correoElectronicoValidador runat="server" ID="correoElectronicoValidador" />



</asp:Content>

