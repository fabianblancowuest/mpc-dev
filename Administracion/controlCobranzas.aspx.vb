
Partial Class Administracion_controlCobranzas
    Inherits System.Web.UI.Page

    Protected Sub oddlBARRIOOperador_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBARRIOOperador.SelectedIndexChanged
        olblBarrio.Text = oddlBARRIOOperador.SelectedItem.ToString
        oddlBarrioManzanaOperador.DataBind()
        OGVodsReporte.DataBind()

        olblBarrio.Visible = False

    End Sub

    Protected Sub oddlBarrioManzanaOperador_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBarrioManzanaOperador.SelectedIndexChanged
        olblManzana.Text = oddlBarrioManzanaOperador.SelectedItem.ToString
        olblManzana.Visible = False
    End Sub
End Class
