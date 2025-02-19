
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_GARRENDICION        

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblGARRENDICIONTitulo.text="RENDICION DE GASTOS                                                                                                                                                                                     "
otxtGARRENDICIONFECHA.Attributes.Add("readonly", "readonly")    
otxtGARRENDICIONFECHA.Text = Left(Date.Today.ToString, 10)     
otxtGARRENDICIONFECHAA.Attributes.Add("readonly", "readonly")     
otxtGARRENDICIONFECHAA.Text = Left(Date.Today.ToString, 10)      
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdGARRENDICION.Text = "0" 
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtGARRENDICIONFECHA.text=      ""
otxtGARRENDICIONMONTOGAI.text=       ""
otxtGARRENDICIONMONTOTRANSFERENCIAEMPRESA.text=               ""
otxtGARRENDICIONMONTOOPERADORACUENTA.text=              ""
otxtGARRENDICIONCOMPROBANTE.text=          ""
otxtGARRENDICIONDESCRIPCION.text=       ""
otxtGARRENDICIONCOMPROBANTEIMAGEN.text=            ""
otxtGARRENDICIONESTADO.Checked=        0
otxtGARRENDICIONFECHAA.text=       ""
otxtGARADMINISTRACIONRENDICIONOPERADOR.text=            ""
otxtGARRENDICIONASIENTOCABECERA.text=          ""
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
         ogvGARRENDICION.DataBind() 
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvGARRENDICION_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvGARRENDICION.SelectedIndexChanged               
  oddlGAR.SelectedValue = oddlGAROperador.SelectedValue     
  oddlGAR.Enabled = False  
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdGARRENDICION.Text = ogvGARRENDICION.SelectedDataKey.Item("IDGARRENDICION")         
        oddlGAR.SelectedValue = ogvGARRENDICION.SelectedDataKey.Item("IDGAR")      
        otxtGARRENDICIONFECHA.text = ogvGARRENDICION.SelectedDataKey.Item("GARRENDICIONFECHA")              
        oddlGARCOMPROBANTETIPO.SelectedValue = ogvGARRENDICION.SelectedDataKey.Item("IDGARCOMPROBANTETIPO")                   
        otxtGARRENDICIONMONTOGAI.text = ogvGARRENDICION.SelectedDataKey.Item("GARRENDICIONMONTOGAI")                 
        otxtGARRENDICIONMONTOTRANSFERENCIAEMPRESA.text = ogvGARRENDICION.SelectedDataKey.Item("GARRENDICIONMONTOTRANSFERENCIAEMPRESA")                                 
        otxtGARRENDICIONMONTOOPERADORACUENTA.text = ogvGARRENDICION.SelectedDataKey.Item("GARRENDICIONMONTOOPERADORACUENTA")                              
        otxtGARRENDICIONCOMPROBANTE.text = ogvGARRENDICION.SelectedDataKey.Item("GARRENDICIONCOMPROBANTE")                     
        otxtGARRENDICIONDESCRIPCION.text = ogvGARRENDICION.SelectedDataKey.Item("GARRENDICIONDESCRIPCION")                 
        otxtGARRENDICIONCOMPROBANTEIMAGEN.text = ogvGARRENDICION.SelectedDataKey.Item("GARRENDICIONCOMPROBANTEIMAGEN")                          
        otxtGARRENDICIONESTADO.Checked = ogvGARRENDICION.SelectedDataKey.Item("GARRENDICIONESTADO")                 
        otxtGARRENDICIONFECHAA.text = ogvGARRENDICION.SelectedDataKey.Item("GARRENDICIONFECHAA")               
        otxtGARADMINISTRACIONRENDICIONOPERADOR.text = ogvGARRENDICION.SelectedDataKey.Item("GARADMINISTRACIONRENDICIONOPERADOR")                           
        otxtGARRENDICIONASIENTOCABECERA.text = ogvGARRENDICION.SelectedDataKey.Item("GARRENDICIONASIENTOCABECERA")                      
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
                .CommandText = "GARRENDICIONAM"  

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDGARRENDICION", Data.SqlDbType.Int).SqlValue = olblIDGARRENDICION.Text       
         cmd.Parameters.Add("@IDGAR", Data.SqlDbType.Int).SqlValue = oddlGAR.SelectedValue    
         cmd.Parameters.Add("@GARRENDICIONFECHA", Data.SqlDbType.DateTime).SqlValue = otxtGARRENDICIONFECHA.text              
         cmd.Parameters.Add("@IDGARCOMPROBANTETIPO", Data.SqlDbType.Int).SqlValue = oddlGARCOMPROBANTETIPO.SelectedValue                 
         cmd.Parameters.Add("@GARRENDICIONMONTOGAI", Data.SqlDbType.Float).SqlValue = otxtGARRENDICIONMONTOGAI.text               
         cmd.Parameters.Add("@GARRENDICIONMONTOTRANSFERENCIAEMPRESA", Data.SqlDbType.Float).SqlValue = otxtGARRENDICIONMONTOTRANSFERENCIAEMPRESA.text                               
         cmd.Parameters.Add("@GARRENDICIONMONTOOPERADORACUENTA", Data.SqlDbType.Float).SqlValue = otxtGARRENDICIONMONTOOPERADORACUENTA.text                             
         cmd.Parameters.Add("@GARRENDICIONCOMPROBANTE", Data.SqlDbType.Char).SqlValue = otxtGARRENDICIONCOMPROBANTE.text                    
         cmd.Parameters.Add("@GARRENDICIONDESCRIPCION", Data.SqlDbType.Text).SqlValue = otxtGARRENDICIONDESCRIPCION.text                
         cmd.Parameters.Add("@GARRENDICIONCOMPROBANTEIMAGEN", Data.SqlDbType.Char).SqlValue = otxtGARRENDICIONCOMPROBANTEIMAGEN.text                         
         cmd.Parameters.Add("@GARRENDICIONESTADO", Data.SqlDbType.Bit).SqlValue = otxtGARRENDICIONESTADO.Checked               
         cmd.Parameters.Add("@GARRENDICIONFECHAA", Data.SqlDbType.DateTime).SqlValue = otxtGARRENDICIONFECHAA.text               
         cmd.Parameters.Add("@GARADMINISTRACIONRENDICIONOPERADOR", Data.SqlDbType.Int).SqlValue = otxtGARADMINISTRACIONRENDICIONOPERADOR.text                        
         cmd.Parameters.Add("@GARRENDICIONASIENTOCABECERA", Data.SqlDbType.Int).SqlValue = otxtGARRENDICIONASIENTOCABECERA.text                    
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