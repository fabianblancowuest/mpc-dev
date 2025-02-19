
Partial Class administracion_login
    Inherits System.Web.UI.Page


    Protected Sub obutIngresar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutIngresar.Click

        accesoOperadorID("cemmi_si", otxtUsuario.Text, otxtPass.Text)

        If Session("session_idOperador") <> 0 Then
            Session.Timeout = 500000


            Session.Item("session_carpeta") = ""

            Session.Item("session_conexion") = "cemmi_si"
            'Acceso a Reporte.'

            Session.Item("session_Servidor") = "v2d2"
            Session.Item("session_BaseDatos") = "cemmi_si"
            Session.Item("session_Usuario") = "sa"
            Session.Item("session_pwd") = "Pgs17930823616367898123456"


            Session.Item("session_paginaVolver") = "~/" + "acceso/accesoOperadorAutorizado.aspx"
            Session.Item("session_paginaActual") = "~/" + "acceso/accesoOperadorAutorizado.aspx"
            Response.Redirect("~/" + Session("session_carpeta") + LTrim(RTrim(Session("session_arranquePagina"))))

        Else

            'olblObservacion.Text = "Acceso Fallido.  Vuelva a ingresar los datos."
        End If

    End Sub



    Public Sub accesoOperadorID(ByVal parametro_conexion As String, ByVal parametro_usuario As String, ByVal parametro_password As String)

        'Verifica existencia de Operador en la Tabla de Operadores de la Base de datos
        'de la conexión y devuelve:
        '0 si no existe Operador.
        'idOperador si existe el usuario y pass.
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim idOperador As Integer
        Dim pagina As String

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings(parametro_conexion)
        Dim connectionString As String = Settings.ConnectionString
        idOperador = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "accesoOperadorValidar"
                .Parameters.Clear()
            End With
            Try
                connection.Open()
                cmd.Parameters.Add("@usuario", Data.SqlDbType.Char).SqlValue = parametro_usuario
                cmd.Parameters.Add("@password", Data.SqlDbType.Char).SqlValue = parametro_password


                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        Session.Item("session_idAccesoOperador") = reader.Item("session_idAccesoOperador")
                        Session.Item("session_idOperador") = reader.Item("session_idAccesoOperador")
                        Session.Item("session_idLocalidad") = reader.Item("session_idlocalidad")
                        Session.Item("session_accesoOperadorCodigo") = reader.Item("session_accesoOperadorCodigo")
                        Session.Item("session_accesoOperadorDescripcion") = reader.Item("session_accesoOperadorDescripcion")
                        Session.Item("session_accesoOperadorCategoria") = reader.Item("session_accesoOperadorCategoria")
                        Session.Item("session_accesoOperadorCategoriaLengueta") = reader.Item("session_accesoOperadorCategoriaLengueta")
                        Session.Item("session_localidadDescripcion") = reader.Item("session_localidadDescripcion")
                        Session.Item("session_arranquePagina") = reader.Item("session_arranquePagina")
                        Session.Item("session_accesoOperadorLoginID") = reader.Item("session_accesoOperadorLoginID")
                        pagina = reader.Item("session_arranquePagina")
                        olblObservacion.Text = reader.Item("session_gestionDescripcion")
                    End While
                End If
            Catch ex As Exception

                olblObservacion.Text = ex.Message
            End Try
            connection.Close()
        End Using




    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
