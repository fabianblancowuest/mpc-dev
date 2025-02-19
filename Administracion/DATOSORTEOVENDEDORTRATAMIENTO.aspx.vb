
Partial Class Administracion_DATOSORTEOVENDEDORTRATAMIENTO
    Inherits System.Web.UI.Page

     


    Private Function EVALUAITEMOPCION(ByVal idSorteoDatoClienteCampanaItemOpcion As Integer) As Integer
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
                .CommandText = "sorteoDatoClienteCampanaItemOpcionTraeItemSiguiente"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idSorteoDatoClienteCampanaItemOpcion", Data.SqlDbType.Int).SqlValue = idSorteoDatoClienteCampanaItemOpcion
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        retorno = reader.Item("habilitaSiguiente")
                    End While
                End If
            Catch ex As Exception
            End Try
            connection.Close()
        End Using


        Return retorno
    End Function


    Protected Sub oddlItem1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlItem1.SelectedIndexChanged
        altaNovedad(1, oddlItem1.SelectedValue)

        If oddlItem1.SelectedValue = 3 Then
            mensajeSalienteAlta()
            ogvTelefonoMensajeria.DataBind()


        End If



        If EVALUAITEMOPCION(oddlItem1.SelectedValue) = 1 Then
            oddlItem2.Enabled = True
        Else
            oddlItem2.Enabled = False

        End If
    End Sub


    Protected Sub oddlItem2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlItem2.SelectedIndexChanged
        altaNovedad(2, oddlItem2.SelectedValue)

        If EVALUAITEMOPCION(oddlItem2.SelectedValue) = 1 Then
            oddlItem3.Enabled = True
        Else
            oddlItem3.Enabled = False

        End If
    End Sub

    Protected Sub oddlItem3_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlItem3.SelectedIndexChanged
        altaNovedad(3, oddlItem3.SelectedValue)
        If oddlItem3.SelectedValue = 10 Then

            ' El valor 10 esta indicando que  requiere agenda.

            PanelAgenda.Visible = True
            obutEntrevistaCierra.Visible = False
            obutEntrevistaGraba.Visible = True

            PanelTratamientoCliente.Visible = False
            olblEntrevistaPersona.Text = olblapellidoYNombres.Text

        End If



        If EVALUAITEMOPCION(oddlItem3.SelectedValue) = 1 Then
            oddlItem4.Enabled = True
        Else
            oddlItem4.Enabled = False

        End If
    End Sub

    Protected Sub oddlItem4_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlItem4.SelectedIndexChanged
        altaNovedad(4, oddlItem4.SelectedValue)
    End Sub

    Private Sub altaNovedad(ByVal idSorteoDatoClienteCampanaItem As Integer, ByVal idSorteoDatoClienteCampanaItemOpcion As Integer)
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblmensaje.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings(Session("session_conexion"))
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoDatoClienteCampanaDatoActuacionAlta"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                cmd.Parameters.Add("@idSorteoDatoClienteCampanaDato", Data.SqlDbType.Int).SqlValue = olblidSorteoDatoClienteCampanaDato.Text
                cmd.Parameters.Add("@idSorteoDatoClienteCampanaItem", Data.SqlDbType.Int).SqlValue = idSorteoDatoClienteCampanaItem
                cmd.Parameters.Add("@idSorteoDatoClienteCampanaItemOpcion", Data.SqlDbType.Int).SqlValue = idSorteoDatoClienteCampanaItemOpcion
                cmd.Parameters.Add("@observacion", Data.SqlDbType.Text).SqlValue = ""





                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        retorno = reader.Item("habilitaSiguiente")
                    End While
                End If
            Catch ex As Exception
                olblmensaje.Text = ex.Message
            End Try
            connection.Close()
        End Using
        ogvSorteoDatoClienteCampanaDatoActuacionVer.DataBind()


    End Sub


    Protected Sub ogvSorteoDatoClienteCampanaDatoOperador_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvSorteoDatoClienteCampanaDatoOperador.SelectedIndexChanged
        PanelClientes.Visible = False
        PanelTratamientoCliente.Visible = True

        olblapellidoYNombres.Text = ogvSorteoDatoClienteCampanaDatoOperador.SelectedDataKey.Item("apellidoYNombres")
        olblcelularNumero.Text = ogvSorteoDatoClienteCampanaDatoOperador.SelectedDataKey.Item("celularNumero")
        olblcorreoElectronico.Text = ogvSorteoDatoClienteCampanaDatoOperador.SelectedDataKey.Item("correoElectronico")
        olblidSorteoDatoClienteCampanaDato.Text = ogvSorteoDatoClienteCampanaDatoOperador.SelectedDataKey.Item("idSorteoDatoClienteCampanaDato")
        olblidSorteoDatoClienteCampana.Text = ogvSorteoDatoClienteCampanaDatoOperador.SelectedDataKey.Item("idSorteoDatoClienteCampana")

        oddlItem1.DataBind()
        oddlItem2.DataBind()
        oddlItem3.DataBind()
        oddlItem4.DataBind()

        oddlItem1.SelectedValue = ogvSorteoDatoClienteCampanaDatoOperador.SelectedDataKey.Item("idMensajeEnviado")
        oddlItem2.SelectedValue = ogvSorteoDatoClienteCampanaDatoOperador.SelectedDataKey.Item("idRespuestaCliente")
        oddlItem3.SelectedValue = ogvSorteoDatoClienteCampanaDatoOperador.SelectedDataKey.Item("idLlamada")
        oddlItem4.SelectedValue = ogvSorteoDatoClienteCampanaDatoOperador.SelectedDataKey.Item("idEntrevista")

        olblMotivo.Text = ""
        If ogvSorteoDatoClienteCampanaDatoOperador.SelectedDataKey.Item("Premio 5 millones") <> "0" Then
            olblMotivo.Text = "- Premio 5 millones "
        End If
        If ogvSorteoDatoClienteCampanaDatoOperador.SelectedDataKey.Item("Premio Terreno") <> "0" Then
            olblMotivo.Text = olblMotivo.Text + "- Premio Terreno 10 x 30 metros "
        End If

        If ogvSorteoDatoClienteCampanaDatoOperador.SelectedDataKey.Item("Premio Terreno y 0 km") <> "0" Then
            olblMotivo.Text = olblMotivo.Text + "- Premio Terreno 10 x 30 y un Auto 0 km"
        End If
        olblMotivo.Text = olblMotivo.Text + "-"
        oddlItem1.Enabled = True
        oddlItem2.Enabled = True
        oddlItem3.Enabled = True
        oddlItem4.Enabled = True
        ogvSorteoDatoClienteCampanaDatoActuacionVer.DataBind()
        ogvTelefonoMensajeria.DataBind()
        ogvAgenda.DataBind()

      

    End Sub

   
   

    Protected Sub obutVolver_Click(sender As Object, e As EventArgs) Handles obutVolver.Click
        ogvSorteoDatoClienteCampanaDatoOperador.DataBind()
        colorear()

        PanelClientes.Visible = True
        PanelTratamientoCliente.Visible = False

    End Sub
    Private Sub colorear()
        Dim RowColor As GridViewRow
        Dim olblColor As Label
        Dim columna As Integer
        Dim olblReferidos As Label

        Dim banderaLlamada As Integer
        Dim banderaEntrevista As Integer



        For Each RowColor In ogvSorteoDatoClienteCampanaDatoOperador.Rows

            olblColor = CType(RowColor.FindControl("olblColorMensajeEnviado"), Label)
            olblReferidos = CType(RowColor.FindControl("olblReferidos"), Label)

            columna = 14

            If olblColor.Text = "BLANCO" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.White
                RowColor.Cells(columna).ForeColor = Drawing.Color.White
            End If
            If olblColor.Text = "ROSADO" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Pink
                RowColor.Cells(columna).ForeColor = Drawing.Color.Pink
            End If
            If olblColor.Text = "AMARILLO" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Yellow
                RowColor.Cells(columna).ForeColor = Drawing.Color.Yellow
            End If
            If olblColor.Text = "AZUL" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Blue
                RowColor.Cells(columna).ForeColor = Drawing.Color.Blue
            End If
            If olblColor.Text = "ROJO" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Red
                RowColor.Cells(columna).ForeColor = Drawing.Color.Red
            End If
            If olblColor.Text = "VERDE" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Green
                RowColor.Cells(columna).ForeColor = Drawing.Color.Green
            End If

            If olblColor.Text = "MARRON" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Brown
                RowColor.Cells(columna).ForeColor = Drawing.Color.Brown
            End If

            olblColor = CType(RowColor.FindControl("olblColorRespuestaCliente"), Label)
            columna = 15

            If olblColor.Text = "BLANCO" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.White
                RowColor.Cells(columna).ForeColor = Drawing.Color.White
            End If
            If olblColor.Text = "ROSADO" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Pink
                RowColor.Cells(columna).ForeColor = Drawing.Color.Pink
            End If
            If olblColor.Text = "AMARILLO" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Yellow
                RowColor.Cells(columna).ForeColor = Drawing.Color.Yellow
            End If
            If olblColor.Text = "AZUL" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Blue
                RowColor.Cells(columna).ForeColor = Drawing.Color.Blue
            End If
            If olblColor.Text = "ROJO" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Red
                RowColor.Cells(columna).ForeColor = Drawing.Color.Red
            End If
            If olblColor.Text = "VERDE" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Green
                RowColor.Cells(columna).ForeColor = Drawing.Color.Green
            End If
            If olblColor.Text = "MARRON" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Brown
                RowColor.Cells(columna).ForeColor = Drawing.Color.Brown
            End If

            olblColor = CType(RowColor.FindControl("olblColorLlamada"), Label)


            columna = 16

            If olblColor.Text = "BLANCO" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.White
                RowColor.Cells(columna).ForeColor = Drawing.Color.White

                banderaLlamada = 0
            Else
                banderaLlamada = 1

            End If
            If olblColor.Text = "ROSADO" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Pink
                RowColor.Cells(columna).ForeColor = Drawing.Color.Pink
            End If
            If olblColor.Text = "AMARILLO" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Yellow
                RowColor.Cells(columna).ForeColor = Drawing.Color.Yellow
            End If
            If olblColor.Text = "AZUL" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Blue
                RowColor.Cells(columna).ForeColor = Drawing.Color.Blue
            End If
            If olblColor.Text = "ROJO" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Red
                RowColor.Cells(columna).ForeColor = Drawing.Color.Red
            End If
            If olblColor.Text = "VERDE" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Green
                RowColor.Cells(columna).ForeColor = Drawing.Color.Green
            End If
            If olblColor.Text = "MARRON" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Brown
                RowColor.Cells(columna).ForeColor = Drawing.Color.Brown
            End If

            olblColor = CType(RowColor.FindControl("olblColorEntrevista"), Label)

            columna = 17

            If olblColor.Text = "BLANCO" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.White
                RowColor.Cells(columna).ForeColor = Drawing.Color.White
                banderaEntrevista = 0
            Else
                banderaEntrevista = 1
            End If
            If olblColor.Text = "ROSADO" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Pink
                RowColor.Cells(columna).ForeColor = Drawing.Color.Pink
            End If
            If olblColor.Text = "AMARILLO" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Yellow
                RowColor.Cells(columna).ForeColor = Drawing.Color.Yellow
            End If
            If olblColor.Text = "AZUL" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Blue
                RowColor.Cells(columna).ForeColor = Drawing.Color.Blue
            End If
            If olblColor.Text = "ROJO" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Red
                RowColor.Cells(columna).ForeColor = Drawing.Color.Red
            End If
            If olblColor.Text = "VERDE" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.Green
                RowColor.Cells(columna).ForeColor = Drawing.Color.Green
            End If
            If olblColor.Text = "MARRON" Then
                RowColor.Cells(columna).BackColor = Drawing.Color.SaddleBrown

                RowColor.Cells(columna).ForeColor = Drawing.Color.Brown
            End If
            columna = 24
            If LTrim(RTrim(olblReferidos.Text)) = "0" Then
                If banderaEntrevista + banderaLlamada >= 1 Then
                    RowColor.Cells(columna).BackColor = Drawing.Color.Red
                    RowColor.Cells(columna).ForeColor = Drawing.Color.Black
                Else
                    RowColor.Cells(columna).BackColor = Drawing.Color.White
                    RowColor.Cells(columna).ForeColor = Drawing.Color.White

                End If
                
            Else
                RowColor.Cells(columna).BackColor = Drawing.Color.LightGreen
                RowColor.Cells(columna).ForeColor = Drawing.Color.Black

            End If

        Next
    End Sub

    
    Protected Sub obutColorear_Click(sender As Object, e As EventArgs) Handles obutColorear.Click
        sorteoDatoMensajeEntrante()
        ogvSorteoDatoClienteCampanaDatoOperador.DataBind()

        colorear()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        sorteoDatoMensajeEntrante()

    End Sub

    Protected Sub obutEntrevistaGraba_Click(sender As Object, e As EventArgs) Handles obutEntrevistaGraba.Click
        calendarioAgendaAltaEntrevista()
        ogvAgenda.DataBind()
        obutEntrevistaCierra.Visible = True
        obutEntrevistaGraba.Visible = False

    End Sub



    Private Sub calendarioAgendaAltaEntrevista()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblmensaje.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings(Session("session_conexion"))
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoDatoClienteEntrevistaAgendaAlta"

                .Parameters.Clear()
            End With
            Try
                connection.Open()
                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                cmd.Parameters.Add("@idSorteoDatoClienteCampanaDato", Data.SqlDbType.Int).SqlValue = olblidSorteoDatoClienteCampanaDato.Text
                cmd.Parameters.Add("@agendaEntrevistaFecha", Data.SqlDbType.Date).SqlValue = oddlEntrevistaFecha.SelectedValue
                cmd.Parameters.Add("@agendaEntrevistaHora", Data.SqlDbType.Text).SqlValue = oddlEntrevistaHora.SelectedValue
                cmd.Parameters.Add("@agendaEntrevistaMinuto", Data.SqlDbType.Text).SqlValue = oddlEntrevistaMinutos.SelectedValue
                cmd.Parameters.Add("@observacion", Data.SqlDbType.Text).SqlValue = otxtEntrevistaObservaciones.Text






                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblEntrevistaMensaje.Text = "Entrevista agendada con el numero de identificacion " + reader.Item("id").ToString + reader.Item("mensaje")

                    End While
                End If
            Catch ex As Exception
                olblEntrevistaMensaje.Text = ex.Message
            End Try
            connection.Close()
        End Using
    End Sub


    Protected Sub obutEntrevistaCierra_Click(sender As Object, e As EventArgs) Handles obutEntrevistaCierra.Click
        PanelAgenda.Visible = False
        PanelTratamientoCliente.Visible = True

    End Sub


    Private Sub mensajeSalienteAlta()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensajeERRORBD.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings(Session("session_conexion"))
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "mensajeSalienteAlta"

                .Parameters.Clear()
            End With
            Try
                connection.Open()
                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                cmd.Parameters.Add("@idPlantilla", Data.SqlDbType.Int).SqlValue = 3
                cmd.Parameters.Add("@telefono", Data.SqlDbType.Text).SqlValue = olblcelularNumero.Text
                cmd.Parameters.Add("@parametro01Valor", Data.SqlDbType.Text).SqlValue = olblapellidoYNombres.Text
                cmd.Parameters.Add("@parametro02Valor", Data.SqlDbType.Text).SqlValue = olblMotivo.Text
                cmd.Parameters.Add("@parametro03Valor", Data.SqlDbType.Text).SqlValue = LTrim(RTrim(Session("session_operadorDescripcion")))
                cmd.Parameters.Add("@parametro04Valor", Data.SqlDbType.Text).SqlValue = "NULO"
                cmd.Parameters.Add("@parametro05Valor", Data.SqlDbType.Text).SqlValue = "NULO"
                cmd.Parameters.Add("@parametro06Valor", Data.SqlDbType.Text).SqlValue = "NULO"
                cmd.Parameters.Add("@parametro07Valor", Data.SqlDbType.Text).SqlValue = "NULO"
                cmd.Parameters.Add("@parametro08Valor", Data.SqlDbType.Text).SqlValue = "NULO"
                cmd.Parameters.Add("@parametro09Valor", Data.SqlDbType.Text).SqlValue = "NULO"
                cmd.Parameters.Add("@parametro10Valor", Data.SqlDbType.Text).SqlValue = "NULO"








                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblEntrevistaMensaje.Text = "Mensaje Saliente en cola de espera"

                    End While
                End If
            Catch ex As Exception
                olblMensajeERRORBD.Text = ex.Message
            End Try
            connection.Close()
        End Using


    End Sub

    Protected Sub obutMensajeriaActualiza_Click(sender As Object, e As EventArgs) Handles obutMensajeriaActualiza.Click
        ogvTelefonoMensajeria.DataBind()
    End Sub




    Private Sub sorteoDatoMensajeEntrante()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblmensaje.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings(Session("session_conexion"))
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoDatoMensajeEntrante"

                .Parameters.Clear()
            End With
            Try
                connection.Open()
                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                         End While
                End If
            Catch ex As Exception
                olblEntrevistaMensaje.Text = ex.Message
            End Try
            connection.Close()
        End Using
    End Sub

End Class
