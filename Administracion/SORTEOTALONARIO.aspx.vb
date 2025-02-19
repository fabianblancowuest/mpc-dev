
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_SORTEOTALONARIO          

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblSORTEOTALONARIOTitulo.text="TALONARIOS PARA SORTEOS                                                                                                                                                                                 "
otxtFECHASOLICITUD.Attributes.Add("readonly", "readonly")  
otxtFECHASOLICITUD.Text = Left(Date.Today.ToString, 10)   
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdSORTEOTALONARIO.Text = "0"   
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtSORTEONUMERODESDE.text=        ""
otxtSORTEONUMEROHASTA.text=        ""
otxtFECHASOLICITUD.text=    ""
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
         ogvSORTEOTALONARIO.DataBind()   
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvSORTEOTALONARIO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvSORTEOTALONARIO.SelectedIndexChanged                   
  oddlSORTEO.SelectedValue = oddlSORTEOOperador.SelectedValue       
  oddlSORTEO.Enabled = False   
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdSORTEOTALONARIO.Text = ogvSORTEOTALONARIO.SelectedDataKey.Item("IDSORTEOTALONARIO")               
        oddlSORTEO.SelectedValue = ogvSORTEOTALONARIO.SelectedDataKey.Item("IDSORTEO")          
        otxtSORTEONUMERODESDE.text = ogvSORTEOTALONARIO.SelectedDataKey.Item("SORTEONUMERODESDE")                     
        otxtSORTEONUMEROHASTA.text = ogvSORTEOTALONARIO.SelectedDataKey.Item("SORTEONUMEROHASTA")                    
        otxtFECHASOLICITUD.text = ogvSORTEOTALONARIO.SelectedDataKey.Item("FECHASOLICITUD")           
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
                .CommandText = "SORTEOTALONARIOAM"    

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDSORTEOTALONARIO", Data.SqlDbType.Int).SqlValue = olblIDSORTEOTALONARIO.Text          
         cmd.Parameters.Add("@IDSORTEO", Data.SqlDbType.Int).SqlValue = oddlSORTEO.SelectedValue      
         cmd.Parameters.Add("@SORTEONUMERODESDE", Data.SqlDbType.Float).SqlValue = otxtSORTEONUMERODESDE.text                 
         cmd.Parameters.Add("@SORTEONUMEROHASTA", Data.SqlDbType.Float).SqlValue = otxtSORTEONUMEROHASTA.text                 
         cmd.Parameters.Add("@FECHASOLICITUD", Data.SqlDbType.DateTime).SqlValue = otxtFECHASOLICITUD.text         
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