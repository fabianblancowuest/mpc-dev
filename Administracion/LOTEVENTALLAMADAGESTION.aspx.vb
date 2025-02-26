
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_LOTEVENTALLAMADAGESTION             

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblLOTEVENTALLAMADAGESTIONTitulo.text="GESTION DE LLAMADAS POR BARRIO Y LOTE.                                                                                                                                                                  "
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdLOTEVENTALLAMADAGESTION.Text = "0"      
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtLOTEVENTALLAMADAFECHA.text=         ""
otxtLOTEVENTALLAMADACOMENTARIO.text=           ""
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
         ogvLOTEVENTALLAMADAGESTION.DataBind()      
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvLOTEVENTALLAMADAGESTION_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvLOTEVENTALLAMADAGESTION.SelectedIndexChanged                         
  oddlOPERADOR.SelectedValue = oddlOPERADOROperador.SelectedValue          
  oddlOPERADOR.Enabled = False    
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdLOTEVENTALLAMADAGESTION.Text = ogvLOTEVENTALLAMADAGESTION.SelectedDataKey.Item("IDLOTEVENTALLAMADAGESTION")                        
        oddlOPERADOR.SelectedValue = ogvLOTEVENTALLAMADAGESTION.SelectedDataKey.Item("IDOPERADOR")                
        oddlLOTEVENTA.SelectedValue = ogvLOTEVENTALLAMADAGESTION.SelectedDataKey.Item("IDLOTEVENTA")               
        oddlLOTEVENTALLAMADATIPO.SelectedValue = ogvLOTEVENTALLAMADAGESTION.SelectedDataKey.Item("IDLOTEVENTALLAMADATIPO")                       
        otxtLOTEVENTALLAMADAFECHA.text = ogvLOTEVENTALLAMADAGESTION.SelectedDataKey.Item("LOTEVENTALLAMADAFECHA")                        
        otxtLOTEVENTALLAMADACOMENTARIO.text = ogvLOTEVENTALLAMADAGESTION.SelectedDataKey.Item("LOTEVENTALLAMADACOMENTARIO")                            
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
                .CommandText = "LOTEVENTALLAMADAGESTIONAM"       

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDLOTEVENTALLAMADAGESTION", Data.SqlDbType.Int).SqlValue = olblIDLOTEVENTALLAMADAGESTION.Text                 
         cmd.Parameters.Add("@IDOPERADOR", Data.SqlDbType.Int).SqlValue = oddlOPERADOR.SelectedValue         
         cmd.Parameters.Add("@IDLOTEVENTA", Data.SqlDbType.Int).SqlValue = oddlLOTEVENTA.SelectedValue        
         cmd.Parameters.Add("@IDLOTEVENTALLAMADATIPO", Data.SqlDbType.Int).SqlValue = oddlLOTEVENTALLAMADATIPO.SelectedValue                
         cmd.Parameters.Add("@LOTEVENTALLAMADAFECHA", Data.SqlDbType.Int).SqlValue = otxtLOTEVENTALLAMADAFECHA.text                 
         cmd.Parameters.Add("@LOTEVENTALLAMADACOMENTARIO", Data.SqlDbType.Char).SqlValue = otxtLOTEVENTALLAMADACOMENTARIO.text                      
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.text=reader.item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
            olblGestionDescripcion.Text =ex.Message
            End Try
            connection.Close()
        End Using
    End Sub
End Class 