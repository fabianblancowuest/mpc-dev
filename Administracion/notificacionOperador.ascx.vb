
Partial Class SisFar_ordenCompra_notificacionOperador
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
        notificacionOperadorPendienteLectura()

    End Sub


    Private Sub notificacionOperadorPendienteLectura()

        ' da de alta la OC para el presente pedido y presente proveedor.
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim settings As ConnectionStringSettings
        'tomo el valor de la cadena de conexion desde el config.web
        settings = System.Configuration.ConfigurationManager.ConnectionStrings("ordenCompra")
        Dim connectionString As String = settings.ConnectionString
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                'establezco los parametros de la conexion
                .Connection = connection
                'establezco procedimiento almacenado
                .CommandType = Data.CommandType.StoredProcedure
                'establezco nombre del procedimiento
                .CommandText = "notificacionOperadorPendienteLectura"
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


                'hago la lectura de la conexion
                reader = cmd.ExecuteReader
                ' si trae filas existe el usuario
                If reader.HasRows Then
                    While reader.Read
                        olblNotificacionesOperador.Text = reader.Item("notificacionOperadorPendienteLectura")



                    End While
                End If
                'cierro la lectura
                reader.Close()

            Catch ex As Data.SqlClient.SqlException
                olblNotificacionesTitulo.Text = ex.Message

                connection.Close()

            End Try
            'cierro la conexion
        End Using

        If olblNotificacionesOperador.Text = "0" Then
            olblNotificacionesTitulo.Text = "No tiene notificaciones pendientes"
            olblNotificacionesOperador.Visible = False
        Else
            olblNotificacionesTitulo.Text = "Usted tiene " + LTrim(RTrim(olblNotificacionesOperador.Text)) + " notificaciones pendientes  "
            olblNotificacionesOperador.Visible = False
        End If


    End Sub

    Protected Sub olblNotificacionesTitulo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles olblNotificacionesTitulo.Click
        PanelPrincipal.Visible = False
        PanelNotificaciones.Visible = True
        ogvBusqueda.DataBind()

    End Sub

    Protected Sub obutNotificacionesVolver_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutNotificacionesVolver.Click
        PanelPrincipal.Visible = True
        PanelNotificaciones.Visible = False

    End Sub

    Protected Sub ogvBusqueda_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvBusqueda.SelectedIndexChanged
        Response.Redirect(ogvBusqueda.SelectedDataKey.Item("notificacionTipoPagina").ToString.Trim)

    End Sub

    Protected Sub obutMI_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutMI.Click
        Response.Redirect("~/sisfar/ordenCompra/mensajeriaInterna.aspx")

    End Sub


    
End Class
