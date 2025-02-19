
Partial Class SisFar_ordenCompra_mensajeriaInterna
    Inherits System.Web.UI.Page


    
    Protected Sub ogvNotificacionRecibidos_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvNotificacionRecibidos.SelectedIndexChanged
        olblIdNotificacion.Text = ogvNotificacionRecibidos.SelectedDataKey.Item("idNotificacion")
        olblAsunto.Text = ogvNotificacionRecibidos.SelectedDataKey.Item("Asunto")
        otxtMensaje.Text = ogvNotificacionRecibidos.SelectedDataKey.Item("texoMensaje")
        'obutCerrarMensaje.Visible = True
        PanelMensaje.Visible = True

        notificacionConfirmaLectura()
        ogvNotificacionRecibidos.DataBind()
        ogvNotificacionEnviada.DataBind()
    End Sub

    Protected Sub obutVolver_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutVolver.Click
        Response.Redirect("~/sisfar/ABM/iniciocorrecto.aspx")
    End Sub


    Private Sub notificacionConfirmaLectura()
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
                .CommandText = "[notificacionConfirmaLectura]"
                'borro los parametros por las dudas
                .Parameters.Clear()
            End With
            Try
                'abro la conexion
                connection.Open()
                'tomo los nombres de los parametros desde el procedimiento almacenado
                'System.Data.SqlClient.SqlCommandBuilder.DeriveParameters(cmd)
                'establezco el parametro en la conexion
                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                cmd.Parameters.Add("@idNotificacion", Data.SqlDbType.Int).SqlValue = olblIdNotificacion.Text

                'hago la lectura de la conexion
                reader = cmd.ExecuteReader
                mensaje = ""
                ' si trae filas existe el usuario
                If reader.HasRows Then
                    While reader.Read
                        'olblMensajeAnulacion.Text = reader.Item("mensaje")
                    End While
                End If
                'cierro la lectura
                reader.Close()

            Catch ex As Data.SqlClient.SqlException
                'olblEstadoDescripcion.Text = ex.Message
                connection.Close()

            End Try
            'cierro la conexion
        End Using

    End Sub

    Private Sub notificacionRespuestaAlta()
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
                .CommandText = "[notificacionRespuestaAlta]"
                'borro los parametros por las dudas
                .Parameters.Clear()
            End With
            Try
                'abro la conexion
                connection.Open()
                'tomo los nombres de los parametros desde el procedimiento almacenado
                'System.Data.SqlClient.SqlCommandBuilder.DeriveParameters(cmd)
                'establezco el parametro en la conexion
                cmd.Parameters.Add("@idNotificacion", Data.SqlDbType.Int).SqlValue = olblIdNotificacion.Text
                cmd.Parameters.Add("@notificacionTexto", Data.SqlDbType.Text).SqlValue = txtMensajeRespuesta.Text
                'hago la lectura de la conexion
                reader = cmd.ExecuteReader
                mensaje = ""
                ' si trae filas existe el usuario
                If reader.HasRows Then
                    While reader.Read
                        olblMensajeRespustaError.Text = reader.Item("gestionDescripcion")
                        olblAltaExitosa.Text = "1"
                    End While
                End If
                'cierro la lectura
                reader.Close()

            Catch ex As Data.SqlClient.SqlException
                olblMensajeRespustaError.Text = ex.Message
                connection.Close()

            End Try
            'cierro la conexion
        End Using

    End Sub

    Protected Sub ogvNotificacionEnviada_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvNotificacionEnviada.SelectedIndexChanged
        olblIdNotificacion.Text = ogvNotificacionEnviada.SelectedDataKey.Item("idNotificacion")
        olblAsunto.Text = ogvNotificacionEnviada.SelectedDataKey.Item("Asunto")
        otxtMensaje.Text = ogvNotificacionEnviada.SelectedDataKey.Item("texoMensaje")
        'obutCerrarMensaje.Visible = True
        PanelMensaje.Visible = True
        otxtMensaje.Visible = True

        olblMensajeRespustaError.Text = ""
        notificacionConfirmaLectura()
    End Sub


    Protected Sub obutResponderMensaje_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutResponderMensaje.Click
        otxtMensaje.Visible = True

        olblAsuntoRespuesta.Text = "RE:" & olblAsunto.Text
        olblMensajeRespustaError.Text = ""
        PanelResponderMensaje.Visible = True

    End Sub

    Protected Sub obutEnviarMensaje_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutEnviarMensaje.Click
        olblMensajeRespustaError.Text = ""
        olblAltaExitosa.Text = "0"
        If txtMensajeRespuesta.Text.Trim = "" Then
            olblMensajeRespustaError.Text = "Debe Ingresar un Mensaje"
            Exit Sub
        End If

        notificacionRespuestaAlta()

        If olblAltaExitosa.Text = "1" Then
            PanelResponderMensaje.Visible = False
            ogvNotificacionEnviada.DataBind()
            ogvNotificacionRecibidos.DataBind()

            PanelMensaje.Visible = False
            'obutEnviarMensaje.Visible = False

        End If
    End Sub


    Protected Sub obutLeidos_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutLeidos.Click
        PanelRecibidos.Visible = True
        PanelEnviados.Visible = False
        PanelMensaje.Visible = False
        PanelResponderMensaje.Visible = False

        olblReporteTipo.Text = "0"
        ogvNotificacionEnviada.DataBind()

    End Sub

    Protected Sub obutEnviadosNoLeidos_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutEnviadosNoLeidos.Click
        PanelRecibidos.Visible = False
        PanelEnviados.Visible = True
        PanelMensaje.Visible = False
        PanelResponderMensaje.Visible = False

        olblReporteTipo.Text = "1"
        ogvNotificacionEnviada.DataBind()
    End Sub

    Protected Sub obutNotificacionAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutNotificacionAlta.Click
        Response.Redirect("notificacionEnvio.aspx")

    End Sub

    
End Class
