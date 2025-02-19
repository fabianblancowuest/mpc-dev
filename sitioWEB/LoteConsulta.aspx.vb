
Partial Class sitioWEB_LoteConsulta
    Inherits System.Web.UI.Page

    Protected Sub obutDeseaAsesoramiento_Click(sender As Object, e As EventArgs) Handles obutDeseaAsesoramiento.Click
        PanelBotones.Visible = False

        PanelAlta.Visible = True

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        olblMensaje.Text = "La solicitud ha sido remitida . En breve será contactado por un representante de la Empresa MI PRIMER CASA"
        Button1.Visible = False




    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        PanelBotones.Visible = True
        PanelAlta.Visible = False

    End Sub
End Class
