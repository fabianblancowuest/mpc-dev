
Partial Class Administracion_BarrioLoteAdhesionConsulta
    Inherits System.Web.UI.Page

    Protected Sub orbOpcion_SelectedIndexChanged(sender As Object, e As EventArgs) Handles orbOpcion.SelectedIndexChanged
        If orbOpcion.SelectedValue = "1" Then
            PanelCadena.Visible = False
            PanelManzana.Visible = True
            otxtCadena.Text = ""
            ogvrptBarrioManzanaParcelaVenta.DataBind()

        Else
            PanelCadena.Visible = True
            PanelManzana.Visible = False

        End If
    End Sub

    Protected Sub obutBuscar_Click(sender As Object, e As EventArgs) Handles obutBuscar.Click
        ogvrptBarrioManzanaParcelaVenta.DataBind()
    End Sub

    Protected Sub otxtCadena_TextChanged(sender As Object, e As EventArgs) Handles otxtCadena.TextChanged
        ogvrptBarrioManzanaParcelaVenta.DataBind()
    End Sub

    Protected Sub oddlBarrioHabilitadoManzanaSelecciona_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBarrioHabilitadoManzanaSelecciona.SelectedIndexChanged
        ogvrptBarrioManzanaParcelaVenta.DataBind()
    End Sub
End Class
