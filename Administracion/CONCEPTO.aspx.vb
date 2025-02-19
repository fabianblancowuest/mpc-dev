
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_CONCEPTO        

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblCONCEPTOTitulo.text="CONCEPTOS CONTABLES                                                                                                                                                                                     "
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdCONCEPTO.Text = "0" 
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtCONCEPTOCODIGO.text=      ""
otxtCONCEPTODESCRIPCION.text=       ""
otxtCONCEPTOEXPLICACION.text=      ""
otxtCONCEPTOPRIORIDAD.text=      ""
otxtCONCEPTOESTADO.Checked=        0
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
         ogvCONCEPTO.DataBind() 
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvCONCEPTO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvCONCEPTO.SelectedIndexChanged               
  oddlEMPRESA.SelectedValue = oddlEMPRESAOperador.SelectedValue         
  oddlEMPRESA.Enabled = False    
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdCONCEPTO.Text = ogvCONCEPTO.SelectedDataKey.Item("IDCONCEPTO")        
        oddlEMPRESA.SelectedValue = ogvCONCEPTO.SelectedDataKey.Item("IDEMPRESA")          
        otxtCONCEPTOCODIGO.text = ogvCONCEPTO.SelectedDataKey.Item("CONCEPTOCODIGO")              
        otxtCONCEPTODESCRIPCION.text = ogvCONCEPTO.SelectedDataKey.Item("CONCEPTODESCRIPCION")                
        otxtCONCEPTOEXPLICACION.text = ogvCONCEPTO.SelectedDataKey.Item("CONCEPTOEXPLICACION")               
        oddlCONCEPTORUBRO.SelectedValue = ogvCONCEPTO.SelectedDataKey.Item("IDCONCEPTORUBRO")                
        oddlCOMPROBANTETIPO.SelectedValue = ogvCONCEPTO.SelectedDataKey.Item("IDCOMPROBANTETIPO")                
        otxtCONCEPTOPRIORIDAD.text = ogvCONCEPTO.SelectedDataKey.Item("CONCEPTOPRIORIDAD")              
        otxtCONCEPTOESTADO.Checked = ogvCONCEPTO.SelectedDataKey.Item("CONCEPTOESTADO")                
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
                .CommandText = "CONCEPTOAM"  

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDCONCEPTO", Data.SqlDbType.Int).SqlValue = olblIDCONCEPTO.Text      
         cmd.Parameters.Add("@IDEMPRESA", Data.SqlDbType.Int).SqlValue = oddlEMPRESA.SelectedValue        
         cmd.Parameters.Add("@CONCEPTOCODIGO", Data.SqlDbType.Char).SqlValue = otxtCONCEPTOCODIGO.text             
         cmd.Parameters.Add("@CONCEPTODESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtCONCEPTODESCRIPCION.text               
         cmd.Parameters.Add("@CONCEPTOEXPLICACION", Data.SqlDbType.Text).SqlValue = otxtCONCEPTOEXPLICACION.text              
         cmd.Parameters.Add("@IDCONCEPTORUBRO", Data.SqlDbType.Int).SqlValue = oddlCONCEPTORUBRO.SelectedValue              
         cmd.Parameters.Add("@IDCOMPROBANTETIPO", Data.SqlDbType.Int).SqlValue = oddlCOMPROBANTETIPO.SelectedValue              
         cmd.Parameters.Add("@CONCEPTOPRIORIDAD", Data.SqlDbType.Int).SqlValue = otxtCONCEPTOPRIORIDAD.text            
         cmd.Parameters.Add("@CONCEPTOESTADO", Data.SqlDbType.Bit).SqlValue = otxtCONCEPTOESTADO.Checked               
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