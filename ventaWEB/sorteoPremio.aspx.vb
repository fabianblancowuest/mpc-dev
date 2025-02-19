
Partial Class ventaWEB_sorteoPremio
    Inherits System.Web.UI.Page
    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs)
        talonVendedorAsientaPremio()
    End Sub

    Private Sub talonVendedorAsientaPremio()

        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim idSorteoTalon As Label
        Dim idSorteoPremio As DropDownList


        Dim fila As Integer

        olblValidacionMensajeErrorPremio.Text = ""
        olblValidacionMensajeErrores.Text = "0"

        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoTalonVendedorAsientaPremio"
            End With
            olblMontoTotal.Text = "0"
            olblCantidadTotal.Text = "0"
            For Each Row In ogvSorteoVendedorTalonSeleccionado.Rows
                Try
                    cmd.Parameters.Clear()

                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    idSorteoTalon = CType(Row.FindControl("olblIdSorteoTalon"), Label)
                    idSorteoPremio = CType(Row.FindControl("oddlPremio"), DropDownList)

                    connection.Open()
                    cmd.Parameters.Add("@idSorteoTalon", Data.SqlDbType.Int).SqlValue = idSorteoTalon.Text
                    cmd.Parameters.Add("@idSorteoPremio", Data.SqlDbType.Int).SqlValue = idSorteoPremio.SelectedValue


                    reader = cmd.ExecuteReader()

                    If reader.HasRows Then
                        While reader.Read
                            olblMontoTotal.Text = (Val(olblMontoTotal.Text) + reader.Item("sorteoPremioCosto"))
                            If reader.Item("sorteoPremioCosto") > 0 Then
                                olblCantidadTotal.Text = (Val(olblCantidadTotal.Text) + 1).ToString
                            Else
                                olblValidacionMensajeErrores.Text = (Val(olblValidacionMensajeErrores.Text) + 1).ToString
                                olblValidacionMensajeErrorPremio.Text = "Debe completar el talón con el premio en cada billete seleccionado."
                            End If

                        End While
                    End If
                Catch ex As Exception
                    olblValidacionMensajeErrorPremio.Text = LTrim(RTrim(olblValidacionMensajeErrorPremio.Text)) + " Error: " + ex.ToString

                End Try
                connection.Close()


                fila = fila + 1

            Next
        End Using


        ogvSorteoVendedorTalonSeleccionado.DataBind()

        If olblValidacionMensajeErrores.Text = "0" And Val(olblCantidadTotal.Text) > 0 Then
            'PanelValores.Visible = True
            otxtLeyendaPago.Visible = True
            obutRealizarPago.Visible = True

        Else
            'PanelValores.Visible = False
            otxtLeyendaPago.Visible = False
            obutRealizarPago.Visible = False

        End If



    End Sub
End Class
