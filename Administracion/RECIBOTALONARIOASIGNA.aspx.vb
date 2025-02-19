
Partial Class Administracion_RECIBOTALONARIOASIGNA
    Inherits System.Web.UI.Page

    Protected Sub ogvreciboTalonarioAsignar_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvreciboTalonarioAsignar.SelectedIndexChanged
        PanelTalonario.Visible = False
        olblIdReciboTalonario.Text = ogvreciboTalonarioAsignar.SelectedDataKey.Item("id")
        ogvreciboTraerTalonario.DataBind()

        PanelOperadorReciboAsigna.Visible = True

    End Sub

    Protected Sub obutReciboTalonarioAsignaOperador_Click(sender As Object, e As EventArgs) Handles obutReciboTalonarioAsignaOperador.Click
        If oddlOperador.SelectedValue <> 0 Then



            ' Alta de operacion de asignacion
            olblMensajeAsignacion.Text = ""
            PanelOperadorReciboAsigna.Visible = False
            PanelReciboTalonarioAsignado.Visible = True
            reciboAsignacionCabecera()
            reciboAsignacionDetalle()
        Else
            olblMensajeAsignacion.Text = "SELECCIONE OPERADOR PARA ASIGNAR LOS RECIBOS"
        End If

    End Sub


    Private Sub reciboAsignacionCabecera()
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
                .CommandText = "reciboAsignacionCabeceraAlta"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idOperador")

                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblIdReciboAsignacionCabecera.Text = reader.Item("idReciboAsignacionCabecera")
                    End While
                End If
            Catch ex As Exception
                olblValidacionMensajeError.Text = ex.Message

            End Try
            connection.Close()
        End Using
    End Sub

    Private Sub reciboAsignacionDetalle()
        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim ochkAsigna As CheckBox
        Dim idRecibo As Label

      
        Dim fila As Integer

        olblValidacionMensajeError.Text = ""


        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "reciboAsignacionDetalleAlta"
            End With

            olblMensaje.Text = ""
            For Each Row In ogvreciboTraerTalonario.Rows
                Try
                    cmd.Parameters.Clear()

                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    ochkAsigna = CType(Row.FindControl("ochkAsigna"), CheckBox)
                    idRecibo = CType(Row.FindControl("olblIdRecibo"), Label)
                    If ochkAsigna.Checked Then


                        connection.Open()
                        cmd.Parameters.Add("@idReciboAsignacionCabecera", Data.SqlDbType.Int).SqlValue = olblIdReciboAsignacionCabecera.Text
                        cmd.Parameters.Add("@idRecibo", Data.SqlDbType.Int).SqlValue = idRecibo.Text
                        cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = oddlOperador.SelectedValue

                        reader = cmd.ExecuteReader()
                        If reader.HasRows Then
                            While reader.Read
                                olblMensaje.Text = olblMensaje.Text + " [" + reader.Item("idReciboAsignacionDetalle").ToString + "] -"

                            End While
                        End If
                    End If
                Catch ex As Exception
                    olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " Error: " + ex.ToString

                End Try
                connection.Close()



                fila = fila + 1

            Next
        End Using
    End Sub





    Protected Sub obutReciboAsignacionVolver_Click(sender As Object, e As EventArgs) Handles obutReciboAsignacionVolver.Click
        ogvreciboTalonarioAsignar.DataBind()
        ogvreciboTraerultimoAsignado.DataBind()

        PanelReciboTalonarioAsignado.Visible = False
        PanelTalonario.Visible = True

    End Sub
End Class
