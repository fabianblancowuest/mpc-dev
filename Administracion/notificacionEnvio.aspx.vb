
Partial Class SisFar_ordenCompra_notificacionEnvio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
        Else
            operadorEstadoDesMarcarTodo()

            ogvNOtificacionEnvio.DataBind()
            armaEtiquetas()

        End If
    End Sub

    Private Sub notificacionAltaconfirmada()
        olblMensajeValidacion.Text = ""
        If otxtAsunto.Text.Trim = "" Then
            olblMensajeValidacion.Text = "Debe Ingresar un Asunto"
            Exit Sub
        End If
        If otxtMensaje.Text.Trim = "" Then
            olblMensajeValidacion.Text = "Debe Ingresar un Mensaje"
            Exit Sub
        End If
        If olblMensajeCantidadSeleccionados.Text.Trim.Substring(0, 1) = "0" Then
            olblMensajeValidacion.Text = "Debe Seleccionar al menos un Operador de Destino"
            Exit Sub
        End If
        If orbNotificacionTipo.SelectedValue = "2" Then
            notificacionAltaPublicaIdReferenciaTraer()

        End If
        notificacionConfirmadaAlta()

    End Sub

    Private Sub notificacionConfirmadaAlta()
        Dim Row As GridViewRow
        Dim idOperadorDestino As Label
        Dim operadoresSeleccionados As Integer
        operadoresSeleccionados = 0

        Dim seleccion As CheckBox

        olblMensajeEjecucion.Text = ""

        Dim cmd As New System.Data.SqlClient.SqlCommand

        Dim Settings As ConnectionStringSettings
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("ordenCompra")
        Dim connectionString As String = Settings.ConnectionString
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "notificacionOperadorAlta"

            End With
            For Each Row In ogvNOtificacionEnvio.Rows
                cmd.Parameters.Clear()
                If Row.RowType = DataControlRowType.DataRow Then

                    idOperadorDestino = CType(Row.FindControl("olblIdOperadorDestino"), Label)
                    seleccion = CType(Row.FindControl("ochChequeado"), CheckBox)

                    If seleccion.Checked = True Then
                        Try
                            connection.Open()
                            cmd.Parameters.Add("@idOperadorOrigen", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                            cmd.Parameters.Add("@idOperadorDestino", Data.SqlDbType.Int).SqlValue = idOperadorDestino.Text
                            cmd.Parameters.Add("@notificacionAsunto", Data.SqlDbType.Char).SqlValue = otxtAsunto.Text
                            cmd.Parameters.Add("@notificacionTexto", Data.SqlDbType.Text).SqlValue = otxtMensaje.Text
                            cmd.Parameters.Add("@idNotificacionReferencia", Data.SqlDbType.Int).SqlValue = olblIdNotificacionReferenciaPublica.Text
                            cmd.ExecuteReader()
                        Catch ex As Exception
                            olblMensajeEjecucion.Text = ex.Message
                            Response.Write(ex)
                        End Try
                        connection.Close()
                    End If
                End If
            Next

            olblMensajeValidacion.Text = "Mensaje Enviado Con Exito"


        End Using
        Response.Redirect("mensajeriaInterna.aspx")
    End Sub

    Private Sub notificacionAltaPublicaIdReferenciaTraer()
       
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim settings As ConnectionStringSettings
        'tomo el valor de la cadena de conexion desde el config.web
        settings = System.Configuration.ConfigurationManager.ConnectionStrings("ordenCompra")
        Dim connectionString As String = settings.ConnectionString
        Dim mensaje As String

        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                'establezco los parametros de la conexion
                .Connection = connection
                'establezco procedimiento almacenado
                .CommandType = Data.CommandType.StoredProcedure
                'establezco nombre del procedimiento
                .CommandText = "[notificacionOperadorReferenciaAltaPublica]"
                'borro los parametros por las dudas
                .Parameters.Clear()
            End With
            Try
                'abro la conexion
                connection.Open()
                cmd.Parameters.Add("@idOperadorOrigen", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                cmd.Parameters.Add("@notificacionAsunto", Data.SqlDbType.Char).SqlValue = otxtAsunto.Text
                cmd.Parameters.Add("@notificacionTexto", Data.SqlDbType.Text).SqlValue = otxtMensaje.Text
                'hago la lectura de la conexion
                reader = cmd.ExecuteReader
                mensaje = ""
                ' si trae filas existe el usuario
                If reader.HasRows Then
                    While reader.Read
                        olblIdNotificacionReferenciaPublica.Text = reader.Item("idNotificacion")
                    End While
                End If
                'cierro la lectura
                reader.Close()

            Catch ex As Data.SqlClient.SqlException
                olblMensajeValidacion.Text = ex.Message
                connection.Close()

            End Try
            'cierro la conexion
        End Using

    End Sub

    Public Sub armaEtiquetas()

        Dim Row As GridViewRow
        Dim idOperadorDestino As Label
        Dim operadorSeleccionado As Label
        Dim operadoresSeleccionados As Integer
        operadoresSeleccionados = 0

        Dim seleccion As CheckBox


        olblMensajeEjecucion.Text = ""

        For Each Row In ogvNOtificacionEnvio.Rows
            If Row.RowType = DataControlRowType.DataRow Then

                idOperadorDestino = CType(Row.FindControl("olblIdOperadorDestino"), Label)
                seleccion = CType(Row.FindControl("ochChequeado"), CheckBox)
                operadorSeleccionado = CType(Row.FindControl("olblOperadorSeleccionado"), Label)


                If seleccion.Checked = True Then
                    olblMensajeEjecucion.Text = olblMensajeEjecucion.Text + operadorSeleccionado.Text + "-"
                    operadoresSeleccionados = operadoresSeleccionados + 1


                End If

            End If

        Next

        olblMensajeCantidadSeleccionados.Text = operadoresSeleccionados.ToString + " operadores seleccionados"

    End Sub

    Public Sub grabaOperadoEstado()

        Dim Row As GridViewRow
        Dim idOperadorDestino As Label
        Dim operadorSeleccionado As Label
        Dim operadoresSeleccionados As Integer
        operadoresSeleccionados = 0

        Dim seleccion As CheckBox


        olblMensajeEjecucion.Text = ""

        Dim cmd As New System.Data.SqlClient.SqlCommand

        Dim Settings As ConnectionStringSettings
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("ordenCompra")
        Dim connectionString As String = Settings.ConnectionString
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "notificacionOperadorEstado"

            End With
            For Each Row In ogvNOtificacionEnvio.Rows
                cmd.Parameters.Clear()
                If Row.RowType = DataControlRowType.DataRow Then

                    idOperadorDestino = CType(Row.FindControl("olblIdOperadorDestino"), Label)
                    seleccion = CType(Row.FindControl("ochChequeado"), CheckBox)
                    operadorSeleccionado = CType(Row.FindControl("olblOperadorSeleccionado"), Label)


                    If seleccion.Checked = True Then
                        olblMensajeEjecucion.Text = olblMensajeEjecucion.Text + operadorSeleccionado.Text + "-"
                        operadoresSeleccionados = operadoresSeleccionados + 1


                    End If
                    Try
                        connection.Open()
                        cmd.Parameters.Add("@idOperadorOrigen", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                        cmd.Parameters.Add("@idOperadorDestino", Data.SqlDbType.Int).SqlValue = idOperadorDestino.Text

                        cmd.Parameters.Add("@estado", Data.SqlDbType.Bit).SqlValue = seleccion.Checked

                        cmd.ExecuteReader()


                    Catch ex As Exception
                        olblMensajeEjecucion.Text = ex.Message
                        Response.Write(ex)
                    End Try
                    connection.Close()
                End If

            Next
        End Using

        olblMensajeCantidadSeleccionados.Text = operadoresSeleccionados.ToString + " operadores seleccionados"

    End Sub

    Public Sub operadorEstadoMarcarTodo()

        Dim Row As GridViewRow
        Dim idOperadorDestino As Label
        Dim operadorSeleccionado As Label
        Dim operadoresSeleccionados As Integer
        operadoresSeleccionados = 0

        Dim seleccion As CheckBox


        olblMensajeEjecucion.Text = ""

        Dim cmd As New System.Data.SqlClient.SqlCommand

        Dim Settings As ConnectionStringSettings
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("ordenCompra")
        Dim connectionString As String = Settings.ConnectionString
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "notificacionOperadorEstado"

            End With
            For Each Row In ogvNOtificacionEnvio.Rows
                cmd.Parameters.Clear()
                If Row.RowType = DataControlRowType.DataRow Then

                    idOperadorDestino = CType(Row.FindControl("olblIdOperadorDestino"), Label)
                    seleccion = CType(Row.FindControl("ochChequeado"), CheckBox)
                    operadorSeleccionado = CType(Row.FindControl("olblOperadorSeleccionado"), Label)


                    operadoresSeleccionados = operadoresSeleccionados + 1
                    olblMensajeEjecucion.Text = olblMensajeEjecucion.Text + operadorSeleccionado.Text + "-"

                    Try
                        connection.Open()
                        cmd.Parameters.Add("@idOperadorOrigen", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                        cmd.Parameters.Add("@idOperadorDestino", Data.SqlDbType.Int).SqlValue = idOperadorDestino.Text

                        cmd.Parameters.Add("@estado", Data.SqlDbType.Bit).SqlValue = 1
                        cmd.ExecuteReader()


                    Catch ex As Exception
                        olblMensajeEjecucion.Text = ex.Message
                        Response.Write(ex)
                    End Try
                    connection.Close()
                End If

            Next
        End Using

        olblMensajeCantidadSeleccionados.Text = operadoresSeleccionados.ToString + " operadores seleccionados"

    End Sub

    Public Sub operadorEstadoDesMarcarTodo()

        Dim Row As GridViewRow
        Dim idOperadorDestino As Label
        Dim operadorSeleccionado As Label

        Dim seleccion As CheckBox


        olblMensajeEjecucion.Text = ""

        Dim cmd As New System.Data.SqlClient.SqlCommand

        Dim Settings As ConnectionStringSettings
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("ordenCompra")
        Dim connectionString As String = Settings.ConnectionString
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "notificacionOperadorEstado"

            End With
            For Each Row In ogvNOtificacionEnvio.Rows
                cmd.Parameters.Clear()
                If Row.RowType = DataControlRowType.DataRow Then

                    idOperadorDestino = CType(Row.FindControl("olblIdOperadorDestino"), Label)
                    seleccion = CType(Row.FindControl("ochChequeado"), CheckBox)
                    operadorSeleccionado = CType(Row.FindControl("olblOperadorSeleccionado"), Label)



                    
                    Try
                        connection.Open()
                        cmd.Parameters.Add("@idOperadorOrigen", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                        cmd.Parameters.Add("@idOperadorDestino", Data.SqlDbType.Int).SqlValue = idOperadorDestino.Text

                        cmd.Parameters.Add("@estado", Data.SqlDbType.Bit).SqlValue = 0
                        cmd.ExecuteReader()


                    Catch ex As Exception
                        olblMensajeEjecucion.Text = ex.Message
                        Response.Write(ex)
                    End Try
                    connection.Close()
                End If

            Next
        End Using
        olblMensajeCantidadSeleccionados.Text = " 0 Operadores seleccionados"
    End Sub

    Protected Sub obutMarcaTodo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutMarcaTodo.Click
        operadorEstadoMarcarTodo()
        ogvNOtificacionEnvio.DataBind()

    End Sub

    Protected Sub obutDesmarcaTodo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutDesmarcaTodo.Click
        operadorEstadoDesMarcarTodo()
        ogvNOtificacionEnvio.DataBind()

    End Sub

    Protected Sub obutOcultaGrillaSeleccion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutOcultaGrillaSeleccion.Click
        If ogvNOtificacionEnvio.Visible = True Then
            obutOcultaGrillaSeleccion.Text = "Mostrar Grilla Seleccion"
            ogvNOtificacionEnvio.Visible = False
        Else
            ogvNOtificacionEnvio.Visible = True
            obutOcultaGrillaSeleccion.Text = "Ocultar Grilla Seleccion"
        End If
    End Sub

    Protected Sub obutEnviaNotificacion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutEnviaNotificacion.Click

        notificacionAltaconfirmada()

    End Sub

    
    Protected Sub obutVolver_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutVolver.Click
        Response.Redirect("mensajeriaInterna.aspx")


    End Sub
End Class
