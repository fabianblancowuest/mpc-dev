
Partial Class Administracion_operadorRolEmpresa
    Inherits System.Web.UI.Page

    Protected Sub ogvOperadorEmpresaRoles_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvOperadorEmpresaRoles.SelectedIndexChanged
        empresaOperadorRolElimina(ogvOperadorEmpresaRoles.SelectedDataKey.Item("idEmpresaRolOperador"))

        ogvOperadorEmpresaRoles.DataBind()
        ogvOperadorRolEmpresaNoAsignados.DataBind()
    End Sub
    Protected Sub ogvOperadorRolEmpresaNoAsignados_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvOperadorRolEmpresaNoAsignados.SelectedIndexChanged
        empresaOperadorRolAgrega(ogvOperadorRolEmpresaNoAsignados.SelectedDataKey.Item("idAccesoRol"))

        ogvOperadorEmpresaRoles.DataBind()
        ogvOperadorRolEmpresaNoAsignados.DataBind()
    End Sub



    Private Sub empresaOperadorRolElimina(ByVal idEmpresaRolOperador As Integer)
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
                .CommandText = "empresaOperadorRolElimina"

                .Parameters.Clear()
            End With
            Try
                connection.Open()
                cmd.Parameters.Add("@idUsuario", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@idEmpresaRolOperador", Data.SqlDbType.Int).SqlValue = idEmpresaRolOperador
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.text = reader.Item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
                olblGestionDescripcion.Text = ex.Message

            End Try
            connection.Close()
        End Using
        olblGestionDescripcion.ForeColor = Drawing.Color.DarkRed
        olblGestionDescripcion.Font.Bold = True

    End Sub




    Private Sub empresaOperadorRolAgrega(ByVal idAccesoRol As Integer)
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
                .CommandText = "empresaOperadorRolAgrega"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idUsuario", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = oddlOperadorCorreo.SelectedValue
                cmd.Parameters.Add("@idEmpresa", Data.SqlDbType.Int).SqlValue = oddlEmpresa.SelectedValue
                cmd.Parameters.Add("@idAccesoRol", Data.SqlDbType.Int).SqlValue = idAccesoRol




                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.Text = reader.Item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
                olblGestionDescripcion.Text = ex.Message

            End Try
            connection.Close()
        End Using

        olblGestionDescripcion.ForeColor = Drawing.Color.DarkBlue

        olblGestionDescripcion.Font.Bold = True


    End Sub



    Protected Sub oddlOperadorCorreo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlOperadorCorreo.SelectedIndexChanged
        olblGestionDescripcion.Text = ""
        olblGestionCodigo.Text = "0"
    End Sub

    Protected Sub oddlEmpresa_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlEmpresa.SelectedIndexChanged
        olblGestionDescripcion.Text = ""
        olblGestionCodigo.Text = "0"
    End Sub
End Class
