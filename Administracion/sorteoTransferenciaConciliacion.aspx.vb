
Partial Class Administracion_sorteoTransferenciaConciliacion
    Inherits System.Web.UI.Page

    Protected Sub ogvsorteoTransferenciaNoConciliados_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvsorteoTransferenciaNoConciliados.SelectedIndexChanged
        olblidSorteoTalonCobranza.Text = ogvsorteoTransferenciaNoConciliados.SelectedDataKey.Item("idSorteoTalonCobranza")
        olbltransferenciaMonto.Text = ogvsorteoTransferenciaNoConciliados.SelectedDataKey.Item("transferenciaMonto")
        olblEfectivoMonto.Text = ogvsorteoTransferenciaNoConciliados.SelectedDataKey.Item("efectivoMonto")
        oddlconciliacionCuentasODDL.SelectedValue = 73
        obutConcilia.Visible = False
        obutDiferencia.Visible = False

        olbloperadorDescripcion.Text = ogvsorteoTransferenciaNoConciliados.SelectedDataKey.Item("operadorDescripcion")
        olbltransferenciaNumero.Text = ogvsorteoTransferenciaNoConciliados.SelectedDataKey.Item("transferenciaNumero")
        olblcomprador.Text = ogvsorteoTransferenciaNoConciliados.SelectedDataKey.Item("comprador")
        olblbonos.Text = ogvsorteoTransferenciaNoConciliados.SelectedDataKey.Item("bonos")
        imgTransferencia.ImageUrl = ogvsorteoTransferenciaNoConciliados.SelectedDataKey.Item("transferenciaImagen")

        PanelNoConcilados.Visible = False
        PanelConciliacion.Visible = True

    End Sub

    Protected Sub obutVolver_Click(sender As Object, e As EventArgs) Handles obutVolver.Click
        PanelNoConcilados.Visible = True
        PanelConciliacion.Visible = False
    End Sub

    Protected Sub oddlconciliacionCuentasODDL_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlconciliacionCuentasODDL.SelectedIndexChanged
        If oddlconciliacionCuentasODDL.SelectedValue = 73 Then
            obutConcilia.Visible = False
            obutDiferencia.Visible = False
        Else
            obutConcilia.Visible = True
            obutDiferencia.Visible = True

        End If
    End Sub

    Protected Sub obutConcilia_Click(sender As Object, e As EventArgs) Handles obutConcilia.Click
        conciliaCobranza()
        oddloperadorSorteoODDL.DataBind()
        If LTrim(RTrim(olblResto.Text)) = "0" Then
        Else
            oddloperadorSorteoODDL.SelectedValue = olblIdOperadorConciliado.Text

        End If
        ogvsorteoTransferenciaNoConciliados.DataBind()
        PanelConciliacion.Visible = False
        PanelNoConcilados.Visible = True

    End Sub

    Protected Sub obutDiferencia_Click(sender As Object, e As EventArgs) Handles obutDiferencia.Click

    End Sub

    Private Sub conciliaCobranza()

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
                .CommandText = "sorteoTalonCobranzaConciliacion"

                .Parameters.Clear()
            End With
            Try
                connection.Open()
                

                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@idSorteoTalonCobranza", Data.SqlDbType.Int).SqlValue = olblidSorteoTalonCobranza.Text
                cmd.Parameters.Add("@idPlanCuenta", Data.SqlDbType.Int).SqlValue = oddlconciliacionCuentasODDL.SelectedValue

                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblIdOperadorConciliado.Text = reader.Item("idOperador")
                        olblResto.Text = reader.Item("resto")
                        olblMensajeValidacion.Text = "Ultima operacion realizada: Cobranza " + LTrim(RTrim(olblidSorteoTalonCobranza.Text)) + " conciliada."
                    End While
                End If
            Catch ex As Exception
                olblMensajeValidacion.Text = ex.Message

            End Try
            connection.Close()
        End Using




    End Sub
End Class
