
Partial Class Administracion_comprobantePagoReimprime
    Inherits System.Web.UI.Page

    Protected Sub ogvodsComprobantePagoReimprime_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvodsComprobantePagoReimprime.SelectedIndexChanged

        Session.Item("idAsientoCabecera") = ogvodsComprobantePagoReimprime.SelectedDataKey.Item("idAsientoCabecera")

        Response.Redirect("comprobantePago.aspx")

    End Sub
End Class
