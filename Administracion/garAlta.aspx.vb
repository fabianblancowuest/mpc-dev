
Partial Class Administracion_garAlta
    Inherits System.Web.UI.Page

    Protected Sub obutSolicitudAlta_Click(sender As Object, e As EventArgs) Handles obutSolicitudAlta.Click
        garAlta()

    End Sub

    Private Sub garAlta()
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
                .CommandText = "garAlta"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = oddlgarOperadorSelecciona.SelectedValue

                cmd.Parameters.Add("@garSolicitudDescripcion", Data.SqlDbType.Text).SqlValue = otxtSolicitudDescripcion.Text
                cmd.Parameters.Add("@garSolicitudMonto", Data.SqlDbType.Float).SqlValue = otxtSolicitudMonto.Text.Replace(".", ",")
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.Text = reader.Item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                        Session.Item("idGar") = reader.Item("idGar")
                    End While
                End If
            Catch ex As Exception

                olblGestionDescripcion.Text = ex.Message


            End Try
            connection.Close()
        End Using
        If olblGestionCodigo.Text = "1" Then
            otxtSolicitudDescripcion.Text = ""
            otxtSolicitudDescripcion.DataBind()

            otxtSolicitudMonto.Text = "0"
            otxtSolicitudMonto.DataBind()

            PanelAlta.Visible = False
            PanelSolicitud.Visible = True
            odsOperadorGar.DataBind()
        End If
    End Sub

    Protected Sub obutGARAlta_Click(sender As Object, e As EventArgs) Handles obutGARAlta.Click
        PanelAlta.Visible = True
        PanelSolicitud.Visible = False

    End Sub

    Protected Sub obutSolicitudAbandona_Click(sender As Object, e As EventArgs) Handles obutSolicitudAbandona.Click
        PanelAlta.Visible = False
        PanelSolicitud.Visible = True

    End Sub

    Protected Sub ogvOperadorGar_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvOperadorGar.SelectedIndexChanged
        If ogvOperadorGar.SelectedDataKey.Item("idAsientoCabecera").ToString.Trim <> "0" Then
            orbOpcion.SelectedValue = "1"
            PanelGARAutorizado.Visible = True
            PanelGARNoAutorizado.Visible = False
            olblGAROperadorSolicita.Text = oddlgarOperadorSelecciona.SelectedItem.ToString



            olblGARSeleccionadoIDGAR.Text = ogvOperadorGar.SelectedDataKey.Item("idgar")
            olblGARSeleccionadoDescripcion.Text = ogvOperadorGar.SelectedDataKey.Item("garSolicitudDescripcion")
            olblGARSeleccionadoMontoAutorizado.Text = ogvOperadorGar.SelectedDataKey.Item("garAutorizacionMonto")
            PanelAlta.Visible = False
            PanelSolicitud.Visible = False
            PanelOperador.Visible = False
            PanelGastosRegistrados.Visible = True
            ogvGARGastosRegistrados.DataBind()
            garEstadoActualizado()


        Else
            PanelGARAutorizado.Visible = False
            PanelGARNoAutorizado.Visible = True

        End If
    End Sub

    Private Sub garEstadoActualizado()
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
                .CommandText = "garEstadoActualizado"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idGar", Data.SqlDbType.Int).SqlValue = olblGARSeleccionadoIDGAR.Text

                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGARSeleccionadoMontoGastado.Text = reader.Item("GARSeleccionadoMontoGastado")
                        olblGARSeleccionadoSaldo.Text = reader.Item("GARSeleccionadoSaldo")

                    End While
                End If
            Catch ex As Exception

                olblGestionDescripcion.Text = ex.Message


            End Try
            connection.Close()
        End Using

    End Sub
    Private Sub garNoAutorizado()

    End Sub

    Private Sub garAutorizado()

    End Sub

    Protected Sub orbOpcion_SelectedIndexChanged(sender As Object, e As EventArgs) Handles orbOpcion.SelectedIndexChanged
        If orbOpcion.SelectedValue = "1" Then
            ogvOperadorGar.EmptyDataText = "No existen GAR pagados pendientes."
        End If
        If orbOpcion.SelectedValue = "2" Then
            ogvOperadorGar.EmptyDataText = "No existen GAR pendientes de aprobacion o pagados en caja."
        End If
        If orbOpcion.SelectedValue = "3" Then
            ogvOperadorGar.EmptyDataText = "No existen GAR rendidos al 100%."
        End If

    End Sub

     

   
    Protected Sub obutGarGastoVolver_Click(sender As Object, e As EventArgs) Handles obutGarGastoVolver.Click
        PanelGastosRegistrados.Visible = False
        PanelSolicitud.Visible = True
        PanelOperador.Visible = True
        PanelGARAutorizado.Visible = False



    End Sub

    Protected Sub obutGarGastoAlta_Click(sender As Object, e As EventArgs) Handles obutGarGastoAlta.Click
        PanelGastosRegistrados.Visible = False
        PanelGastoRegistro.Visible = True
        PanelGastoRegistro.BackColor = Drawing.Color.Aquamarine

    End Sub

    Protected Sub obutRegistroVolver_Click(sender As Object, e As EventArgs) Handles obutRegistroVolver.Click
        PanelGastoRegistro.Visible = False
        PanelGastosRegistrados.Visible = True

    End Sub

    Protected Sub obutRegistroValidar_Click(sender As Object, e As EventArgs) Handles obutRegistroValidar.Click
        Dim totalGasto As Double
        Dim montoGAR As Double
        Dim montoTransferencia As Double
        Dim montoAcuentaOperador As Double

        totalGasto = otxtGARMontoTotal.Text
        montoGAR = otxtGARMontoGAI.Text
        montoTransferencia = otxtGARMontoTransferencia.Text
        montoAcuentaOperador = otxtGARMontoOperador.Text

        If totalGasto <> 0 Then

            If totalGasto - montoGAR - montoTransferencia - montoAcuentaOperador = 0 Then
                obutRegistroAlta.Visible = True
                obutRegistroValidar.Visible = False
                obutRegistroReingresar.Visible = True
                otxtGARMontoTotal.Enabled = False
                otxtGARMontoGAI.Enabled = False
                otxtGARMontoOperador.Enabled = False
                otxtGARMontoTransferencia.Enabled = False

            Else

            End If
        Else

        End If
    End Sub
End Class
