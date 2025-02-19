
Partial Class ventaWEB_referidor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then

        Else
            otxtExplicacion.Text = "Usted llega a esta pagina por haber adquirido billetes para el sorteo del dia de la madre por parte de un vendedor autorizado de Mi Primer Casa S.A. o de un referidor que lo invitó para que realice la compra de billetes o carge sus propios referidos. " + Chr(13) + Chr(13) + "Estos referidos recibirán un mensaje de invitación a comprar los billetes de sorteos y , por cada una de sus compras , usted será beneficiado con un billete del valor de u$s 1 (un dólar) , aumentando así sus posibilidades en cada sorteo semanal y tambien del final. "
            otxtExplicacion.TextMode = TextBoxMode.MultiLine
            otxtExplicacion.Enabled = False
            otxtExplicacion.BackColor = Drawing.Color.White
            otxtExplicacion.BorderWidth = 0
            olblReferidoID.Text = Request.QueryString("referidoID")
            cargaReferidor()


            otxtExplicacion.Height = 190



        End If
    End Sub




    Private Sub cargaReferidor()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("strsystem")
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        olblError.Text = ""
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "referidorCarga"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@referidoID", Data.SqlDbType.Char).SqlValue = olblReferidoID.text

                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblidOperador.Text = reader.Item("idOperador")
                        olblOperadorDescripcion.Text = reader.Item("operadorDescripcion")
                        otxtReferidorTelefono.Text = reader.Item("referidoCelular")
                        otxtReferidorDescripcion.Text = reader.Item("referidoRazonSocial")


                    End While
                End If
            Catch ex As Exception

                olblError.Text = ex.Message.ToString

            End Try
            connection.Close()
        End Using





    End Sub

    Protected Sub obutInfo_Click(sender As Object, e As EventArgs) Handles obutInfo.Click
        If PanelInfo.Visible = False Then
            PanelInfo.Visible = True
            obutInfo.Text = "Ocultar informacion"
        Else
            PanelInfo.Visible = False
            obutInfo.Text = "Por qué recibo este enlace?"
        End If
    End Sub

    Protected Sub obutReferidoAlta_Click(sender As Object, e As EventArgs) Handles obutReferidoAlta.Click
        PanelAlta.Visible = True

    End Sub

    Protected Sub obutReferridoAltaConfirma_Click(sender As Object, e As EventArgs) Handles obutReferridoAltaConfirma.Click
        Dim alta As Integer
        alta = 0

        olblValidacionMensaje.Text = ""
        If Len(LTrim(RTrim(otxtAltaReferidoTelefono.Text))) = 10 Then
            otxtAltaReferidoTelefono.Text = "+549" + LTrim(RTrim(otxtAltaReferidoTelefono.Text))
            alta = 1
        End If


        If Len(LTrim(RTrim(otxtAltaReferidoTelefono.Text))) <> 14 Then
            olblValidacionMensaje.Text = "El formato de telefono debe contemplar la forma +549 area telefono  . Ejemplo : +5493704234400 y completar los 14 caracteres incluyendo el + "
            alta = 1

        End If
        If Len(LTrim(RTrim(otxtAltaReferidoDescricion.Text))) < 10 Then
            olblValidacionMensaje.Text = olblValidacionMensaje.Text + " - Debe ingresar el apellido y nombre de su persona referida."
            alta = 1

        End If
        If oddlReferidoVinculo.SelectedValue = 1 Then
            olblValidacionMensaje.Text = olblValidacionMensaje.Text + " - Debe seleccionar un vinculo con la persona referida."
            alta = 1

        End If

        If alta = 1 Then
            olblValidacionMensaje.Text = olblValidacionMensaje.Text + " - EL REFERIDO NO PUEDE DARSE DE ALTA."
        Else
            referidoAlta()


        End If
    End Sub


    Private Sub referidoAlta()
        altaConfirmada()

        PanelAlta.Visible = False
        ogvReferidos.DataBind()


    End Sub


    Private Sub altaConfirmada()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("strsystem")
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        olblError.Text = ""
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "referidorReferidoAlta"

                .Parameters.Clear()
            End With
            Try
                connection.Open()
                cmd.Parameters.Add("@referidoCelular", Data.SqlDbType.Char).SqlValue = otxtAltaReferidoTelefono.Text
                cmd.Parameters.Add("@referidoRazonSocial", Data.SqlDbType.Char).SqlValue = otxtAltaReferidoDescricion.Text
                cmd.Parameters.Add("@referidorCelular", Data.SqlDbType.Char).SqlValue = otxtReferidorTelefono.Text
                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = olblidOperador.Text
                cmd.Parameters.Add("@idReferidoVinculo", Data.SqlDbType.Int).SqlValue = oddlReferidoVinculo.SelectedValue
                
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblValidacionMensaje.Text = reader.Item("gestionDescripcion")


                    End While
                End If
            Catch ex As Exception

                olblValidacionMensaje.Text = ex.Message.ToString

            End Try
            connection.Close()
        End Using




    End Sub
End Class
