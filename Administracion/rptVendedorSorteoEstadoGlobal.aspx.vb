
Partial Class Administracion_rptVendedorSorteoEstadoGlobal
    Inherits System.Web.UI.Page

    Protected Sub obutGuardarCambios_Click(sender As Object, e As EventArgs) Handles obutGuardarCambios.Click
        PanelBonos.Visible = False
        PanelFinal.Visible = True

        sorteoTalonVendedorModificaGuardarCambios()
    End Sub



    Private Sub sorteoTalonVendedorModificaGuardarCambios()


        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim idSorteoTalon As Label
        Dim apellidoYNombres As TextBox
        Dim celularNumero As TextBox
        Dim correoElectronico As TextBox


        Dim fila As Integer

        olblValidacionMensajeError.Text = ""


        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoTalonVendedorModificaGuardarCambios"
            End With


            For Each Row In ogvrptVendedorSorteoEstadoGlobal.Rows
                Try
                    cmd.Parameters.Clear()

                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    idSorteoTalon = CType(Row.FindControl("olblidSorteoTalon"), Label)
                    apellidoYNombres = CType(Row.FindControl("otxtapellidoYNombres"), TextBox)
                    celularNumero = CType(Row.FindControl("otxtcelularNumero"), TextBox)
                    correoElectronico = CType(Row.FindControl("otxtcorreoElectronico"), TextBox)

                    connection.Open()

                    cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idOperador")

                    cmd.Parameters.Add("@idSorteoTalon", Data.SqlDbType.Int).SqlValue = idSorteoTalon.Text
                    cmd.Parameters.Add("@apellidoYNombres", Data.SqlDbType.Text).SqlValue = apellidoYNombres.Text
                    cmd.Parameters.Add("@celularNumero", Data.SqlDbType.Text).SqlValue = celularNumero.Text
                    cmd.Parameters.Add("@correoElectronico", Data.SqlDbType.Text).SqlValue = correoElectronico.Text

                    


                    reader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read
                            olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + reader.Item("gestionDescripcion")
                        End While
                    End If

                Catch ex As Exception
                    olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + ex.Message

                End Try
                connection.Close()



                fila = fila + 1

            Next

        End Using
    End Sub

    Protected Sub obutRetorna_Click(sender As Object, e As EventArgs) Handles obutRetorna.Click
        Response.Redirect("inicioCorrecto.aspx")
    End Sub
End Class
