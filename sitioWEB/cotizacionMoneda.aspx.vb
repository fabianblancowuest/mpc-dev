
Partial Class sitioWEB_cotizacionMoneda
    Inherits System.Web.UI.Page

    Protected Sub obutCotizacionActualiza_Click(sender As Object, e As EventArgs) Handles obutCotizacionActualiza.Click
        cotizacionActualizaFecha()

    End Sub


    Private Sub cotizacionActualizaFecha()
        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim idCotizacion As Label
        Dim cotizacionValorCompra As TextBox
        Dim cotizacionValorVenta As TextBox

        Dim fila As Integer
        
        olblValidacionMensajeError.Text = ""


        fila = 1
           Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "cotizacionActualizaMoneda"
            End With


            For Each Row In ogvCotizacionFechaTrae.Rows
                Try
                    cmd.Parameters.Clear()

                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    idCotizacion = CType(Row.FindControl("idCotizacion"), Label)
                    cotizacionValorCompra = CType(Row.FindControl("otxtCotizacionValorCompra"), TextBox)
                    cotizacionValorVenta = CType(Row.FindControl("otxtCotizacionValorVenta"), TextBox)

                    connection.Open()
                    cmd.Parameters.Add("@idCotizacion", Data.SqlDbType.Int).SqlValue = idCotizacion.Text
                    cmd.Parameters.Add("@cotizacionValorCompra", Data.SqlDbType.Text).SqlValue = "0" + LTrim(RTrim(cotizacionValorCompra.Text)).Replace(",", ".")
                    cmd.Parameters.Add("@cotizacionValorVenta", Data.SqlDbType.Text).SqlValue = "0" + LTrim(RTrim(cotizacionValorVenta.Text)).Replace(",", ".")



                    reader = cmd.ExecuteReader()


                Catch ex As Exception
                    olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " Error: " + ex.ToString

                End Try
                connection.Close()



                fila = fila + 1

            Next
        End Using
        olblMensajeGestion.Text = "Actualizacion realizada correctamente"
        ogvCotizacionFechaTrae.DataBind()
    End Sub

    Protected Sub oddlCotizacionFecha_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlCotizacionFecha.SelectedIndexChanged
        olblMensajeGestion.Text = " "
        olblValidacionMensajeError.Text = " "

    End Sub

    Protected Sub obutCotizacionFechaAlta_Click(sender As Object, e As EventArgs) Handles obutCotizacionFechaAlta.Click
        cotizacionFechaAgrega()
    End Sub

    Private Sub cotizacionFechaAgrega()

       Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "cotizacionFechaAgrega"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idOperador")
        
                reader = cmd.ExecuteReader


            Catch ex As Exception
                olblValidacionMensajeError.Text = ex.Message.ToString

            End Try
            connection.Close()
        End Using
        olblMensajeGestion.Text = "Actualizacion realizada correctamente"
        oddlCotizacionFecha.DataBind()
        ogvCotizacionFechaTrae.DataBind()



    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
       
    End Sub
End Class
