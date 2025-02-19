
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_SORTEOPREMIO         

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblSORTEOPREMIOTitulo.text="PREMIOS DE SORTEOS                                                                                                                                                                                      "
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdSORTEOPREMIO.Text = "0"  
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtSORTEOPREMIOCODIGO.text=       ""
otxtSORTEOPREMIODESCRIPCION.text=         ""
otxtSORTEOPREMIOEXPLICACION.text=        ""
otxtSORTEOPREMIOORDEN.text=        ""
otxtSORTEOPREMIOCOSTO.text=       ""
otxtSORTEOPREMIOESTADO.Checked=          0
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
         ogvSORTEOPREMIO.DataBind()   
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvSORTEOPREMIO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvSORTEOPREMIO.SelectedIndexChanged                  
  oddlSORTEO.SelectedValue = oddlSORTEOOperador.SelectedValue       
  oddlSORTEO.Enabled = False   
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdSORTEOPREMIO.Text = ogvSORTEOPREMIO.SelectedDataKey.Item("IDSORTEOPREMIO")             
        oddlSORTEO.SelectedValue = ogvSORTEOPREMIO.SelectedDataKey.Item("IDSORTEO")          
        otxtSORTEOPREMIOCODIGO.text = ogvSORTEOPREMIO.SelectedDataKey.Item("SORTEOPREMIOCODIGO")                  
        otxtSORTEOPREMIODESCRIPCION.text = ogvSORTEOPREMIO.SelectedDataKey.Item("SORTEOPREMIODESCRIPCION")                    
        otxtSORTEOPREMIOEXPLICACION.text = ogvSORTEOPREMIO.SelectedDataKey.Item("SORTEOPREMIOEXPLICACION")                   
        otxtSORTEOPREMIOORDEN.text = ogvSORTEOPREMIO.SelectedDataKey.Item("SORTEOPREMIOORDEN")                  
        otxtSORTEOPREMIOCOSTO.text = ogvSORTEOPREMIO.SelectedDataKey.Item("SORTEOPREMIOCOSTO")                  
        otxtSORTEOPREMIOESTADO.Checked = ogvSORTEOPREMIO.SelectedDataKey.Item("SORTEOPREMIOESTADO")                     
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
                .CommandText = "SORTEOPREMIOAM"    

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDSORTEOPREMIO", Data.SqlDbType.Int).SqlValue = olblIDSORTEOPREMIO.Text         
         cmd.Parameters.Add("@IDSORTEO", Data.SqlDbType.Int).SqlValue = oddlSORTEO.SelectedValue      
         cmd.Parameters.Add("@SORTEOPREMIOCODIGO", Data.SqlDbType.Char).SqlValue = otxtSORTEOPREMIOCODIGO.text                
         cmd.Parameters.Add("@SORTEOPREMIODESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtSORTEOPREMIODESCRIPCION.text                  
         cmd.Parameters.Add("@SORTEOPREMIOEXPLICACION", Data.SqlDbType.Text).SqlValue = otxtSORTEOPREMIOEXPLICACION.text                 
         cmd.Parameters.Add("@SORTEOPREMIOORDEN", Data.SqlDbType.Int).SqlValue = otxtSORTEOPREMIOORDEN.text               
         cmd.Parameters.Add("@SORTEOPREMIOCOSTO", Data.SqlDbType.Float).SqlValue = otxtSORTEOPREMIOCOSTO.text               
         cmd.Parameters.Add("@SORTEOPREMIOESTADO", Data.SqlDbType.Bit).SqlValue = otxtSORTEOPREMIOESTADO.Checked                  
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