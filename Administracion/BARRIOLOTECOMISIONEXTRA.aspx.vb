
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_BARRIOLOTECOMISIONEXTRA            

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
            olblBARRIOLOTECOMISIONEXTRATitulo.text = "COMISION EXTRA POR LOTE VENDIDO                                                                                                                                                                         "
            otxtFECHAVIGENCIADESDE.Attributes.Add("readonly", "readonly")
            otxtFECHAVIGENCIADESDE.Text = Left(Date.Today.ToString, 10)
            otxtFECHAVIGENCIAHASTA.Attributes.Add("readonly", "readonly")
            otxtFECHAVIGENCIAHASTA.Text = Left(Date.Today.ToString, 10)

            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdBARRIOLOTECOMISIONEXTRA.Text = "0"     
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtBARRIOLOTECOMISIONEXTRAEXPLICACION.text=           ""
otxtBARRIOLOTECOMISIONEXTRAMONTO.text=          ""
otxtFECHAVIGENCIADESDE.text=      ""
otxtFECHAVIGENCIAHASTA.text=      ""
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
         ogvBARRIOLOTECOMISIONEXTRA.DataBind()     
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvBARRIOLOTECOMISIONEXTRA_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvBARRIOLOTECOMISIONEXTRA.SelectedIndexChanged                       
  oddlBARRIOLOTE.SelectedValue = oddlBARRIOLOTEOperador.SelectedValue         
  oddlBARRIOLOTE.Enabled = False    
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdBARRIOLOTECOMISIONEXTRA.Text = ogvBARRIOLOTECOMISIONEXTRA.SelectedDataKey.Item("IDBARRIOLOTECOMISIONEXTRA")                     
        oddlBARRIOLOTE.SelectedValue = ogvBARRIOLOTECOMISIONEXTRA.SelectedDataKey.Item("IDBARRIOLOTE")              
        otxtBARRIOLOTECOMISIONEXTRAEXPLICACION.text = ogvBARRIOLOTECOMISIONEXTRA.SelectedDataKey.Item("BARRIOLOTECOMISIONEXTRAEXPLICACION")                           
        otxtBARRIOLOTECOMISIONEXTRAMONTO.text = ogvBARRIOLOTECOMISIONEXTRA.SelectedDataKey.Item("BARRIOLOTECOMISIONEXTRAMONTO")                           
        otxtFECHAVIGENCIADESDE.text = ogvBARRIOLOTECOMISIONEXTRA.SelectedDataKey.Item("FECHAVIGENCIADESDE")                   
        otxtFECHAVIGENCIAHASTA.text = ogvBARRIOLOTECOMISIONEXTRA.SelectedDataKey.Item("FECHAVIGENCIAHASTA")                  
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
                .CommandText = "BARRIOLOTECOMISIONEXTRAAM"      

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@IDBARRIOLOTECOMISIONEXTRA", Data.SqlDbType.Int).SqlValue = olblIDBARRIOLOTECOMISIONEXTRA.Text
                cmd.Parameters.Add("@IDBARRIOLOTE", Data.SqlDbType.Int).SqlValue = olblidBarrioLote.text
                cmd.Parameters.Add("@BARRIOLOTECOMISIONEXTRAEXPLICACION", Data.SqlDbType.Text).SqlValue = otxtBARRIOLOTECOMISIONEXTRAEXPLICACION.text
                cmd.Parameters.Add("@BARRIOLOTECOMISIONEXTRAMONTO", Data.SqlDbType.Float).SqlValue = otxtBARRIOLOTECOMISIONEXTRAMONTO.text
                cmd.Parameters.Add("@FECHAVIGENCIADESDE", Data.SqlDbType.DateTime).SqlValue = otxtFECHAVIGENCIADESDE.text
                cmd.Parameters.Add("@FECHAVIGENCIAHASTA", Data.SqlDbType.DateTime).SqlValue = otxtFECHAVIGENCIAHASTA.text
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.text=reader.item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
            End Try
            connection.Close()
        End Using
    End Sub
End Class 