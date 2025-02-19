
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_ACCESOROL        

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
            olblACCESOROLTitulo.text = "ROLES DEL SISTEMA                                                                                                                                                                                       "

            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdACCESOROL.Text = "0" 
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtACCESOROLCODIGO.text=      ""
otxtACCESOROLDESCRIPCION.text=        ""
otxtACCESOROLEXPLICACION.text=       ""
otxtACCESOROLPAGINA.text=      ""
otxtACCESOROLDOCUMENTOOPERATIVO.text=            ""
otxtACCESOROLESTADO.Checked=         0
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
         ogvACCESOROL.DataBind()  
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvACCESOROL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvACCESOROL.SelectedIndexChanged                
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdACCESOROL.Text = ogvACCESOROL.SelectedDataKey.Item("IDACCESOROL")          
        otxtACCESOROLCODIGO.text = ogvACCESOROL.SelectedDataKey.Item("ACCESOROLCODIGO")               
        otxtACCESOROLDESCRIPCION.text = ogvACCESOROL.SelectedDataKey.Item("ACCESOROLDESCRIPCION")                 
        otxtACCESOROLEXPLICACION.text = ogvACCESOROL.SelectedDataKey.Item("ACCESOROLEXPLICACION")                
        otxtACCESOROLPAGINA.text = ogvACCESOROL.SelectedDataKey.Item("ACCESOROLPAGINA")              
        otxtACCESOROLDOCUMENTOOPERATIVO.text = ogvACCESOROL.SelectedDataKey.Item("ACCESOROLDOCUMENTOOPERATIVO")                           
        otxtACCESOROLESTADO.Checked = ogvACCESOROL.SelectedDataKey.Item("ACCESOROLESTADO")                  
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
                .CommandText = "ACCESOROLAM"   

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDACCESOROL", Data.SqlDbType.Int).SqlValue = olblIDACCESOROL.Text       
         cmd.Parameters.Add("@ACCESOROLCODIGO", Data.SqlDbType.Char).SqlValue = otxtACCESOROLCODIGO.text              
         cmd.Parameters.Add("@ACCESOROLDESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtACCESOROLDESCRIPCION.text                
         cmd.Parameters.Add("@ACCESOROLEXPLICACION", Data.SqlDbType.Text).SqlValue = otxtACCESOROLEXPLICACION.text               
         cmd.Parameters.Add("@ACCESOROLPAGINA", Data.SqlDbType.Char).SqlValue = otxtACCESOROLPAGINA.text             
         cmd.Parameters.Add("@ACCESOROLDOCUMENTOOPERATIVO", Data.SqlDbType.Char).SqlValue = otxtACCESOROLDOCUMENTOOPERATIVO.text                          
         cmd.Parameters.Add("@ACCESOROLESTADO", Data.SqlDbType.Bit).SqlValue = otxtACCESOROLESTADO.Checked                
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