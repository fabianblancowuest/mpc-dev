
Partial Class sitioWEB_barrioLoteComprador
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            olblCompradoresCantidad.Text = controlCompradores()

        Else
            personaFisica01.personaNumeroImpone("Comprador 1")
            personaFisica02.personaNumeroImpone("Comprador 2")
            personaFisica03.personaNumeroImpone("Comprador 3")
            personaFisica04.personaNumeroImpone("Comprador 4")
            personaFisica05.personaNumeroImpone("Comprador 5")
            personaFisica06.personaNumeroImpone("Comprador 6")
        End If
    End Sub

    Protected Sub obutPersonaMas_Click(sender As Object, e As EventArgs) Handles obutPersonaMas.Click
        personaMas()

    End Sub
    Public Sub personaMas()
        If olblPersonaFisica02.Text = "0" Then
            personaFisica02.Visible = True
            olblPersonaFisica02.Text = "1"
        ElseIf olblPersonaFisica03.Text = "0" Then
            personaFisica03.Visible = True
            olblPersonaFisica03.Text = "1"
        ElseIf olblPersonaFisica04.Text = "0" Then
            personaFisica04.Visible = True
            olblPersonaFisica04.Text = "1"
        ElseIf olblPersonaFisica05.Text = "0" Then
            personaFisica05.Visible = True
            olblPersonaFisica05.Text = "1"
        ElseIf olblPersonaFisica06.Text = "0" Then
            personaFisica06.Visible = True
            olblPersonaFisica06.Text = "1"
        End If
    End Sub
    Private Sub obutPersonaLimpiar_Click(sender As Object, e As EventArgs) Handles obutPersonaLimpiar.Click
        personaLimpiar()
    End Sub

    Public Sub personaLimpiar()
        'olblMensaje.Text = "...Limpiando 02...." + personaFisica02.idPersonaFisica
        If personaFisica02.idPersonaFisica = "0" Then
            olblPersonaFisica02.Text = "0"
            personaFisica02.Visible = False

        End If

        'olblMensaje.Text = olblMensaje.Text + ".. Limpiando 03 ...." + personaFisica03.idPersonaFisica
        If personaFisica03.idPersonaFisica = "0" Then
            olblPersonaFisica03.Text = "0"
            personaFisica03.Visible = False
        End If

        'olblMensaje.Text = olblMensaje.Text + "... Limpiando 04...." + personaFisica04.idPersonaFisica
        If personaFisica04.idPersonaFisica = "0" Then
            olblPersonaFisica04.Text = "0"
            personaFisica04.Visible = False
        End If
        If personaFisica05.idPersonaFisica = "0" Then
            olblPersonaFisica05.Text = "0"
            personaFisica05.Visible = False
        End If
        If personaFisica06.idPersonaFisica = "0" Then
            olblPersonaFisica06.Text = "0"
            personaFisica06.Visible = False
        End If

    End Sub


    Public Function controlCompradores() As String


        Dim cantidad As Integer
        cantidad = 0
        If olblPersonaFisica01.Text = "1" And Val(personaFisica01.idPersonaFisica) > 0 Then
            cantidad = cantidad + 1
        End If
        If olblPersonaFisica02.Text = "1" And Val(personaFisica02.idPersonaFisica) > 0 Then
            cantidad = cantidad + 1
        End If
        If olblPersonaFisica03.Text = "1" And Val(personaFisica03.idPersonaFisica) > 0 Then
            cantidad = cantidad + 1
        End If
        If olblPersonaFisica04.Text = "1" And Val(personaFisica04.idPersonaFisica) > 0 Then
            cantidad = cantidad + 1
        End If
        If olblPersonaFisica05.Text = "1" And Val(personaFisica05.idPersonaFisica) > 0 Then
            cantidad = cantidad + 1
        End If
        If olblPersonaFisica06.Text = "1" And Val(personaFisica06.idPersonaFisica) > 0 Then
            cantidad = cantidad + 1
        End If

        Return cantidad.ToString

    End Function


End Class

