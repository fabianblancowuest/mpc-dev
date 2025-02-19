
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_SORTEOCOMISIONTRAMO            

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
            olblSORTEOCOMISIONTRAMOTitulo.text = "MANTENIMIENTO DE TRAMO DE COMISIONES SORTEO                                                                                                                                                             "

            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click
        olblGestionDescripcion.Text = "Esperando accion Operador."

        olblIdSORTEOCOMISIONTRAMO.Text = "0"
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta"
        otxtSORTEOCOMISIONTRAMOCODIGO.text = ""
        otxtSORTEOCOMISIONTRAMODESCRIPCION.text = ""
        otxtSORTEOCOMISIONTRAMODESDE.text = ""
        otxtSORTEOCOMISIONTRAMOHASTA.text = ""
        otxtSORTEOCOMISIONTRAMOPORCENTAJE.text = ""
        otxtSORTEOCOMISIONTRAMOSUPERVISOR.text = ""
        otxtSORTEOCOMISIONTRAMOMONTOFIJO.text = ""
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
            ogvSORTEOCOMISIONTRAMO.DataBind()
        End If
    End Sub

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvSORTEOCOMISIONTRAMO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvSORTEOCOMISIONTRAMO.SelectedIndexChanged
        oddlSORTEOCOMISION.SelectedValue = oddlSORTEOCOMISIONOperador.SelectedValue
        oddlSORTEOCOMISION.Enabled = False
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdSORTEOCOMISIONTRAMO.Text = ogvSORTEOCOMISIONTRAMO.SelectedDataKey.Item("IDSORTEOCOMISIONTRAMO")
        oddlSORTEOCOMISION.SelectedValue = ogvSORTEOCOMISIONTRAMO.SelectedDataKey.Item("IDSORTEOCOMISION")
        otxtSORTEOCOMISIONTRAMOCODIGO.text = ogvSORTEOCOMISIONTRAMO.SelectedDataKey.Item("SORTEOCOMISIONTRAMOCODIGO")
        otxtSORTEOCOMISIONTRAMODESCRIPCION.text = ogvSORTEOCOMISIONTRAMO.SelectedDataKey.Item("SORTEOCOMISIONTRAMODESCRIPCION")
        otxtSORTEOCOMISIONTRAMODESDE.text = ogvSORTEOCOMISIONTRAMO.SelectedDataKey.Item("SORTEOCOMISIONTRAMODESDE")
        otxtSORTEOCOMISIONTRAMOHASTA.text = ogvSORTEOCOMISIONTRAMO.SelectedDataKey.Item("SORTEOCOMISIONTRAMOHASTA")
        otxtSORTEOCOMISIONTRAMOPORCENTAJE.text = ogvSORTEOCOMISIONTRAMO.SelectedDataKey.Item("SORTEOCOMISIONTRAMOPORCENTAJE")
        otxtSORTEOCOMISIONTRAMOSUPERVISOR.text = ogvSORTEOCOMISIONTRAMO.SelectedDataKey.Item("SORTEOCOMISIONTRAMOSUPERVISOR")
        otxtSORTEOCOMISIONTRAMOMONTOFIJO.text = ogvSORTEOCOMISIONTRAMO.SelectedDataKey.Item("SORTEOCOMISIONTRAMOMONTOFIJO")
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
                .CommandText = "SORTEOCOMISIONTRAMOAM"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@IDSORTEOCOMISIONTRAMO", Data.SqlDbType.Int).SqlValue = olblIDSORTEOCOMISIONTRAMO.Text
                cmd.Parameters.Add("@IDSORTEOCOMISION", Data.SqlDbType.Int).SqlValue = oddlSORTEOCOMISION.SelectedValue
                cmd.Parameters.Add("@SORTEOCOMISIONTRAMOCODIGO", Data.SqlDbType.Char).SqlValue = otxtSORTEOCOMISIONTRAMOCODIGO.text
                cmd.Parameters.Add("@SORTEOCOMISIONTRAMODESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtSORTEOCOMISIONTRAMODESCRIPCION.text
                cmd.Parameters.Add("@SORTEOCOMISIONTRAMODESDE", Data.SqlDbType.Float).SqlValue = otxtSORTEOCOMISIONTRAMODESDE.text
                cmd.Parameters.Add("@SORTEOCOMISIONTRAMOHASTA", Data.SqlDbType.Float).SqlValue = otxtSORTEOCOMISIONTRAMOHASTA.text
                cmd.Parameters.Add("@SORTEOCOMISIONTRAMOPORCENTAJE", Data.SqlDbType.Float).SqlValue = otxtSORTEOCOMISIONTRAMOPORCENTAJE.text
                cmd.Parameters.Add("@SORTEOCOMISIONTRAMOSUPERVISOR", Data.SqlDbType.Float).SqlValue = otxtSORTEOCOMISIONTRAMOSUPERVISOR.text
                cmd.Parameters.Add("@SORTEOCOMISIONTRAMOMONTOFIJO", Data.SqlDbType.Float).SqlValue = otxtSORTEOCOMISIONTRAMOMONTOFIJO.text
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.text = reader.item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
                olblGestionDescripcion.Text = ex.Message
            End Try
            connection.Close()
        End Using
    End Sub
End Class 