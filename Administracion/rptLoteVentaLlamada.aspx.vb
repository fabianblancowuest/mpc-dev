
Partial Class Administracion_rptLoteVentaLlamada
    Inherits System.Web.UI.Page

    Protected Sub ogvrptloteVentaLlamada_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvrptloteVentaLlamada.SelectedIndexChanged
        obutReporteActualiza.Visible = False

        PanelReporte.Visible = False
        PanelRegistroLlamada.Visible = True

        olblIdLoteVenta.Text = ogvrptloteVentaLlamada.SelectedDataKey.Item("idLoteVenta")
        olblLoteSeleccionado.Text = "Manzana:" + ogvrptloteVentaLlamada.SelectedDataKey.Item("Manzana") + "  Parcela:" + ogvrptloteVentaLlamada.SelectedDataKey.Item("parcela")
        olblClienteNombres.Text = ogvrptloteVentaLlamada.SelectedDataKey.Item("cliente01Nombre") + " - " + ogvrptloteVentaLlamada.SelectedDataKey.Item("cliente02Nombre")
        olblClienteDomicilio.Text = ogvrptloteVentaLlamada.SelectedDataKey.Item("cliente01Domicilio") + " - " + ogvrptloteVentaLlamada.SelectedDataKey.Item("cliente02Domicilio")
        olblClienteTelefonos.Text = ogvrptloteVentaLlamada.SelectedDataKey.Item("cliente01Telefono") + " - " + ogvrptloteVentaLlamada.SelectedDataKey.Item("cliente02Telefono")




         

    End Sub

    Protected Sub obutNovedad_Click(sender As Object, e As EventArgs) Handles obutNovedad.Click
        PanelAlta.Visible = True
        PanelRegistroLlamada.Visible = False

        oddlOPERADOR.SelectedValue = Session("session_idOperador")
        otxtLOTEVENTALLAMADAFECHA.Text = Date.Today
        otxtLOTEVENTALLAMADAFECHA.Enabled = False
        oddlOPERADOR.Enabled = False
        oddlLoteVentaBarrioRecibo.Visible = True
        olblLoteSeleccionado.Visible = True

    End Sub

    Protected Sub obutAltaConfirmada_Click(sender As Object, e As EventArgs) Handles obutAltaConfirmada.Click
        loteVentaLlamadaAltaGestion()
        ogvLlamadasRegistradas.DataBind()
        PanelAlta.Visible = False
        PanelRegistroLlamada.Visible = True


    End Sub


    Private Sub loteVentaLlamadaAltaGestion()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings(Session("session_conexion"))
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "LOTEVENTALLAMADAGESTIONALTA"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@IDLOTEVENTALLAMADAGESTION", Data.SqlDbType.Int).SqlValue = "0"
                cmd.Parameters.Add("@IDLOTEVENTA", Data.SqlDbType.Int).SqlValue = olblIdLoteVenta.Text
                cmd.Parameters.Add("@IDLOTEVENTALLAMADATIPO", Data.SqlDbType.Int).SqlValue = oddlLOTEVENTALLAMADATIPO.SelectedValue
                cmd.Parameters.Add("@LOTEVENTALLAMADACOMENTARIO", Data.SqlDbType.Char).SqlValue = otxtLOTEVENTALLAMADACOMENTARIO.Text
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.Text = reader.Item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
                olblGestionDescripcion.Text = ex.Message
            End Try
            connection.Close()
        End Using
    End Sub

    Protected Sub obutVolverAlReporte_Click(sender As Object, e As EventArgs) Handles obutVolverAlReporte.Click
        obutReporteActualiza.Visible = True

        PanelReporte.Visible = True
        PanelRegistroLlamada.Visible = False

    End Sub

    Protected Sub obutAltaAbandonada_Click(sender As Object, e As EventArgs) Handles obutAltaAbandonada.Click
        PanelAlta.Visible = False
        PanelRegistroLlamada.Visible = True

    End Sub

    Protected Sub obutReporteActualiza_Click(sender As Object, e As EventArgs) Handles obutReporteActualiza.Click
        ogvrptloteVentaLlamada.DataBind()

    End Sub
End Class
