
Partial Class Administracion_LOTEVENTAGESTION
    Inherits System.Web.UI.Page

    Protected Sub ogvBarrioManzanaLote_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvBarrioManzanaLote.SelectedIndexChanged
        olblIDBarrioLoteSeleccionado.Text = ogvBarrioManzanaLote.SelectedDataKey.Item("idBarrioLote")
    End Sub
End Class
