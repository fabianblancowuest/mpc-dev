'Imports STRSYSTEM


Partial Class iniciocorrecto
    Inherits System.Web.UI.Page
    Private paginaDestino As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ''Session.Item("paginaDocumentacion") = "Presentación Sistema Farmacia y Depósito.pdf"
        'Dim CPH As ContentPlaceHolder = Master.FindControl("CPH")
        ''Dim Roles As System.Data.DataView = Session.Item("Roles")
        'Dim indice As Integer
        ''averigüo si esta autenticado el usuario
        'If Context.User.Identity.IsAuthenticated Then
        '    'averiguo si es postback o no
        '    If Page.IsPostBack = False Then
        '        Page.Title = Context.User.Identity.Name
        '        'pregunto si encuentra el rol
        '        indice = Roles.Find(Request.AppRelativeCurrentExecutionFilePath.ToString)
        '        If indice = -1 Then
        '            'significa que no encuentra el rol
        '            'Response.Redirect("~/sisfar/Login.aspx", False)
        '        Else
        '            'verifica el control de acceso
        '            'Inicializa(CPH, Roles(indice)("idNivelAcceso"))
        '            'Response.Redirect("~/ABM/inicioCorrecto.aspx", False)
        '            redireccionar()

        '        End If
        '    Else

        '    End If
        'Else
        '    'si no esta lo mando a la pagina de login
        '    'Response.Redirect("~/sisfar/Login.aspx", True)
        'End If
    End Sub


    'Protected Sub ogvRolesUsuario_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvRolesUsuario.SelectedIndexChanged
    '    paginaDestino = RTrim(LTrim(ogvRolesUsuario.SelectedDataKey.Item("pagina").ToString)).ToString
    '    Session.Item("paginaDocumentacion") = RTrim(LTrim(ogvRolesUsuario.SelectedDataKey.Item("documentoOperativo")).ToString).ToString

    '    Response.Redirect(paginaDestino)
    '    Page.Title = "Acceso de Usuario Autenticado"
    'End Sub

    'Private Sub redireccionar()
    '    paginaDestino = RTrim(LTrim(ogvRolesUsuario.SelectedDataKey.Item("pagina").ToString)).ToString
    '    Response.Redirect(paginaDestino)
    '    Page.Title = "Acceso de Usuario Autenticado"
    'End Sub

    Protected Sub ogvRolesUsuario_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvRolesUsuario.SelectedIndexChanged
        Session.Item("idAccesoRol") = ogvRolesUsuario.SelectedDataKey.Item("idAccesoRol")
        registroAccesoRol(Session("idOperador"), ogvRolesUsuario.SelectedDataKey.Item("accesoRolPagina"), Session("idAccesoRol"))
        Response.Redirect(LTrim(RTrim(ogvRolesUsuario.SelectedDataKey.Item("accesoRolPagina"))))
    End Sub




    Private Sub registroAccesoRol(ByVal idOperador As Integer, ByVal pagina As String, ByVal idAccesoRol As Integer)

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
                .CommandText = "operadorActividadRegistro"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idUsuario", Data.SqlDbType.Int).SqlValue = idOperador
                cmd.Parameters.Add("@procedimiento", Data.SqlDbType.Char).SqlValue = pagina
                cmd.Parameters.Add("@idAccesoRol", Data.SqlDbType.Int).SqlValue = idAccesoRol
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read

                    End While
                End If
            Catch ex As Exception
            End Try
            connection.Close()
        End Using
    End Sub

End Class
