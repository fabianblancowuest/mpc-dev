
Partial Class Administracion_vendedorAdhesionReciboCompleta
    Inherits System.Web.UI.Page

    Protected Sub ogvAdhesionesVendedor_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvAdhesionesVendedor.SelectedIndexChanged
        olblIdLoteVenta.Text = ogvAdhesionesVendedor.SelectedDataKey.Item("idLoteVenta")
        olblBarrio.Text = ogvAdhesionesVendedor.SelectedDataKey.Item("Barrio")
        olblManzana.Text = ogvAdhesionesVendedor.SelectedDataKey.Item("MZ")
        olblParcela.Text = ogvAdhesionesVendedor.SelectedDataKey.Item("PC")
        olblComprador.Text = LTrim(RTrim(ogvAdhesionesVendedor.SelectedDataKey.Item("cliente01Nombre"))) + " " + ogvAdhesionesVendedor.SelectedDataKey.Item("cliente02Nombre")
        olblTelefonos.Text = LTrim(RTrim(ogvAdhesionesVendedor.SelectedDataKey.Item("cliente01Telefono"))) + " " + ogvAdhesionesVendedor.SelectedDataKey.Item("cliente02Telefono")
        olblAdhesionMonto.Text = ogvAdhesionesVendedor.SelectedDataKey.Item("loteVentaAdhesionMonto")
        olblPagosAcumulados.Text = ogvAdhesionesVendedor.SelectedDataKey.Item("Cobrado")
        olblAdhesionSaldo.Text = ogvAdhesionesVendedor.SelectedDataKey.Item("saldoAdhesion")
        PanelRecibosVendedor.Visible = True
        ogvLoteVentaRecibo.DataBind()
        PanelRecibosVendedor.Visible = True
        PanelAdhesiones.Visible = False
        oddlVendedorAdhesion.Enabled = False




    End Sub

    Protected Sub obutReciboVolver_Click(sender As Object, e As EventArgs) Handles obutReciboVolver.Click
        PanelRecibosVendedor.Visible = False
        PanelAdhesiones.Visible = True
        oddlVendedorAdhesion.Enabled = True


    End Sub

    Protected Sub obutVinculaNuevoRecibo_Click(sender As Object, e As EventArgs) Handles obutVinculaNuevoRecibo.Click
        PanelAlta.Visible = True

    End Sub



    Private Sub nombreTablaAM()
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
                .CommandText = "RECIBOADHESIONAMculoverga"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@IDRECIBOADHESION", Data.SqlDbType.Int).SqlValue = olblIDRECIBOADHESION.Text
                cmd.Parameters.Add("@RECIBOADHESIONCODIGO", Data.SqlDbType.Char).SqlValue = otxtRECIBOADHESIONCODIGO.text
                cmd.Parameters.Add("@RECIBOADHESIONDESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtRECIBOADHESIONDESCRIPCION.text
                cmd.Parameters.Add("@RECIBOADHESIONESTADO", Data.SqlDbType.Int).SqlValue = 1
                'otxtRECIBOADHESIONESTADO.SelectedValue
                cmd.Parameters.Add("@IDLOTEVENTA", Data.SqlDbType.Int).SqlValue = olblIdLoteVenta.Text
                cmd.Parameters.Add("@RECIBONUMERO", Data.SqlDbType.Int).SqlValue = otxtRECIBONUMERO.text
                cmd.Parameters.Add("@RECIBOFECHACOBRANZA", Data.SqlDbType.DateTime).SqlValue = otxtRECIBOFECHACOBRANZA.text
                cmd.Parameters.Add("@RECIBOMONTOEFECTIVO", Data.SqlDbType.Float).SqlValue = otxtRECIBOMONTOEFECTIVO.text
                cmd.Parameters.Add("@RECIBOMONTOTRANSFERENCIA", Data.SqlDbType.Float).SqlValue = otxtRECIBOMONTOTRANSFERENCIA.text
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.text = reader.item("gestionCodigo")
                        olblGestionDescripcion.Text = "Culo teta " + reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception

                olblgestionDescripcionAlta.Text = "Puto error " + ex.Message
            End Try
            connection.Close()
        End Using
    End Sub


    Protected Sub obutAltaConfirmada_Click(sender As Object, e As EventArgs) Handles obutAltaConfirmada.Click
        nombreTablaAM()
        'ogvLoteVentaRecibo.DataBind()
        'PanelAlta.Visible = False
        'olblgestionDescripcionAlta.Text = "puta que te pari[o"
    End Sub
End Class
