
Partial Class sitioWEB_vendedorVentaLote
    Inherits System.Web.UI.Page

    Protected Sub ogvBARRIOLOTE_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvBARRIOLOTE.SelectedIndexChanged
        oddlBARRIO.SelectedValue = oddlBARRIOOperador.SelectedValue
        oddlBARRIO.Enabled = False
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        olblIDBARRIOLOTE.Text = ogvBARRIOLOTE.SelectedDataKey.Item("IDBARRIOLOTE")
        oddlBARRIO.SelectedValue = ogvBARRIOLOTE.SelectedDataKey.Item("IDBARRIO")
        otxtBARRIOLOTEMANZANA.Text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEMANZANA")
        otxtBARRIOLOTEPARCELA.Text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEPARCELA")
        otxtBARRIOLOTEFRENTEMETROS.Text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEFRENTEMETROS")
        otxtBARRIOLOTEFONDOMETROS.Text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEFONDOMETROS")
        oddlCOSTOREFERENCIA.SelectedValue = ogvBARRIOLOTE.SelectedDataKey.Item("IDCOSTOREFERENCIA")
        otxtBARRIOLOTEPRECIOREFERENCIA.Text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEPRECIOREFERENCIA")
        otxtBARRIOLOTEADHESIONREFERENCIA.Text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEADHESIONREFERENCIA")
        oddlACTUALIZACIONMODO.SelectedValue = ogvBARRIOLOTE.SelectedDataKey.Item("idActualizacionModo")
        'otxtBARRIOLOTEIMAGEN.Text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEIMAGEN")
        'imgBARRIOLOTEIMAGEN.ImageUrl = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEIMAGEN")
        'otxtBARRIOLOTEESTADO.Checked = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEESTADO")
        'otxtBARRIOLOTEENVENTA.Checked = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEENVENTA")
        'otxtBARRIOLOTEBONIFICADO.Checked = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEBONIFICADO")
        'Panel1.Visible = False
        PanelInicio.Visible = False
        PanelBarrioLote.Visible = True
        PanelBarrioLote.Enabled = False
        PanelVentaBarrioLote.Visible = True
        PanelBarrioLoteComprador.Visible = True
        barrioLoteRecibo.imponeBarrioLote(olblIDBARRIOLOTE.Text)
        otxtBarrioLoteAdhesionPagoACuenta.Text = barrioLoteRecibo.barrioLotePagosCuentaAdhesion(olblIDBARRIOLOTE.Text)







    End Sub

    Protected Sub obutBarrioLoteVolver_Click(sender As Object, e As EventArgs) Handles obutBarrioLoteVolver.Click
        PanelInicio.Visible = True

        PanelBarrioLote.Visible = False
        tesoreriaCobranza.Visible = False
        PanelVentaBarrioLote.Visible = False
        PanelBarrioLoteComprador.Visible = False

    End Sub

  
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            tesoreriaCobranza.validarTotales()
            olblCompradorEstadoCarga.Text = " (Actualmente " + barrioLoteComprador.controlCompradores + IIf(barrioLoteComprador.controlCompradores = "1", " comprador", " compradores") + ")"

            ' olblLoadMensaje.Text = olblLoadMensaje.Text + "+++ pasa por post back +++" + tesoreriaCobranza.esValida

            If tesoreriaCobranza.esValida = "1" Then

                obutBarrioLoteAdhesionConfirma.Visible = True
            Else
                obutBarrioLoteAdhesionConfirma.Visible = False


            End If
        Else
          
            'olblLoadMensaje.Text = olblLoadMensaje.Text + "... [pasa por NO  post back ]....."
        End If
    End Sub

    Protected Sub obutCobrar_Click(sender As Object, e As EventArgs) Handles obutCobrar.Click

        If Val(otxtMontoACuentaAdhesion.Text) + Val(otxtBarrioLoteAdhesionPagoACuenta.Text) > Val(otxtBARRIOLOTEADHESIONREFERENCIA.Text) Then
            otxtMontoACuentaAdhesion.Text = (Val(otxtBARRIOLOTEADHESIONREFERENCIA.Text) - Val(otxtBarrioLoteAdhesionPagoACuenta.Text)).ToString

        End If


        otxtAdhesionSaldo.Text = (Val(otxtBARRIOLOTEADHESIONREFERENCIA.Text) - Val(otxtMontoACuentaAdhesion.Text) - Val(otxtBarrioLoteAdhesionPagoACuenta.Text)).ToString




        tesoreriaCobranza.Visible = True

        tesoreriaCobranza.imponerImporte(otxtMontoACuentaAdhesion.Text)
        tesoreriaCobranza.validarTotales()
        obutCobrar.Visible = False
        otxtMontoACuentaAdhesion.Enabled = False

        obutValorReingreso.Visible = True



    End Sub

    Protected Sub obutValorReingreso_Click(sender As Object, e As EventArgs) Handles obutValorReingreso.Click
        obutCobrar.Visible = True
        obutBarrioLoteAdhesionConfirma.Visible = False

        otxtMontoACuentaAdhesion.Enabled = True

        obutValorReingreso.Visible = False
        tesoreriaCobranza.Visible = False

    End Sub

    Protected Sub obutBarrioLoteAdhesionConfirma_Click(sender As Object, e As EventArgs) Handles obutBarrioLoteAdhesionConfirma.Click
        olblLoadMensaje.Text = "  Referencia " + oddlCOSTOREFERENCIAOperador.SelectedValue.ToString + "  Cantidad " + oddlventaCuotaCantidad.SelectedValue.ToString


        If oddlCOSTOREFERENCIAOperador.SelectedValue = 1 Then
            olblLoadMensaje.Text = "-[Debe Seleccionar Modo de actualizacion de la cuota del lote.]-"

        End If


        If oddlventaCuotaCantidad.SelectedValue = 0 Then
            olblLoadMensaje.Text = olblLoadMensaje.Text + "-[Debe Seleccionar la cantidad de cuotas de financiación.]-"
        End If
    End Sub

    Protected Sub obutCompradorCargar_Click(sender As Object, e As EventArgs) Handles obutCompradorCargar.Click
        If barrioLoteComprador.Visible = False Then
            barrioLoteComprador.Visible = True
            obutCompradorCargar.BackColor = Drawing.Color.Orange
        Else
            barrioLoteComprador.Visible = False
            obutCompradorCargar.BackColor = Drawing.Color.Green
        End If


    End Sub
End Class
