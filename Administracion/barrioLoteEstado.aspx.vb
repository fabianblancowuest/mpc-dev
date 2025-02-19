
Partial Class Administracion_barrioLoteEstado
    Inherits System.Web.UI.Page

    Protected Sub obutGrabarEstado_Click(sender As Object, e As EventArgs) Handles obutGrabarEstado.Click
        grabar()
    End Sub



    Private Sub grabar()
        Session.Item("idOperador") = 1

        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim idLoteVentaEstado As Label
        Dim idBarrioLoteVentaEstado As Label
        Dim ochLoteVentaEstado As CheckBox


        Dim fila As Integer

        olblValidacionMensajeError.Text = ""


        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "loteVentaEstadoMovimientoGraba"
            End With


            For Each Row In ogvloteVentaEstado.Rows


                'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                idLoteVentaEstado = CType(Row.FindControl("idLoteVentaEstado"), Label)
                idBarrioLoteVentaEstado = CType(Row.FindControl("idBarrioLoteVentaEstado"), Label)
                ochLoteVentaEstado = CType(Row.FindControl("ochLoteVentaEstado"), CheckBox)

 
                
                    Try
                    cmd.Parameters.Clear()
                    connection.Open()
                    cmd.Parameters.Add("@idLoteVentaEstado", Data.SqlDbType.Int).SqlValue = idLoteVentaEstado.Text
                    cmd.Parameters.Add("@idLoteVenta", Data.SqlDbType.Int).SqlValue = olblIdLoteVenta.Text
                    cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                    cmd.Parameters.Add("@idBarrioLoteVentaEstado", Data.SqlDbType.Int).SqlValue = idBarrioLoteVentaEstado.Text
                    cmd.Parameters.Add("@estado", Data.SqlDbType.Bit).SqlValue = ochLoteVentaEstado.Checked





                        reader = cmd.ExecuteReader()


                    Catch ex As Exception
                        olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " Error: " + ex.ToString

                    End Try
                    connection.Close()
                

                fila = fila + 1

            Next
        End Using
        ogvloteVentaEstado.DataBind()



    End Sub

End Class
