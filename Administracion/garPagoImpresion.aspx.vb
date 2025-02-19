
Partial Class Administracion_garPagoImpresion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
        Else
            olblIdAsientoCabecera.Text = Session("idAsientoCabecera").text

        End If


    End Sub
End Class
