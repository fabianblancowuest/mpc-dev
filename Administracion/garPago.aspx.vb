
Partial Class Administracion_garPago
    Inherits System.Web.UI.Page

    Protected Sub ogvGarPago_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvGarPago.SelectedIndexChanged
        PanelGARListado.Visible = False
        PanelGARAlta.Visible = True
        olblidgar.text = ogvGarPago.SelectedDataKey.Item("idgar")
        olblOperadorDescripcion.Text = ogvGarPago.SelectedDataKey.Item("operadorDescripcion")
        olblgarAutorizacionMonto.Text = ogvGarPago.SelectedDataKey.Item("garAutorizacionMonto")
        olblgarSolicitudDescripcion .Text = ogvGarPago .SelectedDataKey .Item ("garSolicitudDescripcion")
    End Sub

    Protected Sub obutRetorna_Click(sender As Object, e As EventArgs) Handles obutRetorna.Click
        PanelGARListado.Visible = True
        PanelGARAlta.Visible = False


    End Sub

    Protected Sub obutApruebaEfectivo_Click(sender As Object, e As EventArgs) Handles obutApruebaEfectivo.Click
        garAltaOperadorConfirma()
    End Sub

    Private Sub garAltaOperadorConfirma()
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
                .CommandText = "garAltaOperadorConfirma"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idEmpresaOperador", Data.SqlDbType.Int).SqlValue = Session("idEmpresaOperador")
                cmd.Parameters.Add("@idGar", Data.SqlDbType.Int).SqlValue = olblidgar.Text
                
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.Text = reader.Item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                        olblIdAsientoCabecera.Text = reader.Item("idAsientoCabecera")
                    End While
                End If
            Catch ex As Exception

                olblGestionDescripcion.Text = ex.Message


            End Try
            connection.Close()
        End Using
        ogvGarPago.DataBind()
        If olblGestionCodigo.Text = "0" Then
        Else
            PanelGARAlta.Visible = False
            PanelGARListado.Visible = True
            DataBind()

            Session.Item("idAsientoCabecera") = olblIdAsientoCabecera
            Response.Redirect("comprobantePagoGar.aspx")
        End If
       
    End Sub
End Class
