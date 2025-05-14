
Partial Class Administracion_induccionAlCierre

    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
        Else
            ogvInduccionAlCierre.DataBind()

        End If
    End Sub




    Protected Sub obutMostrar_Click(sender As Object, e As EventArgs) Handles obutMostrar.Click
        If ogvInduccionAlCierre.Visible = False Then
            ogvInduccionAlCierre.Visible = True
            obutMostrar.Text = " Ocultar frases de induccion al cierre."
        Else
            ogvInduccionAlCierre.Visible = False
            obutMostrar.Text = " Mostrar frases de induccion al cierre."
        End If
    End Sub
End Class
