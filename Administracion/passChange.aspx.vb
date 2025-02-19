Imports STRSYSTEM

Partial Class INCLUIR_passChange
    Inherits System.Web.UI.Page

    Protected Sub obutVolverLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutVolverLogin.Click
        Response.Redirect("/ACCESO/ACCESOOPERADORUGPAUTORIZADO.aspx")

    End Sub

    Protected Sub passChange()

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim idOperador As Integer

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString
        idOperador = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "INSTITUCIONUSUARIOPASSCHANGE"
                .Parameters.Clear()
            End With
            Try
                connection.Open()
                cmd.Parameters.Add("@correoElectronico", Data.SqlDbType.Char).SqlValue = otxtCorreoElectronico.Text
                cmd.Parameters.Add("@pass00", Data.SqlDbType.Char).SqlValue = otxtPass00.Text
                cmd.Parameters.Add("@pass01", Data.SqlDbType.Char).SqlValue = otxtPass01.Text
                cmd.Parameters.Add("@pass02", Data.SqlDbType.Char).SqlValue = otxtPass02.Text



                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionPasswordDescripcion.Text = reader.Item("olblGestionResultado")

                    End While
                End If
            Catch ex As Exception
                MsgBox(ex.Message)

            End Try
            connection.Close()
        End Using
        'STRSYSTEM.accesoOperadorActividadRegistro(Session("session_idOperador"), 0, "Usuario " + RTrim(otxtCorreoElectronico.Text) + " ha solicitado el cambio de contraseña :" + RTrim(otxtPass00.Text) + " por la contraseña :" + RTrim(otxtPass01.Text) + " Retipeada: " + RTrim(otxtPass02.Text))

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        otxtCorreoElectronico.Text = Session("session_institucionUsuarioCorreo")

    End Sub

    Protected Sub obutCambiarPassword_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutCambiarPassword.Click
        passChange()

    End Sub
End Class
