
Partial Class Administracion_rptLoteVentaLlamada
    Inherits System.Web.UI.Page

    Protected Sub ogvrptloteVentaLlamada_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvrptloteVentaLlamada.SelectedIndexChanged
        PanelReporte.Visible = False
        PanelRegistroLlamada.Visible = True

        olblIdLoteVenta.Text = ogvrptloteVentaLlamada.SelectedDataKey.Item("idLoteVenta")
        olblLoteSeleccionado.Text = "Manzana:" + ogvrptloteVentaLlamada.SelectedDataKey.Item("Manzana") +
            ogvrptloteVentaLlamada.SelectedDataKey.Item("Parcela")
        olblClienteNombres.Text = ogvrptloteVentaLlamada.SelectedDataKey.Item("cliente01Nombre") + " - " + ogvrptloteVentaLlamada.SelectedDataKey.Item("cliente02Nombre")
        olblClienteDomicilio.Text = ogvrptloteVentaLlamada.SelectedDataKey.Item("cliente01Domicilio") + " - " + ogvrptloteVentaLlamada.SelectedDataKey.Item("cliente02Domicilio")
        olblClienteTelefonos.Text = ogvrptloteVentaLlamada.SelectedDataKey.Item("cliente01Telefono") + " - " + ogvrptloteVentaLlamada.SelectedDataKey.Item("cliente02Telefono")




         

    End Sub

    Protected Sub obutNovedad_Click(sender As Object, e As EventArgs) Handles obutNovedad.Click
        PanelAlta.Visible = True
        oddlOPERADOR.SelectedValue = Session("session_idOperador")
        otxtLOTEVENTALLAMADAFECHA.Text = Date.Today
        otxtLOTEVENTALLAMADAFECHA.Enabled = False
        oddlOPERADOR.Enabled = False
        oddlLoteVentaBarrioRecibo.Visible = False
        olblLoteSeleccionado.Visible = False

    End Sub
End Class
