
Partial Class Administracion_testeador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        olblCorreoValidado.Text = correoElectronicoValidador.correoValidadoCodigo()
        olblTelefonoValidado.Text = whatsappValidador.whatsappValidadoCodigo()


    End Sub
End Class
