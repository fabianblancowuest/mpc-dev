
Partial Class sitioWEB_tesoreriaPago
    Inherits System.Web.UI.UserControl
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then

        Else

            ogvtesoreriaCobranzaOperador.DataBind()
            olblFechaOperacion.Text = Left(Today.Date, 10)

        End If
    End Sub

    Protected Sub obutValidarValores_Click(sender As Object, e As EventArgs) Handles obutValidarValores.Click


        validarTotales()



    End Sub

    Public Sub validarTotales()
        olblValidacionMensaje.Text = ""
        olblValidacionMensajeError.Text = ""
        PanelCobranzaExceso.Visible = True
        olblOperacionValida.Text = "0"
        grabarValores()
        grabarValoresConReferencia()
        otxtEstadoDiferencia.Text = "0"
        recuperaTotalValores()

        otxtEstadoDiferencia.Text = (Val(otxtMontoImporte.Text.Replace(",", ".")) - Val(otxtValoresRecibidosMonto.Text.Replace(",", ".")) + Val(otxtCobranzaExceso.Text.Replace(",", "."))).ToString

        If Val(otxtEstadoDiferencia.Text.Replace(",", ".")) > 0 Then
            olblEstadoMensaje.Text = "Los valores ingresados no cubren el monto a cancelar."
            'PanelCobranzaExceso.Visible = False
            otxtCobranzaExceso.Text = "0"

        End If
        If Val(otxtEstadoDiferencia.Text.Replace(",", ".")) < 0 Then

            If Val(otxtEstadoDiferencia.Text.Replace(",", ".")) > -0.5 Then
                olblEstadoMensaje.Text = "Los valores ingresados coinciden con el  monto a cancelar."
                otxtEstadoDiferencia.Text = "0"
            Else
                olblEstadoMensaje.Text = "Los valores ingresados superan el  monto a cancelar."
                PanelCobranzaExceso.Visible = True

            End If
        End If
        If Val(otxtEstadoDiferencia.Text) <> 0 Then
            obutVueltoEfectivoCaja.Enabled = True
        Else
            obutVueltoEfectivoCaja.Enabled = False
        End If

        If Val(otxtEstadoDiferencia.Text) < 0 Then
            obutAfirmaSaldoACuenta.Enabled = True
            obutAfirmaSaldoACuenta.Text = "Excedente para Cliente"
        Else
            obutAfirmaSaldoACuenta.Enabled = False
            obutAfirmaSaldoACuenta.Text = "No hay excedente para Cliente"

        End If


        If otxtValoresRecibidosMonto.Text = "0,00" Then
            obutValidado.Text = "Operacion pendiente Valores"
            obutValidado.Width = 300
            obutValidado.Font.Bold = True
            obutValidado.BackColor = Drawing.Color.Red
            obutValidado.ForeColor = Drawing.Color.White
        Else


            If otxtEstadoDiferencia.Text = "0" Then
                obutValidado.Text = "Valores Validados"
                obutValidado.Width = 300
                obutValidado.Font.Bold = True
                obutValidado.BackColor = Drawing.Color.Green
                obutValidado.ForeColor = Drawing.Color.White
                olblOperacionValida.Text = "1"
                PanelValoresIngreso.Visible = False
                PanelValoresIngresadosConforme.Visible = True
                ogvtesoreriaCobranzaOperadorTraeValores.DataBind()
            Else
                obutValidado.Text = "Operacion pendiente Validacion"
                obutValidado.Width = 300
                obutValidado.Font.Bold = True
                obutValidado.BackColor = Drawing.Color.Red
                obutValidado.ForeColor = Drawing.Color.White
                PanelValoresIngreso.Visible = True
                PanelValoresIngresadosConforme.Visible = False
            End If

        End If
        'Parent.DataBind()

    End Sub
    Protected Sub grabarValores()

        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim id As Label
        Dim ValorMonto As TextBox
        Dim fila As Integer
        otxtValoresRecibidosMonto.Text = "0"




        fila = 1
        olblValidacionMensaje.Text = ""
        olblValidacionMensajeError.Text = ""
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "tesoreriaValorActualiza"
            End With


            For Each Row In ogvtesoreriaCobranzaOperador.Rows
                Try
                    cmd.Parameters.Clear()

                    olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    id = CType(Row.FindControl("id"), Label)
                    ValorMonto = CType(Row.FindControl("otxtValorMonto"), TextBox)
                    olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + " id " + id.Text + " Monto :" + ValorMonto.Text

                    connection.Open()
                    cmd.Parameters.Add("@id", Data.SqlDbType.Int).SqlValue = id.Text
                    cmd.Parameters.Add("@valorMonto", Data.SqlDbType.Text).SqlValue = LTrim(RTrim(ValorMonto.Text)).Replace(",", ".")


                    reader = cmd.ExecuteReader()


                Catch ex As Exception
                    olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " Error: " + ex.ToString

                End Try
                connection.Close()



                fila = fila + 1

            Next
        End Using

        ogvtesoreriaCobranzaOperador.DataBind()

    End Sub
    Protected Sub grabarValoresConReferencia()

        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim id As Label
        Dim ValorReferencia As TextBox
        Dim ValorMonto As TextBox
        Dim ValorFecha As TextBox

        Dim fila As Integer
        otxtValoresRecibidosMonto.Text = "0"




        fila = 1
        olblValidacionMensaje.Text = ""
        olblValidacionMensajeError.Text = ""
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "tesoreriaValorActualizaConReferencia"
            End With


            For Each Row In ogvtesoreriaCobranzaOperadorTrazable.Rows
                Try
                    cmd.Parameters.Clear()

                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    id = CType(Row.FindControl("id"), Label)
                    ValorReferencia = CType(Row.FindControl("otxtValorReferencia"), TextBox)
                    ValorMonto = CType(Row.FindControl("otxtValorMonto"), TextBox)
                    ValorFecha = CType(Row.FindControl("otxtValorFecha"), TextBox)
                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + " id " + id.Text + " Monto :" + ValorMonto.Text + "  Referencia:" + ValorReferencia.Text

                    connection.Open()
                    cmd.Parameters.Add("@id", Data.SqlDbType.Int).SqlValue = id.Text
                    cmd.Parameters.Add("@valorMonto", Data.SqlDbType.Text).SqlValue = "0" + LTrim(RTrim(ValorMonto.Text)).Replace(",", ".")
                    cmd.Parameters.Add("@valorReferencia", Data.SqlDbType.Text).SqlValue = ValorReferencia.Text
                    cmd.Parameters.Add("@valorfecha", Data.SqlDbType.Text).SqlValue = ValorFecha.Text



                    reader = cmd.ExecuteReader()


                Catch ex As Exception
                    olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " Error: " + ex.ToString

                End Try
                connection.Close()



                fila = fila + 1

            Next
        End Using

        ogvtesoreriaCobranzaOperadorTrazable.DataBind()

    End Sub

    Private Sub recuperaTotalValores()


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
                .CommandText = "tesoreriaValorTotal"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idEmpresaOperador")
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        otxtValoresRecibidosMonto.Text = reader.Item("totalMonto").ToString
                    End While
                End If
            Catch ex As Exception
                olblValidacionMensajeError.Text = ex.Message.ToString

            End Try
            connection.Close()
        End Using

    End Sub



    Private Sub tesoreriaValorInicializa()


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
                .CommandText = "tesoreriaValorInicializa"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idEmpresaOperador")
                reader = cmd.ExecuteReader


            Catch ex As Exception
                olblValidacionMensajeError.Text = ex.Message.ToString

            End Try
            connection.Close()
        End Using
    End Sub

    Protected Sub obuttesoreriaValorInicializa_Click(sender As Object, e As EventArgs) Handles obuttesoreriaValorInicializa.Click
        ' olblValidacionMensajeError.Text = " Por borrar "
        otxtCobranzaExceso.Text = "0"
        otxtEstadoDiferencia.Text = "0"
        tesoreriaValorInicializa()
        validarTotales()
        ogvtesoreriaCobranzaOperador.DataBind()
        ogvtesoreriaCobranzaOperadorTrazable.DataBind()


    End Sub

    Protected Sub obutAfirmaSaldoACuenta_Click(sender As Object, e As EventArgs) Handles obutAfirmaSaldoACuenta.Click
        If Val(otxtEstadoDiferencia.Text) < 0 Then
            diferenciaTesoreriaCuenta(57)
            validarTotales()

        End If


    End Sub


    Protected Sub obutVueltoEfectivoCaja_Click(sender As Object, e As EventArgs) Handles obutVueltoEfectivoCaja.Click
        efectivoCajaSaldoACliente()

    End Sub

    Public Sub efectivoCajaSaldoACliente()
        If Val(otxtEstadoDiferencia.Text) <> 0 Then


            diferenciaTesoreriaCuenta(6)
            validarTotales()

        End If
    End Sub


    Private Sub diferenciaTesoreriaCuenta(ByVal idPlanCuenta As Integer)

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
                .CommandText = "diferenciaTesoreriaCuenta"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idEmpresaOperador")
                cmd.Parameters.Add("@valorMonto", Data.SqlDbType.Text).SqlValue = otxtEstadoDiferencia.Text.Replace(",", ".")
                cmd.Parameters.Add("@idPlanCuenta", Data.SqlDbType.Int).SqlValue = idPlanCuenta

                reader = cmd.ExecuteReader


            Catch ex As Exception
                olblValidacionMensajeError.Text = ex.Message.ToString

            End Try
            connection.Close()
        End Using
        olblValidacionMensajeError.Text = "paso por grabacion"
        ogvtesoreriaCobranzaOperador.DataBind()
        otxtCobranzaExceso.Text = "0"
        otxtEstadoDiferencia.Text = "0"

    End Sub


    Public Function esValida() As String
        validarTotales()

        Return olblOperacionValida.Text



    End Function



    Public Function imponerImporte(ByVal montoACobrar As String) As String

        otxtMontoImporte.Text = montoACobrar
        validarTotales()
        Return olblOperacionValida.Text

    End Function

    Protected Sub obutReingresaValores_Click(sender As Object, e As EventArgs) Handles obutReingresaValores.Click
        PanelValoresIngreso.Visible = True
        PanelValoresIngresadosConforme.Visible = False

    End Sub
End Class
