
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_COSTOREFERENCIAVALORGESTION

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
            olblCOSTOREFERENCIAVALORTitulo.Text = "                                                                                                                                                                                                        "

            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click
        olblGestionDescripcion.Text = "Esperando accion Operador."

        olblIDCOSTOREFERENCIAVALOR.Text = "0"
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta"
        otxtCOSTOREFERENCIAVALORCODIGO.Text = ""
        otxtCOSTOREFERENCIAVALORDESCRIPCION.Text = ""
        otxtCOSTOREFERENCIAVALORIMPORTE.Text = ""
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
            ogvCOSTOREFERENCIAVALOR.DataBind()
        End If
    End Sub

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvCOSTOREFERENCIAVALOR_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvCOSTOREFERENCIAVALOR.SelectedIndexChanged
        oddlCOSTOREFERENCIA.SelectedValue = oddlCOSTOREFERENCIAOperador.SelectedValue
        oddlCOSTOREFERENCIA.Enabled = False
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIDCOSTOREFERENCIAVALOR.Text = ogvCOSTOREFERENCIAVALOR.SelectedDataKey.Item("IDCOSTOREFERENCIAVALOR")
        oddlCOSTOREFERENCIA.SelectedValue = ogvCOSTOREFERENCIAVALOR.SelectedDataKey.Item("IDCOSTOREFERENCIA")
        otxtCOSTOREFERENCIAVALORCODIGO.Text = ogvCOSTOREFERENCIAVALOR.SelectedDataKey.Item("COSTOREFERENCIAVALORCODIGO")
        otxtCOSTOREFERENCIAVALORDESCRIPCION.Text = ogvCOSTOREFERENCIAVALOR.SelectedDataKey.Item("COSTOREFERENCIAVALORDESCRIPCION")
        oddlEJERCICIODETALLE.SelectedValue = ogvCOSTOREFERENCIAVALOR.SelectedDataKey.Item("IDEJERCICIODETALLE")
        otxtCOSTOREFERENCIAVALORIMPORTE.Text = ogvCOSTOREFERENCIAVALOR.SelectedDataKey.Item("COSTOREFERENCIAVALORIMPORTE")
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
                .CommandText = "COSTOREFERENCIAVALORAM"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@IDCOSTOREFERENCIAVALOR", Data.SqlDbType.Int).SqlValue = olblIDCOSTOREFERENCIAVALOR.Text
                cmd.Parameters.Add("@IDCOSTOREFERENCIA", Data.SqlDbType.Int).SqlValue = oddlCOSTOREFERENCIA.SelectedValue
                cmd.Parameters.Add("@COSTOREFERENCIAVALORCODIGO", Data.SqlDbType.Char).SqlValue = otxtCOSTOREFERENCIAVALORCODIGO.Text
                cmd.Parameters.Add("@COSTOREFERENCIAVALORDESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtCOSTOREFERENCIAVALORDESCRIPCION.Text
                cmd.Parameters.Add("@IDEJERCICIODETALLE", Data.SqlDbType.Int).SqlValue = oddlEJERCICIODETALLE.SelectedValue
                cmd.Parameters.Add("@COSTOREFERENCIAVALORIMPORTE", Data.SqlDbType.Float).SqlValue = otxtCOSTOREFERENCIAVALORIMPORTE.Text
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.Text = reader.Item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
            End Try
            connection.Close()
        End Using
    End Sub
End Class