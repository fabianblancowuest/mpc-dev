
Partial Class Administracion_sorteoRendicionComprobante
    Inherits System.Web.UI.Page

    Protected Sub otxtUltimas_TextChanged(sender As Object, e As EventArgs) Handles otxtUltimas.TextChanged

    End Sub

    Protected Sub ogvSorteoRendicionUltimas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvSorteoRendicionUltimas.SelectedIndexChanged
       
        cargarCabecera()

        PanelUltimas.Visible = False
        PanelRendicion.Visible = True

    End Sub

    Private Sub cargarCabecera()

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
                .CommandText = "sorteoRendicionCabeceraImprime"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idSorteoRendicion", Data.SqlDbType.Int).SqlValue = ogvSorteoRendicionUltimas.SelectedDataKey.Item("idSorteoRendicion")
                
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblIdRendicion.Text = Right("0000000000" + LTrim(RTrim(reader.Item("idSorteoRendicion").ToString)), 8)
                        olblRendicionFecha.Text = reader.Item("fechaRendicion").ToString
                        olblOperadorRecibe.Text = reader.Item("operadorRecibe")
                        olblOperadorRinde.Text = reader.Item("operadorRinde")
                        'olblTotalRendicionLeyenda.Text = reader.Item("TotalRendicionLeyenda")
                        'olblTotalEfectivoLeyenda.Text = reader.Item("TotalEfectivoLeyenda")
                        'olblTotalTransferenciaLeyenda.Text = reader.Item("TotalTransferenciasLeyenda")
                        olblRecibeConforme.Text = reader.Item("operadorRecibe")
                        olblAnticipoVendedorLeyenda.Text = reader.Item("operadorRinde")
                        'olblRendicionObservaciones.Text = reader.Item("aCuentaVendedorLeyenda")
                        olblAnticipoMontoLeyenda.Text = "$" + reader.Item("aCuentaVendedor").ToString + " (" + reader.Item("anticipoMontoLeyenda").ToString + ")"
                        If Val(reader.Item("aCuentaVendedor").ToString) = 0 Then
                            PanelACuenta.Visible = False
                        Else
                            PanelACuenta.Visible = True

                        End If

                    End While
                End If
            Catch ex As Exception
            End Try
            connection.Close()
        End Using
    End Sub
End Class
