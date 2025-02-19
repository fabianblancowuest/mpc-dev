
Partial Class Administracion_rptCarpetasEstadoVendedor

    Inherits System.Web.UI.Page

    Protected Sub ochEstado_CheckedChanged(sender As Object, e As EventArgs) Handles ochEstado.CheckedChanged
        If ochEstado.Checked = True Then
            olblTitulo.Text = "Reporte de carpetas firmadas por proveedor"
        Else
            olblTitulo.Text = "Reporte de carpetas pendientes de firma por parte de proveedor"
        End If
    End Sub
End Class
