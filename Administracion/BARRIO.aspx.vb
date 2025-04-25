
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_BARRIO      

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblBARRIOTitulo.text="BARRIOS                                                                                                                                                                                                 "
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdBARRIO.Text = "0"
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtBARRIOCODIGO.text=    ""
otxtBARRIODESCRIPCION.text=     ""
otxtBARRIOEXPLICACION.text=     ""
otxtBARRIOPLANO.text=    ""
otxtBARRIOESTADO.Checked=      0
otxtBARRIOVENDEDORHABILITADO.Checked=          0
otxtBARRIOPORCENTAJECOMISIONADHESION.text=            ""
otxtBARRIOPORCENTAJECOMISIONCUOTA.text=           ""
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
         ogvBARRIO.DataBind()
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvBARRIO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvBARRIO.SelectedIndexChanged           
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdBARRIO.Text = ogvBARRIO.SelectedDataKey.Item("IDBARRIO")   
        otxtBARRIOCODIGO.text = ogvBARRIO.SelectedDataKey.Item("BARRIOCODIGO")        
        otxtBARRIODESCRIPCION.text = ogvBARRIO.SelectedDataKey.Item("BARRIODESCRIPCION")          
        otxtBARRIOEXPLICACION.text = ogvBARRIO.SelectedDataKey.Item("BARRIOEXPLICACION")         
        otxtBARRIOPLANO.text = ogvBARRIO.SelectedDataKey.Item("BARRIOPLANO")        
        otxtBARRIOESTADO.Checked = ogvBARRIO.SelectedDataKey.Item("BARRIOESTADO")           
        oddlCBARRIO.SelectedValue = ogvBARRIO.SelectedDataKey.Item("IDCBARRIO")      
        oddlACTUALIZACIONMODO.SelectedValue = ogvBARRIO.SelectedDataKey.Item("IDACTUALIZACIONMODO")             
        otxtBARRIOVENDEDORHABILITADO.Checked = ogvBARRIO.SelectedDataKey.Item("BARRIOVENDEDORHABILITADO")                  
        oddlCENTROCOSTO.SelectedValue = ogvBARRIO.SelectedDataKey.Item("IDCENTROCOSTO")           
        otxtBARRIOPORCENTAJECOMISIONADHESION.text = ogvBARRIO.SelectedDataKey.Item("BARRIOPORCENTAJECOMISIONADHESION")                       
        otxtBARRIOPORCENTAJECOMISIONCUOTA.text = ogvBARRIO.SelectedDataKey.Item("BARRIOPORCENTAJECOMISIONCUOTA")                      
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
                .CommandText = "BARRIOAM"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDBARRIO", Data.SqlDbType.Int).SqlValue = olblIDBARRIO.Text  
         cmd.Parameters.Add("@BARRIOCODIGO", Data.SqlDbType.Char).SqlValue = otxtBARRIOCODIGO.text         
         cmd.Parameters.Add("@BARRIODESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtBARRIODESCRIPCION.text            
         cmd.Parameters.Add("@BARRIOEXPLICACION", Data.SqlDbType.Text).SqlValue = otxtBARRIOEXPLICACION.text          
         cmd.Parameters.Add("@BARRIOPLANO", Data.SqlDbType.Char).SqlValue = otxtBARRIOPLANO.text         
         cmd.Parameters.Add("@BARRIOESTADO", Data.SqlDbType.Bit).SqlValue = otxtBARRIOESTADO.Checked           
         cmd.Parameters.Add("@IDCBARRIO", Data.SqlDbType.Int).SqlValue = oddlCBARRIO.SelectedValue      
         cmd.Parameters.Add("@IDACTUALIZACIONMODO", Data.SqlDbType.Int).SqlValue = oddlACTUALIZACIONMODO.SelectedValue             
         cmd.Parameters.Add("@BARRIOVENDEDORHABILITADO", Data.SqlDbType.Bit).SqlValue = otxtBARRIOVENDEDORHABILITADO.Checked                   
         cmd.Parameters.Add("@IDCENTROCOSTO", Data.SqlDbType.Int).SqlValue = oddlCENTROCOSTO.SelectedValue           
         cmd.Parameters.Add("@BARRIOPORCENTAJECOMISIONADHESION", Data.SqlDbType.Float).SqlValue = otxtBARRIOPORCENTAJECOMISIONADHESION.text                        
         cmd.Parameters.Add("@BARRIOPORCENTAJECOMISIONCUOTA", Data.SqlDbType.Float).SqlValue = otxtBARRIOPORCENTAJECOMISIONCUOTA.text                      
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