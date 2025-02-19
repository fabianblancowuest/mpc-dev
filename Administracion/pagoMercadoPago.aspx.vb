
Partial Class Administracion_pagoMercadoPago
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("https://link.mercadopago.com.ar/pagobilletesorteo")
    End Sub
End Class
