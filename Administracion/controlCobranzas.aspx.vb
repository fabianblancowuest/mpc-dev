
Partial Class Administracion_controlCobranzas
    Inherits System.Web.UI.Page

    Protected Sub oddlBARRIOOperador_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBARRIOOperador.SelectedIndexChanged
        olblBarrio.Text = oddlBARRIOOperador.SelectedItem.ToString
        oddlBarrioManzanaOperador.DataBind()
        OGVodsReporte.DataBind()

        olblBarrio.Visible = False

    End Sub

    Protected Sub oddlBarrioManzanaOperador_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBarrioManzanaOperador.SelectedIndexChanged
        olblManzana.Text = oddlBarrioManzanaOperador.SelectedItem.ToString
        olblManzana.Visible = False
    End Sub

    Protected Sub OGVodsReporte_SelectedIndexChanged(sender As Object, e As EventArgs) Handles OGVodsReporte.SelectedIndexChanged
        olblIdLoteVenta.Text = OGVodsReporte.SelectedDataKey.Item("idLoteVenta")
        olblDocumentacionBarrio.Text = OGVodsReporte.SelectedDataKey.Item("barrio")
        olblDocumentacionManzana.Text = OGVodsReporte.SelectedDataKey.Item("manzana")
        olblDocumentacionParcela.Text = OGVodsReporte.SelectedDataKey.Item("parcela")


        ochDocumentacionReciboAdhesion.Checked = OGVodsReporte.SelectedDataKey.Item("recibosAdhesion")
        ochDocumentacionDNIAnverso.Checked = OGVodsReporte.SelectedDataKey.Item("dniAnverso")
        ochDocumentacionDNIReverso.Checked = OGVodsReporte.SelectedDataKey.Item("dniReverso")
        ochDocumentacionConsentimiento.Checked = OGVodsReporte.SelectedDataKey.Item("consentimiento")
        otxtDocumentacionComentario.Text = OGVodsReporte.SelectedDataKey.Item("comentario")
        PanelBusqueda.Visible = False
        PanelNovedad.Visible = True




    End Sub

    Protected Sub obutAbandona_Click(sender As Object, e As EventArgs) Handles obutAbandona.Click
        PanelNovedad.Visible = False
        PanelBusqueda.Visible = True

    End Sub

    Protected Sub obutActualiza_Click(sender As Object, e As EventArgs) Handles obutActualiza.Click
        controlCobranzaNovedadAlta()
        OGVodsReporte.DataBind()
        PanelNovedad.Visible = False
        PanelBusqueda.Visible = True

    End Sub


    Private Sub controlCobranzaNovedadAlta()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensaje.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings(Session("session_conexion"))
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "controlCobranzaNovedadAlta"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@idLoteVenta", Data.SqlDbType.Int).SqlValue = olblIdLoteVenta.Text
                cmd.Parameters.Add("@recibosAdhesion", Data.SqlDbType.Bit).SqlValue = ochDocumentacionReciboAdhesion.Checked
                cmd.Parameters.Add("@dniAnverso", Data.SqlDbType.Bit).SqlValue = ochDocumentacionDNIAnverso.Checked
                cmd.Parameters.Add("@dniReverso", Data.SqlDbType.Bit).SqlValue = ochDocumentacionDNIReverso.Checked
                cmd.Parameters.Add("@consentimiento", Data.SqlDbType.Bit).SqlValue = ochDocumentacionConsentimiento.Checked
                cmd.Parameters.Add("@comentario", Data.SqlDbType.Char).SqlValue = otxtDocumentacionComentario.Text
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                       
                    End While
                End If
            Catch ex As Exception
                olblMensaje.Text = ex.Message
            End Try
            connection.Close()
        End Using

    End Sub
End Class
