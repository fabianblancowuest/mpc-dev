
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_PLANCUENTAGESTION


    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
            olblPLANCUENTATitulo.text = "MANTENIMIENTO DEL PLAN DE CUENTAS                                                                                                                                                                       "

            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click
        olblGestionDescripcion.Text = "Esperando accion Operador."

        olblIdPLANCUENTA.Text = "0"
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta"
        otxtPLANCUENTACODIGO.text = ""
        otxtPLANCUENTADESCRIPCION.text = ""
        otxtPLANCUENTAIMPUTABLE.Checked = 0
        otxtPLANCUENTAESTADO.Checked = 0
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
            'oddlPLANCUENTAACUMULA.DataBind()
            ogvPLANCUENTA.DataBind()
        Else
            'ogvPLANCUENTA.DataBind()
            'oddlPLANCUENTAACUMULA.DataBind()

        End If
    End Sub

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvPLANCUENTA_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvPLANCUENTA.SelectedIndexChanged
        oddlPLANCUENTARUBRO.SelectedValue = oddlPLANCUENTARUBROOperador.SelectedValue
        'oddlPLANCUENTARUBRO.Enabled = False
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdPLANCUENTA.Text = ogvPLANCUENTA.SelectedDataKey.Item("IDPLANCUENTA")
        oddlPLANCUENTARUBRO.SelectedValue = ogvPLANCUENTA.SelectedDataKey.Item("IDPLANCUENTARUBRO")
        otxtPLANCUENTACODIGO.text = ogvPLANCUENTA.SelectedDataKey.Item("PLANCUENTACODIGO")
        otxtPLANCUENTADESCRIPCION.text = ogvPLANCUENTA.SelectedDataKey.Item("PLANCUENTADESCRIPCION")
        otxtPLANCUENTAIMPUTABLE.Checked = ogvPLANCUENTA.SelectedDataKey.Item("PLANCUENTAIMPUTABLE")
        oddlPLANCUENTAGRUPO.SelectedValue = ogvPLANCUENTA.SelectedDataKey.Item("IDPLANCUENTAGRUPO")
        oddlPLANCUENTAACUMULA.SelectedValue = ogvPLANCUENTA.SelectedDataKey.Item("IDPLANCUENTAACUMULA")
        otxtPLANCUENTAESTADO.Checked = ogvPLANCUENTA.SelectedDataKey.Item("PLANCUENTAESTADO")
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
                .CommandText = "PLANCUENTAAM"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@IDPLANCUENTA", Data.SqlDbType.Int).SqlValue = olblIDPLANCUENTA.Text
                cmd.Parameters.Add("@IDPLANCUENTARUBRO", Data.SqlDbType.Int).SqlValue = oddlPLANCUENTARUBRO.SelectedValue
                cmd.Parameters.Add("@PLANCUENTACODIGO", Data.SqlDbType.Char).SqlValue = otxtPLANCUENTACODIGO.Text
                cmd.Parameters.Add("@PLANCUENTADESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtPLANCUENTADESCRIPCION.Text
                cmd.Parameters.Add("@PLANCUENTAIMPUTABLE", Data.SqlDbType.Bit).SqlValue = otxtPLANCUENTAIMPUTABLE.Checked
                cmd.Parameters.Add("@IDPLANCUENTAGRUPO", Data.SqlDbType.Int).SqlValue = oddlPLANCUENTAGRUPO.SelectedValue
                cmd.Parameters.Add("@IDPLANCUENTAACUMULA", Data.SqlDbType.Int).SqlValue = oddlPLANCUENTAACUMULA.SelectedValue
                cmd.Parameters.Add("@PLANCUENTAESTADO", Data.SqlDbType.Bit).SqlValue = otxtPLANCUENTAESTADO.Checked
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.text = reader.Item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
            End Try
            connection.Close()
        End Using
    End Sub
End Class