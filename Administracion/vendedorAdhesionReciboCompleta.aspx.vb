
Partial Class Administracion_vendedorAdhesionReciboCompleta
    Inherits System.Web.UI.Page

    Protected Sub ogvAdhesionesVendedor_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvAdhesionesVendedor.SelectedIndexChanged
        olblIdLoteVenta.Text = ogvAdhesionesVendedor.SelectedDataKey.Item("idLoteVenta")
        olblBarrio.Text = ogvAdhesionesVendedor.SelectedDataKey.Item("Barrio")
        olblManzana.Text = ogvAdhesionesVendedor.SelectedDataKey.Item("MZ")
        olblParcela.Text = ogvAdhesionesVendedor.SelectedDataKey.Item("PC")
        olblComprador.Text = LTrim(RTrim(ogvAdhesionesVendedor.SelectedDataKey.Item("cliente01Nombre"))) + " " + ogvAdhesionesVendedor.SelectedDataKey.Item("cliente02Nombre")
        olblTelefonos.Text = LTrim(RTrim(ogvAdhesionesVendedor.SelectedDataKey.Item("cliente01Telefono"))) + " " + ogvAdhesionesVendedor.SelectedDataKey.Item("cliente02Telefono")
        olblAdhesionMonto.Text = ogvAdhesionesVendedor.SelectedDataKey.Item("loteVentaAdhesionMonto")
        olblPagosAcumulados.Text = ogvAdhesionesVendedor.SelectedDataKey.Item("Cobrado")
        olblAdhesionSaldo.Text = ogvAdhesionesVendedor.SelectedDataKey.Item("saldoAdhesion")
        PanelRecibosVendedor.Visible = True
        ogvLoteVentaRecibo.DataBind()
        PanelRecibosVendedor.Visible = True
        PanelAdhesiones.Visible = False
        oddlVendedorAdhesion.Enabled = False




    End Sub

    Protected Sub obutReciboVolver_Click(sender As Object, e As EventArgs) Handles obutReciboVolver.Click
        PanelRecibosVendedor.Visible = False
        PanelAdhesiones.Visible = True
        oddlVendedorAdhesion.Enabled = True


    End Sub
End Class
