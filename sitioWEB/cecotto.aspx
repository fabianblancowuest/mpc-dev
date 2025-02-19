<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cecotto.aspx.vb" Inherits="sitioWEB_cecotto" %>

<%@ Register Src="~/sitioWEB/barrio.ascx" TagPrefix="uc1" TagName="barrio" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Prueba CANVAS</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script type="text/javascript">
            $(function () {
                var canvas = document.getElementById('canasp');
                var context = canvas.getContext('2d');
                // Rectangles
                context.fillStyle = "rgba(156, 170, 193, 1)";
                context.fillRect(30, 30, 70, 90);
                context.fillStyle = "rgba(0, 109, 141, 1)";
                context.fillRect(10, 10, 70, 90);

                $("#btnSave").on('click', function (e) {
                    e.preventDefault();
                    var imgData = canvas.toDataURL();
                    //alert(imgData);
                    $("#<%=imgASP.ClientID %>")
                    .attr("src", imgData)
                });
            });



        </script>
</head>
<body>




    <form id="form1" runat="server">
        <div>
            <canvas id="canasp" width="100" height="100"></canvas>
            <br />
            <asp:Image ID="imgASP" runat="server" />
            <asp:Button ID="btnSave" runat="server" Text="Save Image"></asp:Button>
        </div>
    </form>
</body>
</html>
