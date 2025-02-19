Imports Microsoft.VisualBasic

Public Class STRSYSTEM


    Shared Function traerIdRol(ByVal paginaASPX As String, ByVal conexion As String) As Integer


        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString
        Dim idAccesoRol As Integer

        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "IMPLEMENTACIONROLBUSCAID"

                .Parameters.Clear()
            End With
            Try
                connection.Open()
                cmd.Parameters.Add("@paginaASPX", Data.SqlDbType.Text).SqlValue = paginaASPX

                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        idAccesoRol = reader.Item("idAccesoRol").ToString

                    End While
                End If
            Catch ex As Exception
            End Try
            connection.Close()
        End Using

        Return idAccesoRol

    End Function



    Public Shared Function accesoRolUsuarioActividadRegistro(ByVal idAccesoOperador As Integer, ByVal rol As String) As String
        'Chequea DNI en base de Personas fisicas.
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim cadena As String
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString
        cadena = ""
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "[ACCESOROLUSUARIOACTIVIDADREGISTRO]"
                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@idAccesoOperador", Data.SqlDbType.Int).SqlValue = idAccesoOperador
                cmd.Parameters.Add("@idAccesoRol", Data.SqlDbType.Int).SqlValue = STRSYSTEM.traerIdRol(rol, "STRSYSTEM")


                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        cadena = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
            End Try
            connection.Close()
        End Using

        Return cadena

    End Function


    Public Shared Function RolOperadorcontrol(ByVal idEmpresaOperador As Integer, ByVal idAccesoRol As Integer) As Integer

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
                .CommandText = "rolOperadorControl"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idEmpresaOperador", Data.SqlDbType.Int).SqlValue = idEmpresaOperador
                cmd.Parameters.Add("@idAccesoRol", Data.SqlDbType.Int).SqlValue = idAccesoRol
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        retorno = reader.Item("estado")
                    End While
                End If
            Catch ex As Exception
            End Try
            connection.Close()
        End Using

        Return retorno
    End Function






End Class
