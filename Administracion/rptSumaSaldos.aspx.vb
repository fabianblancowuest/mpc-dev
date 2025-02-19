
Partial Class Administracion_rptSumaSaldos
    Inherits System.Web.UI.Page

    Protected Sub ogvSumaSaldos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvSumaSaldos.SelectedIndexChanged
        olblIdPlanCuenta.Text = ogvSumaSaldos.SelectedDataKey.Item("idPlanCuenta")
    End Sub
End Class
