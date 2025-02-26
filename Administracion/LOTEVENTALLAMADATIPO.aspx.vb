
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_LOTEVENTALLAMADATIPO            

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblLOTEVENTALLAMADATIPOTitulo.text="TIPIFICACION DE LLAMADAS A ADHERENTES POR LOTE                                                                                                                                                          "
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdLOTEVENTALLAMADATIPO.Text = "0"    
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtLOTEVENTALLAMADATIPOCODIGO.text=          ""
otxtLOTEVENTALLAMADATIPODESCRIPCION.text=           ""
otxtLOTEVENTALLAMADATIPOEPLICACION.text=          ""
otxtLOTEVENTALLAMADATIPOESTADO.Checked=            0
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
         ogvLOTEVENTALLAMADATIPO.DataBind()     
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvLOTEVENTALLAMADATIPO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvLOTEVENTALLAMADATIPO.SelectedIndexChanged                      
  oddlLOTEVENTALLAMADA.SelectedValue = oddlLOTEVENTALLAMADAOperador.SelectedValue               
  oddlLOTEVENTALLAMADA.Enabled = False       
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdLOTEVENTALLAMADATIPO.Text = ogvLOTEVENTALLAMADATIPO.SelectedDataKey.Item("IDLOTEVENTALLAMADATIPO")                   
        oddlLOTEVENTALLAMADA.SelectedValue = ogvLOTEVENTALLAMADATIPO.SelectedDataKey.Item("IDLOTEVENTALLAMADA")                    
        otxtLOTEVENTALLAMADATIPOCODIGO.text = ogvLOTEVENTALLAMADATIPO.SelectedDataKey.Item("LOTEVENTALLAMADATIPOCODIGO")                         
        otxtLOTEVENTALLAMADATIPODESCRIPCION.text = ogvLOTEVENTALLAMADATIPO.SelectedDataKey.Item("LOTEVENTALLAMADATIPODESCRIPCION")                           
        otxtLOTEVENTALLAMADATIPOEPLICACION.text = ogvLOTEVENTALLAMADATIPO.SelectedDataKey.Item("LOTEVENTALLAMADATIPOEPLICACION")                         
        otxtLOTEVENTALLAMADATIPOESTADO.Checked = ogvLOTEVENTALLAMADATIPO.SelectedDataKey.Item("LOTEVENTALLAMADATIPOESTADO")                           
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
                .CommandText = "LOTEVENTALLAMADATIPOAM"      

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDLOTEVENTALLAMADATIPO", Data.SqlDbType.Int).SqlValue = olblIDLOTEVENTALLAMADATIPO.Text             
         cmd.Parameters.Add("@IDLOTEVENTALLAMADA", Data.SqlDbType.Int).SqlValue = oddlLOTEVENTALLAMADA.SelectedValue              
         cmd.Parameters.Add("@LOTEVENTALLAMADATIPOCODIGO", Data.SqlDbType.Char).SqlValue = otxtLOTEVENTALLAMADATIPOCODIGO.text                    
         cmd.Parameters.Add("@LOTEVENTALLAMADATIPODESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtLOTEVENTALLAMADATIPODESCRIPCION.text                       
         cmd.Parameters.Add("@LOTEVENTALLAMADATIPOEPLICACION", Data.SqlDbType.Text).SqlValue = otxtLOTEVENTALLAMADATIPOEPLICACION.text                     
         cmd.Parameters.Add("@LOTEVENTALLAMADATIPOESTADO", Data.SqlDbType.Bit).SqlValue = otxtLOTEVENTALLAMADATIPOESTADO.Checked                      
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