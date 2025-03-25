
Imports STRSYSTEM
Partial Class STRSYSTEM_Administracion_RECIBOADHESION

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
            olblRECIBOADHESIONTitulo.text = "                                                                                                                                                                                                        "
            otxtRECIBOFECHACOBRANZA.Attributes.Add("readonly", "readonly")
            otxtRECIBOFECHACOBRANZA.Text = Left(Date.Today.ToString, 10)

            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click
        olblGestionDescripcion.Text = "Esperando accion Operador."

        olblIdRECIBOADHESION.Text = "0"
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta"
        otxtRECIBOADHESIONCODIGO.text = ""
        otxtRECIBOADHESIONDESCRIPCION.text = ""
        otxtRECIBOADHESIONESTADO.text = ""
        otxtRECIBONUMERO.text = ""
        otxtRECIBOFECHACOBRANZA.text = ""
        otxtRECIBOMONTOEFECTIVO.text = ""
        otxtRECIBOMONTOTRANSFERENCIA.text = ""
        Panel1.Visible = False
        PanelAlta.Visible = True
    End Sub


    Protected Sub obutAltaConfirmada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaConfirmada.Click

        olblGestionCodigo.Text = "0"
        olblGestionDescripcion.Text = ""
        nombreTablaAM()
        If Left(olblGestionCodigo.Text, 1) = "1" Then
            Panel1.Visible = True
            PanelAlta.Visible = False
            ogvRECIBOADHESION.DataBind()
        End If
    End Sub

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvRECIBOADHESION_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvRECIBOADHESION.SelectedIndexChanged
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdRECIBOADHESION.Text = ogvRECIBOADHESION.SelectedDataKey.Item("IDRECIBOADHESION")
        otxtRECIBOADHESIONCODIGO.text = ogvRECIBOADHESION.SelectedDataKey.Item("RECIBOADHESIONCODIGO")
        otxtRECIBOADHESIONDESCRIPCION.text = ogvRECIBOADHESION.SelectedDataKey.Item("RECIBOADHESIONDESCRIPCION")
        otxtRECIBOADHESIONESTADO.text = ogvRECIBOADHESION.SelectedDataKey.Item("RECIBOADHESIONESTADO")
        oddlLOTEVENTA.SelectedValue = ogvRECIBOADHESION.SelectedDataKey.Item("IDLOTEVENTA")
        otxtRECIBONUMERO.text = ogvRECIBOADHESION.SelectedDataKey.Item("RECIBONUMERO")
        otxtRECIBOFECHACOBRANZA.text = ogvRECIBOADHESION.SelectedDataKey.Item("RECIBOFECHACOBRANZA")
        otxtRECIBOMONTOEFECTIVO.text = ogvRECIBOADHESION.SelectedDataKey.Item("RECIBOMONTOEFECTIVO")
        otxtRECIBOMONTOTRANSFERENCIA.text = ogvRECIBOADHESION.SelectedDataKey.Item("RECIBOMONTOTRANSFERENCIA")
        Panel1.Visible = False
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
                .CommandText = "RECIBOADHESIONAM"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@IDRECIBOADHESION", Data.SqlDbType.Int).SqlValue = olblIDRECIBOADHESION.Text
                cmd.Parameters.Add("@RECIBOADHESIONCODIGO", Data.SqlDbType.Char).SqlValue = otxtRECIBOADHESIONCODIGO.text
                cmd.Parameters.Add("@RECIBOADHESIONDESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtRECIBOADHESIONDESCRIPCION.text
                cmd.Parameters.Add("@RECIBOADHESIONESTADO", Data.SqlDbType.Int).SqlValue = otxtRECIBOADHESIONESTADO.text
                cmd.Parameters.Add("@IDLOTEVENTA", Data.SqlDbType.Int).SqlValue = oddlLOTEVENTA.SelectedValue
                cmd.Parameters.Add("@RECIBONUMERO", Data.SqlDbType.Int).SqlValue = otxtRECIBONUMERO.text
                cmd.Parameters.Add("@RECIBOFECHACOBRANZA", Data.SqlDbType.DateTime).SqlValue = otxtRECIBOFECHACOBRANZA.text
                cmd.Parameters.Add("@RECIBOMONTOEFECTIVO", Data.SqlDbType.Float).SqlValue = otxtRECIBOMONTOEFECTIVO.text
                cmd.Parameters.Add("@RECIBOMONTOTRANSFERENCIA", Data.SqlDbType.Float).SqlValue = otxtRECIBOMONTOTRANSFERENCIA.text
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.text = reader.item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
            End Try
            connection.Close()
        End Using
    End Sub
End Class