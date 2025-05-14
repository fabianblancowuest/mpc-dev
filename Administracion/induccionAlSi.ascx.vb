
Partial Class Administracion_induccionAlSi
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
        Else
            ogvInduccionAlSi.DataBind()

        End If
    End Sub




    Protected Sub obutMostrar_Click(sender As Object, e As EventArgs) Handles obutMostrar.Click
        If ogvInduccionAlSi.Visible = False Then
            ogvInduccionAlSi.Visible = True
            obutMostrar.Text = " Ocultar frases de induccion al sí."
        Else
            ogvInduccionAlSi.Visible = False
            obutMostrar.Text = " Mostrar frases de induccion al sí."
        End If
    End Sub
End Class
