<%@ Page Language="VB" MaintainScrollPositionOnPostback="true" AutoEventWireup="false" CodeFile="pruebaDocumentacion.aspx.vb" Inherits="ventaWEB_pruebaDocumentacion" %>

<%@ Register Src="~/ventaWEB/loteDocumentacion.ascx" TagPrefix="uc1" TagName="loteDocumentacion" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Carga Iagenes</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/bootstrap-pachu.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="olblIdLoteVenta" runat="server" Text="1751"></asp:Label>
        
        <asp:Label ID="olblCliente01Nombre" runat="server" Text="Cliente 01 Pablo "  Visible ="false" ></asp:Label>
        <asp:Label ID="olblCliente02Nombre" runat="server" Text="Cliente 02 Mariela" Visible="false"></asp:Label>

    <uc1:loteDocumentacion runat="server" ID="persona1DocumentoAnverso" />
    <uc1:loteDocumentacion runat="server" ID="persona1DocumentoReverso" />
    <uc1:loteDocumentacion runat="server" ID="persona2DocumentoAnverso" />
    <uc1:loteDocumentacion runat="server" ID="persona2DocumentoReverso" />
    <uc1:loteDocumentacion runat="server" ID="consentimientoInformado" />
    <uc1:loteDocumentacion runat="server" ID="recibo1" />
    <uc1:loteDocumentacion runat="server" ID="transferencia1" />
    <uc1:loteDocumentacion runat="server" ID="recibo2" />
    <uc1:loteDocumentacion runat="server" ID="transferencia2" />
    <uc1:loteDocumentacion runat="server" ID="recibo3" />
    <uc1:loteDocumentacion runat="server" ID="transferencia3" />


    </div>
    </form>
</body>
</html>
