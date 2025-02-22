
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_LOTEVENTACLIENTE         

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblLOTEVENTACLIENTETitulo.text="CLIENTES POR VENTAS DE LOTES                                                                                                                                                                            "
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdLOTEVENTACLIENTE.Text = "0"  
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtLOTEVENTACLIENTESECUENCIA.text=        ""
otxtLOTEVENTACLIENTENOMBRE.text=        ""
otxtLOTEVENTACLIENTEDNI.text=     ""
otxtLOTEVENTACLIENTEDOMICILIO.text=       ""
otxtLOTEVENTACLIENTETELEFONO.text=        ""
otxtLOTEVENTACLIENTECORREO.text=        ""
otxtLOTEVENTACLIENTECUIT.text=      ""
otxtLOTEVENTACLIENTEOBSERVACION.text=          ""
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
         ogvLOTEVENTACLIENTE.DataBind()   
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvLOTEVENTACLIENTE_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvLOTEVENTACLIENTE.SelectedIndexChanged                  
  oddlLOTEVENTA.SelectedValue = oddlLOTEVENTAOperador.SelectedValue         
  oddlLOTEVENTA.Enabled = False    
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdLOTEVENTACLIENTE.Text = ogvLOTEVENTACLIENTE.SelectedDataKey.Item("IDLOTEVENTACLIENTE")             
        oddlLOTEVENTA.SelectedValue = ogvLOTEVENTACLIENTE.SelectedDataKey.Item("IDLOTEVENTA")           
        otxtLOTEVENTACLIENTESECUENCIA.text = ogvLOTEVENTACLIENTE.SelectedDataKey.Item("LOTEVENTACLIENTESECUENCIA")                    
        otxtLOTEVENTACLIENTENOMBRE.text = ogvLOTEVENTACLIENTE.SelectedDataKey.Item("LOTEVENTACLIENTENOMBRE")                    
        otxtLOTEVENTACLIENTEDNI.text = ogvLOTEVENTACLIENTE.SelectedDataKey.Item("LOTEVENTACLIENTEDNI")              
        otxtLOTEVENTACLIENTEDOMICILIO.text = ogvLOTEVENTACLIENTE.SelectedDataKey.Item("LOTEVENTACLIENTEDOMICILIO")                 
        otxtLOTEVENTACLIENTETELEFONO.text = ogvLOTEVENTACLIENTE.SelectedDataKey.Item("LOTEVENTACLIENTETELEFONO")                    
        otxtLOTEVENTACLIENTECORREO.text = ogvLOTEVENTACLIENTE.SelectedDataKey.Item("LOTEVENTACLIENTECORREO")                    
        oddlCLIENTEIVA.SelectedValue = ogvLOTEVENTACLIENTE.SelectedDataKey.Item("IDCLIENTEIVA")        
        otxtLOTEVENTACLIENTECUIT.text = ogvLOTEVENTACLIENTE.SelectedDataKey.Item("LOTEVENTACLIENTECUIT")              
        otxtLOTEVENTACLIENTEOBSERVACION.text = ogvLOTEVENTACLIENTE.SelectedDataKey.Item("LOTEVENTACLIENTEOBSERVACION")                       
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
                .CommandText = "LOTEVENTACLIENTEAM"    

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDLOTEVENTACLIENTE", Data.SqlDbType.Int).SqlValue = olblIDLOTEVENTACLIENTE.Text         
         cmd.Parameters.Add("@IDLOTEVENTA", Data.SqlDbType.Int).SqlValue = oddlLOTEVENTA.SelectedValue        
         cmd.Parameters.Add("@LOTEVENTACLIENTESECUENCIA", Data.SqlDbType.Int).SqlValue = otxtLOTEVENTACLIENTESECUENCIA.text                 
         cmd.Parameters.Add("@LOTEVENTACLIENTENOMBRE", Data.SqlDbType.Char).SqlValue = otxtLOTEVENTACLIENTENOMBRE.text                  
         cmd.Parameters.Add("@LOTEVENTACLIENTEDNI", Data.SqlDbType.Char).SqlValue = otxtLOTEVENTACLIENTEDNI.text            
         cmd.Parameters.Add("@LOTEVENTACLIENTEDOMICILIO", Data.SqlDbType.Char).SqlValue = otxtLOTEVENTACLIENTEDOMICILIO.text               
         cmd.Parameters.Add("@LOTEVENTACLIENTETELEFONO", Data.SqlDbType.Char).SqlValue = otxtLOTEVENTACLIENTETELEFONO.text                  
         cmd.Parameters.Add("@LOTEVENTACLIENTECORREO", Data.SqlDbType.Char).SqlValue = otxtLOTEVENTACLIENTECORREO.text                  
         cmd.Parameters.Add("@IDCLIENTEIVA", Data.SqlDbType.Int).SqlValue = oddlCLIENTEIVA.SelectedValue     
         cmd.Parameters.Add("@LOTEVENTACLIENTECUIT", Data.SqlDbType.Char).SqlValue = otxtLOTEVENTACLIENTECUIT.text            
         cmd.Parameters.Add("@LOTEVENTACLIENTEOBSERVACION", Data.SqlDbType.Char).SqlValue = otxtLOTEVENTACLIENTEOBSERVACION.text                     
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