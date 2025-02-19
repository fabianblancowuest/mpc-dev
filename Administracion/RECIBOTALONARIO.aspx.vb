
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_RECIBOTALONARIO         

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblRECIBOTALONARIOTitulo.text="ALTA DE TALONARIOS DE RECIBOS                                                                                                                                                                           "
otxtFECHASOLICITUD.Attributes.Add("readonly", "readonly")  
otxtFECHASOLICITUD.Text = Left(Date.Today.ToString, 10)   
otxtFECHARECEPCION.Attributes.Add("readonly", "readonly")    
otxtFECHARECEPCION.Text = Left(Date.Today.ToString, 10)    
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdRECIBOTALONARIO.Text = "0"  
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtRECIBOTALONARIOCODIGO.text=       ""
otxtRECIBOTALONARIODESCRIPCION.text=        ""
otxtFECHASOLICITUD.text=    ""
otxtFECHARECEPCION.text=     ""
otxtRECIBOTALONARIONUMEROPUNTOVENTA.text=             ""
otxtRECIBOTALONARIOLETRA.text=       ""
otxtRECIBOTALONARIONUMERODESDE.text=           ""
otxtRECIBOTALONARIONUMEROHASTA.text=          ""
otxtRECIBOTALONARIOEXPLICACION.text=        ""
otxtRECIBOTALONARIOESTADO.Checked=         0
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
         ogvRECIBOTALONARIO.DataBind()  
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvRECIBOTALONARIO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvRECIBOTALONARIO.SelectedIndexChanged                 
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdRECIBOTALONARIO.Text = ogvRECIBOTALONARIO.SelectedDataKey.Item("IDRECIBOTALONARIO")            
        otxtRECIBOTALONARIOCODIGO.text = ogvRECIBOTALONARIO.SelectedDataKey.Item("RECIBOTALONARIOCODIGO")                  
        otxtRECIBOTALONARIODESCRIPCION.text = ogvRECIBOTALONARIO.SelectedDataKey.Item("RECIBOTALONARIODESCRIPCION")                    
        otxtFECHASOLICITUD.text = ogvRECIBOTALONARIO.SelectedDataKey.Item("FECHASOLICITUD")           
        otxtFECHARECEPCION.text = ogvRECIBOTALONARIO.SelectedDataKey.Item("FECHARECEPCION")              
        otxtRECIBOTALONARIONUMEROPUNTOVENTA.text = ogvRECIBOTALONARIO.SelectedDataKey.Item("RECIBOTALONARIONUMEROPUNTOVENTA")                             
        otxtRECIBOTALONARIOLETRA.text = ogvRECIBOTALONARIO.SelectedDataKey.Item("RECIBOTALONARIOLETRA")                
        otxtRECIBOTALONARIONUMERODESDE.text = ogvRECIBOTALONARIO.SelectedDataKey.Item("RECIBOTALONARIONUMERODESDE")                         
        otxtRECIBOTALONARIONUMEROHASTA.text = ogvRECIBOTALONARIO.SelectedDataKey.Item("RECIBOTALONARIONUMEROHASTA")                        
        otxtRECIBOTALONARIOEXPLICACION.text = ogvRECIBOTALONARIO.SelectedDataKey.Item("RECIBOTALONARIOEXPLICACION")                   
        otxtRECIBOTALONARIOESTADO.Checked = ogvRECIBOTALONARIO.SelectedDataKey.Item("RECIBOTALONARIOESTADO")                    
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
                .CommandText = "RECIBOTALONARIOAM"   

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDRECIBOTALONARIO", Data.SqlDbType.Int).SqlValue = olblIDRECIBOTALONARIO.Text         
         cmd.Parameters.Add("@RECIBOTALONARIOCODIGO", Data.SqlDbType.Char).SqlValue = otxtRECIBOTALONARIOCODIGO.text                
         cmd.Parameters.Add("@RECIBOTALONARIODESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtRECIBOTALONARIODESCRIPCION.text                  
         cmd.Parameters.Add("@FECHASOLICITUD", Data.SqlDbType.Date).SqlValue = otxtFECHASOLICITUD.text         
         cmd.Parameters.Add("@FECHARECEPCION", Data.SqlDbType.Date).SqlValue = otxtFECHARECEPCION.text            
         cmd.Parameters.Add("@RECIBOTALONARIONUMEROPUNTOVENTA", Data.SqlDbType.Int).SqlValue = otxtRECIBOTALONARIONUMEROPUNTOVENTA.text                         
         cmd.Parameters.Add("@RECIBOTALONARIOLETRA", Data.SqlDbType.Char).SqlValue = otxtRECIBOTALONARIOLETRA.text              
         cmd.Parameters.Add("@RECIBOTALONARIONUMERODESDE", Data.SqlDbType.Int).SqlValue = otxtRECIBOTALONARIONUMERODESDE.text                     
         cmd.Parameters.Add("@RECIBOTALONARIONUMEROHASTA", Data.SqlDbType.Int).SqlValue = otxtRECIBOTALONARIONUMEROHASTA.text                     
         cmd.Parameters.Add("@RECIBOTALONARIOEXPLICACION", Data.SqlDbType.Char).SqlValue = otxtRECIBOTALONARIOEXPLICACION.text                 
         cmd.Parameters.Add("@RECIBOTALONARIOESTADO", Data.SqlDbType.Bit).SqlValue = otxtRECIBOTALONARIOESTADO.Checked                 
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