
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
                olblGestionDescripcion.Text = " Error al ejecutar  LOTEVENTALLAMADAGESTIONALTA" + ex.Message
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

    Protected Sub obutReportePeriodo_Click(sender As Object, e As EventArgs) Handles obutReportePeriodo.Click
        actualizaDatos()

        actualizaGrillas()

        PanelGestion.Visible = False
        PanelReportePeriodo.Visible = True

    End Sub

    Protected Sub obutReporteRetorna_Click(sender As Object, e As EventArgs) Handles obutReporteRetorna.Click
        PanelGestion.Visible = True
        PanelReportePeriodo.Visible = False

    End Sub

    Protected Sub obutReporte_Click(sender As Object, e As EventArgs) Handles obutReporte.Click
        actualizaDatos()

        

        actualizaGrillas()

    End Sub
    Private Sub actualizaDatos()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensajeActualizaDatos.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings(Session("session_conexion"))
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "rptloteVentaLlamadaGestion"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@idLoteVentaLlamada", Data.SqlDbType.Int).SqlValue = oddlLoteVentaLlamada.SelectedValue
                cmd.Parameters.Add("@fechaDesde", Data.SqlDbType.DateTime).SqlValue = oddlFechaDesde.SelectedItem.ToString
                cmd.Parameters.Add("@fechaHasta", Data.SqlDbType.DateTime).SqlValue = oddlFechaHasta.SelectedItem.ToString
                 reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.Text = reader.Item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                        olblMensajeActualizaDatos.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
                olblMensajeActualizaDatos.Text = "Error al ejecutar rptloteVentaLlamadaGestion   " + ex.Message
            End Try
            connection.Close()
        End Using
    End Sub
    Private Sub actualizaGrillas()
        ogvLlamadasRegistradas.DataBind()
        ogvGlobal.DataBind()
        ogvGlobalBarrio.DataBind()
        ogvGlobalBarrioNovedad.DataBind()
        ogvLlamadaDetalle.DataBind()

    End Sub

    Protected Sub oddlFechaDesde_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlFechaDesde.SelectedIndexChanged
        actualizaDatos()
        actualizaGrillas()
    End Sub

    Protected Sub oddlFechaHasta_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlFechaHasta.SelectedIndexChanged
        actualizaDatos()
        actualizaGrillas()
    End Sub

   
    Protected Sub ogvLlamadaDetalle_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvLlamadaDetalle.SelectedIndexChanged
        PanelPanelSuperior.Visible = False
        PanelInferior.Visible = True

        PanelLlamadasPorLote.Visible = False
        obutReporteVolver.Visible = True

        olblReporteIdLoteVenta.Text = ogvLlamadaDetalle.SelectedDataKey.Item("idLoteventa")


        ' idLoteventa, Barrio, Manzana, barrioLoteParcela, cliente, telefono, registros, loteVentaLLamadaTipoDescripcion
        olblReporteLoteSeleccionado.Text = "Manzana:" + ogvLlamadaDetalle.SelectedDataKey.Item("Manzana") + "  Parcela:" + ogvLlamadaDetalle.SelectedDataKey.Item("barrioLoteParcela")
        olblReporteClienteNombres.Text = ogvLlamadaDetalle.SelectedDataKey.Item("cliente")
        'olblReporteClienteDomicilio.Text = ogvLlamadaDetalle.SelectedDataKey.Item("cliente01Domicilio")
        olblReporteClienteTelefonos.Text = ogvLlamadaDetalle.SelectedDataKey.Item("telefono")






        ogvReporteLlamadasRegistradas.DataBind()

        PanelConsultaDesdeReporte.Visible = True

        'PanelReportePeriodo.Visible = False

    End Sub

    Protected Sub obutReporteVolverAlReporte_Click(sender As Object, e As EventArgs) Handles obutReporteVolverAlReporte.Click
        PanelLlamadasPorLote.Visible = True
        PanelConsultaDesdeReporte.Visible = False



    End Sub

    Protected Sub obutReporteVolver_Click(sender As Object, e As EventArgs) Handles obutReporteVolver.Click
        PanelPanelSuperior.Visible = True
        'PanelGestion.Visible = False
        'PanelReportePeriodo.Visible = True

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
        Else
            oddlLoteVentaLlamada.DataBind()

        End If
    End Sub
End Class
