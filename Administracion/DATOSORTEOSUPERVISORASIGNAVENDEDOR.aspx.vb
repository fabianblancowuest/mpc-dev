
Partial Class Administracion_DATOSORTEOSUPERVISORASIGNAVENDEDOR
    Inherits System.Web.UI.Page

 

    Protected Sub obutSupervisorAsignaDatosVendedor_Click(sender As Object, e As EventArgs) Handles obutSupervisorAsignaDatosVendedor.Click
        olblMensaje.Text = ""
        If oddlOperador.SelectedValue = 0 Then
            olblMensaje.Text = "Debe seleccionar un operador a quien asignar los datos."
        Else
            asentarVendedor()

        End If
    End Sub

    Private Sub asentarVendedor()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim idSorteoDatoClienteCampanaDato As Label
        Dim seleccion As CheckBox

        Dim fila As Integer

        olblMensaje.Text = ""


        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoDatoClienteCampanaDatoAsignacionAccion"
            End With


            For Each Row In ogvDatoClienteCampanaDato.Rows


                'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                idSorteoDatoClienteCampanaDato = CType(Row.FindControl("olblidSorteoDatoClienteCampanaDato"), Label)
                seleccion = CType(Row.FindControl("ochSeleccion"), CheckBox)

                If seleccion.Checked = True Then
                    Try
                        cmd.Parameters.Clear()
                        connection.Open()
                        cmd.Parameters.Add("@idSorteoDatoClienteCampanaDato", Data.SqlDbType.Int).SqlValue = idSorteoDatoClienteCampanaDato.Text
                        cmd.Parameters.Add("@idSupervisor", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                        cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = oddlOperador.SelectedValue




                        reader = cmd.ExecuteReader()


                    Catch ex As Exception
                        olblMensaje.Text = LTrim(RTrim(olblMensaje.Text)) + " Error: " + ex.ToString

                    End Try
                    connection.Close()
                End If




                fila = fila + 1

            Next
        End Using
        'olblMensaje.Text = "Actualizacion realizada correctamente"
        ogvDatoClienteCampanaDato.DataBind()

    End Sub



    Private Sub colorear()
        Dim RowColor As GridViewRow
        Dim olblColor As Label

        For Each RowColor In ogvDatoClienteCampanaDato.Rows

            olblColor = CType(RowColor.FindControl("olblColorMensajeEnviado"), Label)


            If olblColor.Text = "BLANCO" Then
                RowColor.Cells(14).BackColor = Drawing.Color.White
                RowColor.Cells(14).ForeColor = Drawing.Color.White
            End If
            If olblColor.Text = "ROSADO" Then
                RowColor.Cells(14).BackColor = Drawing.Color.Pink
                RowColor.Cells(14).ForeColor = Drawing.Color.Pink
            End If
            If olblColor.Text = "AMARILLO" Then
                RowColor.Cells(14).BackColor = Drawing.Color.Yellow
                RowColor.Cells(14).ForeColor = Drawing.Color.Yellow 
            End If
            If olblColor.Text = "AZUL" Then
                RowColor.Cells(14).BackColor = Drawing.Color.Blue
                RowColor.Cells(14).ForeColor = Drawing.Color.Blue
            End If
            If olblColor.Text = "ROJO" Then
                RowColor.Cells(14).BackColor = Drawing.Color.Red
                RowColor.Cells(14).ForeColor = Drawing.Color.Red
            End If
            If olblColor.Text = "VERDE" Then
                RowColor.Cells(14).BackColor = Drawing.Color.Green
                RowColor.Cells(14).ForeColor = Drawing.Color.Green
            End If

            olblColor = CType(RowColor.FindControl("olblColorRespuestaCliente"), Label)


            If olblColor.Text = "BLANCO" Then
                RowColor.Cells(15).BackColor = Drawing.Color.White
                RowColor.Cells(15).ForeColor = Drawing.Color.White
            End If
            If olblColor.Text = "ROSADO" Then
                RowColor.Cells(15).BackColor = Drawing.Color.Pink
                RowColor.Cells(15).ForeColor = Drawing.Color.Pink
            End If
            If olblColor.Text = "AMARILLO" Then
                RowColor.Cells(15).BackColor = Drawing.Color.Yellow
                RowColor.Cells(15).ForeColor = Drawing.Color.Yellow
            End If
            If olblColor.Text = "AZUL" Then
                RowColor.Cells(15).BackColor = Drawing.Color.Blue
                RowColor.Cells(15).ForeColor = Drawing.Color.Blue
            End If
            If olblColor.Text = "ROJO" Then
                RowColor.Cells(15).BackColor = Drawing.Color.Red
                RowColor.Cells(15).ForeColor = Drawing.Color.Red
            End If
            If olblColor.Text = "VERDE" Then
                RowColor.Cells(15).BackColor = Drawing.Color.Green
                RowColor.Cells(15).ForeColor = Drawing.Color.Green
            End If

            olblColor = CType(RowColor.FindControl("olblColorLlamada"), Label)

            If olblColor.Text = "BLANCO" Then
                RowColor.Cells(16).BackColor = Drawing.Color.White
                RowColor.Cells(16).ForeColor = Drawing.Color.White
            End If
            If olblColor.Text = "ROSADO" Then
                RowColor.Cells(16).BackColor = Drawing.Color.Pink
                RowColor.Cells(16).ForeColor = Drawing.Color.Pink
            End If
            If olblColor.Text = "AMARILLO" Then
                RowColor.Cells(16).BackColor = Drawing.Color.Yellow
                RowColor.Cells(16).ForeColor = Drawing.Color.Yellow
            End If
            If olblColor.Text = "AZUL" Then
                RowColor.Cells(16).BackColor = Drawing.Color.Blue
                RowColor.Cells(16).ForeColor = Drawing.Color.Blue
            End If
            If olblColor.Text = "ROJO" Then
                RowColor.Cells(16).BackColor = Drawing.Color.Red
                RowColor.Cells(16).ForeColor = Drawing.Color.Red
            End If
            If olblColor.Text = "VERDE" Then
                RowColor.Cells(16).BackColor = Drawing.Color.Green
                RowColor.Cells(16).ForeColor = Drawing.Color.Green
            End If

            olblColor = CType(RowColor.FindControl("olblColorEntrevista"), Label)


            If olblColor.Text = "BLANCO" Then
                RowColor.Cells(17).BackColor = Drawing.Color.White
                RowColor.Cells(17).ForeColor = Drawing.Color.White
            End If
            If olblColor.Text = "ROSADO" Then
                RowColor.Cells(17).BackColor = Drawing.Color.Pink
                RowColor.Cells(17).ForeColor = Drawing.Color.Pink
            End If
            If olblColor.Text = "AMARILLO" Then
                RowColor.Cells(17).BackColor = Drawing.Color.Yellow
                RowColor.Cells(17).ForeColor = Drawing.Color.Yellow
            End If
            If olblColor.Text = "AZUL" Then
                RowColor.Cells(17).BackColor = Drawing.Color.Blue
                RowColor.Cells(17).ForeColor = Drawing.Color.Blue
            End If
            If olblColor.Text = "ROJO" Then
                RowColor.Cells(17).BackColor = Drawing.Color.Red
                RowColor.Cells(17).ForeColor = Drawing.Color.Red

            End If

            If olblColor.Text = "VERDE" Then
                RowColor.Cells(17).BackColor = Drawing.Color.Green
                RowColor.Cells(17).ForeColor = Drawing.Color.Green

            End If



        Next
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        ogvDatoClienteCampanaDato.DataBind()

        colorear()

    End Sub

    

    Protected Sub orbTipoVista_SelectedIndexChanged(sender As Object, e As EventArgs) Handles orbTipoVista.SelectedIndexChanged
      
        tipoVista()

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        tipoVista()

        olblFilasRecuperadas.Text = ogvDatoClienteCampanaDato.Rows.Count.ToString

    End Sub

    Private Sub tipoVista()
        If orbTipoVista.SelectedValue = "1" Then
            obutSupervisorAsignaDatosVendedor.Visible = True
            ogvDatoClienteCampanaDato.Columns(10).Visible = True
            ogvDatoClienteCampanaDato.Columns(11).Visible = True

        Else
            If oddlOperador.SelectedValue.ToString = "0" Then
                ogvDatoClienteCampanaDato.Columns(10).Visible = True
                ogvDatoClienteCampanaDato.Columns(11).Visible = True
            Else
                ogvDatoClienteCampanaDato.Columns(10).Visible = False
                ogvDatoClienteCampanaDato.Columns(11).Visible = False

            End If
            obutSupervisorAsignaDatosVendedor.Visible = False
        End If

    End Sub
    Protected Sub ogvDatoClienteCampanaDato_DataBinding(sender As Object, e As EventArgs) Handles ogvDatoClienteCampanaDato.DataBinding
        colorear()

    End Sub

    Protected Sub oddlOperador_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlOperador.SelectedIndexChanged
        tipoVista()
        colorear()

    End Sub

    Protected Sub ogvDatoClienteCampanaDato_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvDatoClienteCampanaDato.SelectedIndexChanged
        olblidSorteoDatoClienteCampanaDato.Text = ogvDatoClienteCampanaDato.SelectedDataKey.Item("idSorteoDatoClienteCampanaDato")
        olblapellidoYNombres.Text = ogvDatoClienteCampanaDato.SelectedDataKey.Item("apellidoYNombres")
        olblcelularNumero.Text = ogvDatoClienteCampanaDato.SelectedDataKey.Item("celularNumero")
        olblcorreoElectronico.Text = ogvDatoClienteCampanaDato.SelectedDataKey.Item("correoElectronico")


        actuaciones()

    End Sub


    Private Sub actuaciones()
        PanelPrincipal.Visible = False
        PanelActuacion.Visible = True
        ogvSorteoDatoClienteCampanaDatoActuacionVer.DataBind()
        ogvTelefonoMensajeria.DataBind()


    End Sub

    Protected Sub obutActuacionVolver_Click(sender As Object, e As EventArgs) Handles obutActuacionVolver.Click
        PanelPrincipal.Visible = True
        PanelActuacion.Visible = False


    End Sub
End Class
