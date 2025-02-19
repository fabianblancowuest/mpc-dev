
Partial Class ventaWEB_pruebaDocumentacion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then

        Else


            persona1DocumentoAnverso.inicializa(olblIdLoteVenta, "1", olblCliente01Nombre, "1")
            persona1DocumentoReverso.inicializa(olblIdLoteVenta, "2", olblCliente01Nombre, "2")
            persona2DocumentoAnverso.inicializa(olblIdLoteVenta, "3", olblCliente01Nombre, "1")
            persona2DocumentoReverso.inicializa(olblIdLoteVenta, "4", olblCliente01Nombre, "2")
            consentimientoInformado.inicializa(olblIdLoteVenta, "5", olblCliente01Nombre, "1")
            recibo1.inicializa(olblIdLoteVenta, "6", olblCliente01Nombre, "2")
            transferencia1.inicializa(olblIdLoteVenta, "7", olblCliente01Nombre, "1")
            recibo2.inicializa(olblIdLoteVenta, "8", olblCliente01Nombre, "2")
            transferencia2.inicializa(olblIdLoteVenta, "9", olblCliente01Nombre, "2")
            recibo3.inicializa(olblIdLoteVenta, "10", olblCliente01Nombre, "1")
            transferencia3.inicializa(olblIdLoteVenta, "11", olblCliente01Nombre, "2")

        End If
    End Sub
End Class
