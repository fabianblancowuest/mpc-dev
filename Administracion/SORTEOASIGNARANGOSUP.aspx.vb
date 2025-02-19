
Partial Class Administracion_SORTEOASIGNARANGOSUP
    Inherits System.Web.UI.Page

    Protected Sub ogvSORTEOTALONARIOPENDIENTEASIGNACIONSUPERVISOR_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvSORTEOTALONARIOPENDIENTEASIGNACIONSUPERVISOR.SelectedIndexChanged
        olblRangoDesde.Text = (Val(ogvSORTEOTALONARIOPENDIENTEASIGNACIONSUPERVISOR.SelectedDataKey.Item("ENTREGADOHASTA").ToString)).ToString
        olblRangoHasta.Text = ogvSORTEOTALONARIOPENDIENTEASIGNACIONSUPERVISOR.SelectedDataKey.Item("sorteoNumeroHasta")
        olblIdSorteoTalonario.Text = ogvSORTEOTALONARIOPENDIENTEASIGNACIONSUPERVISOR.SelectedDataKey.Item("idSorteoTalonario")
        numerar()


        PanelTalonario.Visible = False
        PanelSupervisor.Visible = True

    End Sub



    Private Sub numerar()
        olblAsignaDesde.Text = olblRangoDesde.Text
        olblAsignaHasta.Text = (Val(olblRangoDesde.Text) + Val(otxtCantidadAAsignar.Text) - 1).ToString
        olblAsignaCantidad.Text = otxtCantidadAAsignar.Text
        If Val(olblAsignaHasta.Text) > Val(olblRangoHasta.Text) Then
            olblAsignaHasta.Text = olblRangoHasta.Text
            otxtCantidadAAsignar.Text = (Val(olblAsignaHasta.Text) - Val(olblAsignaDesde.Text) + 1).ToString

        End If
    End Sub

    Protected Sub otxtCantidadAAsignar_Load(sender As Object, e As EventArgs)
        numerar()
    End Sub

    Protected Sub otxtCantidadAAsignar_TextChanged(sender As Object, e As EventArgs) Handles otxtCantidadAAsignar.TextChanged, otxtCantidadAAsignar.Disposed, otxtCantidadAAsignar.Load
        numerar()

    End Sub

    Protected Sub obutPrevisualizar_Click(sender As Object, e As EventArgs) Handles obutPrevisualizar.Click
        obutPrevisualizar.Visible = False

        'obutPrevisualizar.Text = " Operador:" + Session("idOperador").ToString

        'obutPrevisualizar.Text = obutPrevisualizar.Text + " Talonario:" + olblIdSorteoTalonario.Text

        'obutPrevisualizar.Text = obutPrevisualizar.Text + " desde :" + olblAsignaDesde.Text

        'obutPrevisualizar.Text = obutPrevisualizar.Text + " Hasta :" + olblAsignaHasta.Text

        'obutPrevisualizar.Text = obutPrevisualizar.Text + " Supervisor :" + oddlSupervisor.SelectedValue.ToString

        'obutPrevisualizar.Text = obutPrevisualizar.Text + " Tipo Talon :" + oddlSorteoTalonTipo.SelectedValue.ToString



        olblMensaje.Text = ""
        If oddlSupervisor.SelectedValue = "0" Then
            olblMensaje.Text = "No ha seleccionado supervisor"
            olblMensaje.ForeColor = Drawing.Color.Red

            obutAsignar.Enabled = False
        Else
            obutAsignar.Enabled = True
            olblMensaje.ForeColor = Drawing.Color.DarkBlue

        End If
        PanelSupervisor.Enabled = False
        PanelSupervisorConfirma.Visible = True

    End Sub

    Protected Sub obutReingresar_Click(sender As Object, e As EventArgs) Handles obutReingresar.Click
        obutPrevisualizar.Visible = True

        PanelSupervisor.Enabled = True
        PanelSupervisorConfirma.Visible = False
    End Sub

    Protected Sub obutAsignar_Click(sender As Object, e As EventArgs) Handles obutAsignar.Click
        sorteoTalonSupervisorAsigna()


        If olblGestionCodigo.Text = "1" Then
            Response.Redirect("SORTEOASIGNARANGOSUP.ASPX")
        End If
    End Sub



    Private Sub sorteoTalonSupervisorAsigna()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblGestionCodigo.Text = "0"
        olblGestionDescripcion.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings(Session("session_conexion"))
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "SORTEOTALONASIGNARANGOSUPERVISOR"
                .CommandTimeout = 300
                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                cmd.Parameters.Add("@idSorteoTalonario", Data.SqlDbType.Int).SqlValue = olblIdSorteoTalonario.Text
                cmd.Parameters.Add("@sorteoTalonNumeroDesde", Data.SqlDbType.Int).SqlValue = olblAsignaDesde.Text
                cmd.Parameters.Add("@sorteoTalonNumeroHasta", Data.SqlDbType.Int).SqlValue = olblAsignaHasta.Text
                cmd.Parameters.Add("@idSupervisor", Data.SqlDbType.Int).SqlValue = oddlSupervisor.SelectedValue
                cmd.Parameters.Add("@idSorteoTalonTipo", Data.SqlDbType.Int).SqlValue = oddlSorteoTalonTipo.SelectedValue



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
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
