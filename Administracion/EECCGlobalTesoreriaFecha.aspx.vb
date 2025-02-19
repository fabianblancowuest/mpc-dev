
Partial Class Administracion_EECCGlobalTesoreriaFecha
    Inherits System.Web.UI.Page

    

    Protected Sub orbTipoOperacion_SelectedIndexChanged(sender As Object, e As EventArgs) Handles orbTipoOperacion.SelectedIndexChanged
        ogvEECCGlobalTesoreriaFecha.DataBind()

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            controlPago()

        Else
            olblFechaToday.Text = Today.Year.ToString + "." + Right("00" + Today.Month.ToString, 2) + "." + Right("00" + Today.Day.ToString, 2)



            oddlEntrevistaFecha.SelectedValue = olblFechaToday.Text

        End If
    End Sub
    Private Sub controlPago()
        sumaComprobantes()
        tesoreriaPago.validarTotales()
        tesoreriaPago.efectivoCajaSaldoACliente()
        If tesoreriaPago.esValida = "1" Then
            obutPagoAlta.Visible = True
        Else
            obutPagoAlta.Visible = False

        End If
    End Sub
    Protected Sub ogvEECCGlobalTesoreriaFecha_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvEECCGlobalTesoreriaFecha.SelectedIndexChanged

        oddlEntrevistaFecha.Enabled = False
        olblIdPersona.Text = ogvEECCGlobalTesoreriaFecha.SelectedDataKey.Item("idPersona")
        olblpersonaDescripcion.Text = ogvEECCGlobalTesoreriaFecha.SelectedDataKey.Item("personaDescripcion")
        olblSaldoGlobal.Text = ogvEECCGlobalTesoreriaFecha.SelectedDataKey.Item("SaldoGlobal")
        olblcuotasVencidas.Text = ogvEECCGlobalTesoreriaFecha.SelectedDataKey.Item("cuotasVencidas")
        olblmontoCuotasVencidas.Text = ogvEECCGlobalTesoreriaFecha.SelectedDataKey.Item("montoCuotasVencidas")
        olblcuotasEnTermino.Text = ogvEECCGlobalTesoreriaFecha.SelectedDataKey.Item("cuotasEnTermino")
        olblmontoCuotasEnTermino.Text = ogvEECCGlobalTesoreriaFecha.SelectedDataKey.Item("montoCuotasEnTermino")
        olblcuotasAdelantables.Text = ogvEECCGlobalTesoreriaFecha.SelectedDataKey.Item("cuotasAdelantables")
        olblmontoCuotasAdelantables.Text = ogvEECCGlobalTesoreriaFecha.SelectedDataKey.Item("montoCuotasAdelantables")
        PanelGlobal.Visible = False
        PanelPersona.Visible = True

    End Sub

    Protected Sub obutPersonaVolver_Click(sender As Object, e As EventArgs) Handles obutPersonaVolver.Click
        PanelGlobal.Visible = True
        PanelPersona.Visible = False
        oddlEntrevistaFecha.Enabled = True

    End Sub

    Protected Sub oddlEntrevistaFecha_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlEntrevistaFecha.SelectedIndexChanged
        ogvEECCGlobalTesoreriaFecha.DataBind()

    End Sub


    Public Sub sumaComprobantes()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim asientoMovimientoReferenciaIdComprobanteGenerado As Label
        Dim saldoComprobante As Label
        Dim seleccionado As CheckBox
        Dim id As Label
        Dim fila As Integer

        olblComprobanteSeleccionadoCantidad.Text = "0"
        olblComprobanteSeleccionadoMonto.Text = "0"

        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "tesoreriaOperadorSeleccionCheck"
            End With

            For Each Row In ogvEECCPersonaFecha.Rows
                Try
                    cmd.Parameters.Clear()

                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    id = CType(Row.FindControl("olblId"), Label)
                    asientoMovimientoReferenciaIdComprobanteGenerado = CType(Row.FindControl("olblasientoMovimientoReferenciaIdComprobanteGenerado"), Label)
                    saldoComprobante = CType(Row.FindControl("olblSaldoComprobante"), Label)
                    seleccionado = CType(Row.FindControl("ochSeleccionado"), CheckBox)


                    If seleccionado.Checked = True Then
                        olblComprobanteSeleccionadoCantidad.Text = (Val(olblComprobanteSeleccionadoCantidad.Text) + 1).ToString
                        olblComprobanteSeleccionadoMonto.Text = (Val(olblComprobanteSeleccionadoMonto.Text) + saldoComprobante.Text).ToString

                    End If

                    connection.Open()
                    cmd.Parameters.Add("@id", Data.SqlDbType.Int).SqlValue = id.Text
                    cmd.Parameters.Add("@seleccionado", Data.SqlDbType.Bit).SqlValue = seleccionado.Checked

                    reader = cmd.ExecuteReader()


                Catch ex As Exception
                    olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " Error: " + ex.ToString

                End Try
                connection.Close()




                fila = fila + 1

            Next

        End Using


        If Val(olblComprobanteSeleccionadoMonto.Text) > 0 Then
            tesoreriaPago.imponerImporte(olblComprobanteSeleccionadoMonto.Text)
            tesoreriaPago.Visible = True
            olblMensajeSeleccion.Text = "Operacion de Pago."
        Else
            tesoreriaPago.Visible = False
            olblMensajeSeleccion.Text = "La operacion no puede ser considerada como un pago debido a que el monto de deudas supera el de las acreencias."
        End If



    End Sub


    Private Sub marcar()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString
        Dim Row As GridViewRow

        Dim asientoMovimientoReferenciaIdComprobanteGenerado As Label
        Dim saldoComprobante As Label
        Dim seleccionado As CheckBox
        Dim id As Label


        Dim fila As Integer

        olblComprobanteSeleccionadoCantidad.Text = "0"
        olblComprobanteSeleccionadoMonto.Text = "0"

        fila = 1

        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "tesoreriaOperadorSeleccionCheck"
            End With

            For Each Row In ogvEECCPersonaFecha.Rows
                Try
                    cmd.Parameters.Clear()

                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    id = CType(Row.FindControl("olblId"), Label)
                    asientoMovimientoReferenciaIdComprobanteGenerado = CType(Row.FindControl("olblasientoMovimientoReferenciaIdComprobanteGenerado"), Label)
                    saldoComprobante = CType(Row.FindControl("olblSaldoComprobante"), Label)
                    seleccionado = CType(Row.FindControl("ochSeleccionado"), CheckBox)



                    If ochMarcar.Checked = True Then
                        olblComprobanteSeleccionadoCantidad.Text = (Val(olblComprobanteSeleccionadoCantidad.Text) + 1).ToString
                        olblComprobanteSeleccionadoMonto.Text = (Val(olblComprobanteSeleccionadoMonto.Text) + saldoComprobante.Text).ToString

                    End If

                    connection.Open()
                    cmd.Parameters.Add("@id", Data.SqlDbType.Int).SqlValue = id.Text
                    cmd.Parameters.Add("@seleccionado", Data.SqlDbType.Bit).SqlValue = seleccionado.Checked

                    reader = cmd.ExecuteReader()


                Catch ex As Exception
                    olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " Error: " + ex.ToString

                End Try
                connection.Close()



                fila = fila + 1

            Next
        End Using


    End Sub

    Protected Sub ochMarcar_CheckedChanged(sender As Object, e As EventArgs) Handles ochMarcar.CheckedChanged
        If ochMarcar.Checked = False Then
            olblMarcarleyenda.Text = "Marcar todo"
        Else
            olblMarcarleyenda.Text = "Desmarcar todo"
        End If
        ogvEECCPersonaFecha.DataBind()
        controlPago()

    End Sub

    Protected Sub obutPagoAlta_Click(sender As Object, e As EventArgs) Handles obutPagoAlta.Click
        pagoAlta()



    End Sub

    Private Sub pagoAlta()
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
                .CommandText = "TesoreriaAsientaPago"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idEmpresaOperador", Data.SqlDbType.Int).SqlValue = Session("idEmpresaOperador")
                    reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        Session.Item("idAsientoCabecera") = reader.Item("idAsientoCabecera")
                    End While
                End If
            Catch ex As Exception
            End Try
            connection.Close()
        End Using
        Response.Redirect("comprobantePago.aspx")
    End Sub





End Class
