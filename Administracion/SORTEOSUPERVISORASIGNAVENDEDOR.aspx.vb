
Partial Class Administracion_SORTEOSUPERVISORASIGNAVENDEDOR
    Inherits System.Web.UI.Page

    Protected Sub ogvSORTEOTALONARIOPENDIENTEASIGNACIONSUPERVISOR_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvSORTEOTALONARIOPENDIENTEASIGNACIONSUPERVISOR.SelectedIndexChanged
        olblRangoDesde.Text = (Val(ogvSORTEOTALONARIOPENDIENTEASIGNACIONSUPERVISOR.SelectedDataKey.Item("DisponibleDesde").ToString)).ToString
        olblRangoHasta.Text = ogvSORTEOTALONARIOPENDIENTEASIGNACIONSUPERVISOR.SelectedDataKey.Item("DisponibleHasta")
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



        olblMensaje.Text = ""
        If oddlOperador.SelectedValue = "0" Then
            olblMensaje.Text = "No ha seleccionado Vendedor"
            olblMensaje.ForeColor = Drawing.Color.Red
            obutAsignar.BackColor = Drawing.Color.Gray
            obutAsignar.ForeColor = Drawing.Color.Black


            obutAsignar.Enabled = False
        Else
            obutAsignar.Enabled = True
            olblMensaje.ForeColor = Drawing.Color.DarkBlue
            obutAsignar.BackColor = Drawing.Color.Green
            obutAsignar.ForeColor = Drawing.Color.White



        End If
        PanelSupervisor.Enabled = False
        PanelSupervisorConfirma.Visible = True

    End Sub

    Protected Sub obutReingresar_Click(sender As Object, e As EventArgs) Handles obutReingresar.Click
        obutPrevisualizar.Visible = True

        PanelSupervisor.Enabled = True
        PanelSupervisorConfirma.Visible = False
    End Sub

    Private Sub sorteoTalonSupervisorAsignaVendedor()
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
                .CommandText = "SORTEOTALONSUPERVISORASIGNAVENDEDOR"
                .CommandTimeout = 300
                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idSupervisor", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                cmd.Parameters.Add("@idSorteoTalonario", Data.SqlDbType.Int).SqlValue = olblIdSorteoTalonario.Text
                cmd.Parameters.Add("@sorteoTalonNumeroDesde", Data.SqlDbType.Int).SqlValue = olblAsignaDesde.Text
                cmd.Parameters.Add("@sorteoTalonNumeroHasta", Data.SqlDbType.Int).SqlValue = olblAsignaHasta.Text
                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = oddlOperador.SelectedValue



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
    End Sub



    Protected Sub obutAsignar_Click(sender As Object, e As EventArgs) Handles obutAsignar.Click
        sorteoTalonSupervisorAsignaVendedor()


        If olblGestionCodigo.Text = "1" Then
            Response.Redirect("SORTEOSUPERVISORASIGNAVENDEDOR.ASPX")
        End If
    End Sub

End Class
