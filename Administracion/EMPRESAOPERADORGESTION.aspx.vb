Imports STRSYSTEM
Partial Class STRSYSTEM_Administracion_EMPRESAOPERADORGESTION


    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
            olblEMPRESAOPERADORTitulo.text = "OPERADORES POR EMPRESA                                                                                                                                                                                  "

            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click
        olblGestionDescripcion.Text = "Esperando accion Operador."

        olblIdEMPRESAOPERADOR.Text = "0"
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta"
        otxtEMPRESAOPERADORESTADO.Checked = 0
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
            ogvEMPRESAOPERADOR.DataBind()
        End If
    End Sub

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvEMPRESAOPERADOR_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvEMPRESAOPERADOR.SelectedIndexChanged
        oddlOPERADOR.SelectedValue = oddlOPERADOROperador.SelectedValue
        oddlOPERADOR.Enabled = False
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdEMPRESAOPERADOR.Text = ogvEMPRESAOPERADOR.SelectedDataKey.Item("IDEMPRESAOPERADOR")
        oddlOPERADOR.SelectedValue = ogvEMPRESAOPERADOR.SelectedDataKey.Item("IDOPERADOR")
        oddlEMPRESA.SelectedValue = ogvEMPRESAOPERADOR.SelectedDataKey.Item("IDEMPRESA")
        oddlEMPRESASUCURSAL.SelectedValue = ogvEMPRESAOPERADOR.SelectedDataKey.Item("IDEMPRESASUCURSAL")
        oddlEMPRESASECTOR.SelectedValue = ogvEMPRESAOPERADOR.SelectedDataKey.Item("IDEMPRESASECTOR")
        otxtEMPRESAOPERADORESTADO.Checked = ogvEMPRESAOPERADOR.SelectedDataKey.Item("EMPRESAOPERADORESTADO")
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
                .CommandText = "EMPRESAOPERADORAM"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                 cmd.Parameters.Add("@IDEMPRESAOPERADOR", Data.SqlDbType.Int).SqlValue = olblIDEMPRESAOPERADOR.Text
                cmd.Parameters.Add("@IDOPERADOR", Data.SqlDbType.Int).SqlValue = oddlOPERADOR.SelectedValue
                cmd.Parameters.Add("@IDEMPRESA", Data.SqlDbType.Int).SqlValue = oddlEMPRESA.SelectedValue
                cmd.Parameters.Add("@IDEMPRESASUCURSAL", Data.SqlDbType.Int).SqlValue = oddlEMPRESASUCURSAL.SelectedValue
                cmd.Parameters.Add("@IDEMPRESASECTOR", Data.SqlDbType.Int).SqlValue = oddlEMPRESASECTOR.SelectedValue
                cmd.Parameters.Add("@EMPRESAOPERADORESTADO", Data.SqlDbType.Bit).SqlValue = otxtEMPRESAOPERADORESTADO.Checked
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