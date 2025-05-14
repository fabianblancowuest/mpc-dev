<%@ Page Title="Almacenamiento y registro de grabacion de los vendedores" MaintainScrollPositionOnPostback="true" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="grabacionAuditorSube.aspx.vb" Inherits="Administracion_grabacionAuditorSube" %>

<%@ Register Src="~/Administracion/palabrasPositivas.ascx" TagPrefix="uc1" TagName="palabrasPositivas" %>
<%@ Register Src="~/Administracion/induccionAlSi.ascx" TagPrefix="uc1" TagName="induccionAlSi" %>
<%@ Register Src="~/Administracion/induccionAlCierre.ascx" TagPrefix="uc1" TagName="induccionAlCierre" %>
<%@ Register Src="~/Administracion/pedidoReferidos.ascx" TagPrefix="uc1" TagName="pedidoReferidos" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Panel ID="PanelReporte" runat="server">
       
        <div>
            <asp:Label ID="Label1" runat="server" Text="Almacenamiento de grabaciones de los vendedores."></asp:Label>
        </div>
        <div>

            <asp:Button ID="obutGrabacionNueva" runat="server" Text="Subir Nueva Grabación" BackColor="LightGreen" />


        </div>
        <div>
            <asp:Label ID="olblGestionSQL" runat="server" Text="" Font-Bold ="true" ForeColor ="Red"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" Text="Ultimas grabaciones.."></asp:Label>
        </div>

        <div>

            <asp:SqlDataSource ID="odsVendedor" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="OPERADORTraerActivos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:DropDownList ID="oddlVendedor" runat="server" AutoPostBack="True" DataSourceID="odsVendedor" DataTextField="operadorDescripcion" DataValueField="idOperador"></asp:DropDownList>


        </div>

        <div>
            <asp:Label ID="Label3" runat="server" Text="Registros "></asp:Label>
        </div>
        <div>
            <asp:SqlDataSource ID="odsGrabacionesRegistroTraer" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="grabacionesRegistroTraer" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="oddlVendedor" Name="idVendedor" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvGrabacionesRegistroTraer" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsGrabacionesRegistroTraer" EmptyDataText="No se registran grabaciones subidas para el vendedor seleccionado ." Font-Size="X-Small" DataKeyNames="idGrabacion,grabacionFechaSubida,idOperador,idVendedor,grabacionFecha,grabacionArchivo,grabacionTranscripcion,grabacionPalabrasPositivasCantidad,grabacionInduccionAlSiCantidad,grabacionCierreCantidad,grabacionReferido,idGrabacionRevisionEstado,idGrabacionDictamen,grabacionDictamenObservacion,operadorDescripcion,Estado,Dictamen,Auditor">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Procesar" />
                    <asp:BoundField DataField="idGrabacion" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="idGrabacion" />
                    <asp:BoundField DataField="grabacionFechaSubida" HeaderText="Fecha Subida" SortExpression="grabacionFechaSubida" />
                    <asp:BoundField DataField="idVendedor" HeaderText="idVendedor" SortExpression="idVendedor" />
                    <asp:BoundField DataField="operadorDescripcion" HeaderText="Vendedor" SortExpression="operadorDescripcion" />
                    <asp:BoundField DataField="grabacionFecha" HeaderText="Fecha grabacion" SortExpression="grabacionFecha" />
                    <asp:BoundField DataField="grabacionArchivo" HeaderText="Archivo" SortExpression="grabacionArchivo" Visible="False" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado procesamiento" SortExpression="Estado" />
                    <asp:BoundField DataField="grabacionTranscripcion" HeaderText="Transcripcion" SortExpression="grabacionTranscripcion" Visible="False" />
                    <asp:BoundField DataField="grabacionPalabrasPositivasCantidad" HeaderText="Palabras Positivas Cantidad" SortExpression="grabacionPalabrasPositivasCantidad" />
                    <asp:BoundField DataField="grabacionInduccionAlSiCantidad" HeaderText="Induccion Al Si " SortExpression="grabacionInduccionAlSiCantidad" />
                    <asp:BoundField DataField="grabacionCierreCantidad" HeaderText="Cierre" SortExpression="grabacionCierreCantidad" />
                    <asp:BoundField DataField="grabacionReferido" HeaderText="Referido" SortExpression="grabacionReferido" />
                    <asp:BoundField DataField="idGrabacionDictamen" HeaderText="idGrabacionDictamen" SortExpression="idGrabacionDictamen" Visible="False" />
                    <asp:BoundField DataField="Auditor" HeaderText="Auditor" SortExpression="Auditor" />
                    <asp:BoundField DataField="Dictamen" HeaderText="Estado auditoria" SortExpression="Dictamen" />
                    <asp:BoundField DataField="grabacionDictamenObservacion" HeaderText="Observacion Auditoria" SortExpression="grabacionDictamenObservacion" />
                    <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" Visible="False" />
                </Columns>
            </asp:GridView>
        </div>

    </asp:Panel>

    <asp:Panel ID="PanelAltaGrabacion" runat="server" Visible="false">
        <div>
            <asp:Label ID="Label4" runat="server" Text="1 - Seleccione Vendedor."></asp:Label>
        </div>
        <div>
            <asp:DropDownList ID="oddlSeleccionaVendedor" runat="server" AutoPostBack="True" DataSourceID="odsVendedor" DataTextField="operadorDescripcion" DataValueField="idOperador"></asp:DropDownList>
        </div>
        <asp:Panel ID="PanelSubir" runat="server" Visible="false">
            <div>
                <asp:Label ID="Label5" runat="server" Text="2 - Seleccione archivo de audio a subir "></asp:Label>
                <br />
                <asp:FileUpload ID="FileUpload2" runat="server" OnDisposed="subirArchivo" />
                <br />
                <div>
                    <asp:Label ID="Label6" runat="server" Text="Fecha recepcion archivo (Formato AAAA-MM-DD hh:mm:ss"></asp:Label>
                </div>
                <div>


                    <asp:Table ID="otFechaGrabacion" runat="server" >
                        <asp:TableRow>
                            <asp:TableCell Width="100px" HorizontalAlign ="Center">

                                <asp:Label ID="olblFecha" runat="server" Text="Fecha :"></asp:Label>

                            </asp:TableCell>

                            <asp:TableCell>
                                <asp:DropDownList ID="oddlAAAA" runat="server">
                                    <asp:ListItem Selected="True">2025</asp:ListItem>
                                </asp:DropDownList>

                            </asp:TableCell>

                            <asp:TableCell>
                                <asp:DropDownList ID="oddlMM" runat="server">
                                    <asp:ListItem Selected="false">01</asp:ListItem>
                                    <asp:ListItem Selected="false">02</asp:ListItem>
                                    <asp:ListItem Selected="false">03</asp:ListItem>
                                    <asp:ListItem Selected="false">04</asp:ListItem>
                                    <asp:ListItem Selected="false">05</asp:ListItem>
                                    <asp:ListItem Selected="false">06</asp:ListItem>
                                    <asp:ListItem Selected="false">07</asp:ListItem>
                                    <asp:ListItem Selected="false">08</asp:ListItem>
                                    <asp:ListItem Selected="false">09</asp:ListItem>
                                    <asp:ListItem Selected="false">10</asp:ListItem>
                                    <asp:ListItem Selected="false">11</asp:ListItem>
                                    <asp:ListItem Selected="false">12</asp:ListItem>

                                </asp:DropDownList>

                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="oddlDD" runat="server">
                                    <asp:ListItem Selected="false">01</asp:ListItem>
                                    <asp:ListItem Selected="false">02</asp:ListItem>
                                    <asp:ListItem Selected="false">03</asp:ListItem>
                                    <asp:ListItem Selected="false">04</asp:ListItem>
                                    <asp:ListItem Selected="false">05</asp:ListItem>
                                    <asp:ListItem Selected="false">06</asp:ListItem>
                                    <asp:ListItem Selected="false">07</asp:ListItem>
                                    <asp:ListItem Selected="false">08</asp:ListItem>
                                    <asp:ListItem Selected="false">09</asp:ListItem>
                                    <asp:ListItem Selected="false">10</asp:ListItem>
                                    <asp:ListItem Selected="false">11</asp:ListItem>
                                    <asp:ListItem Selected="false">12</asp:ListItem>
                                    <asp:ListItem Selected="false">13</asp:ListItem>
                                    <asp:ListItem Selected="false">14</asp:ListItem>
                                    <asp:ListItem Selected="false">15</asp:ListItem>
                                    <asp:ListItem Selected="false">16</asp:ListItem>
                                    <asp:ListItem Selected="false">17</asp:ListItem>
                                    <asp:ListItem Selected="false">18</asp:ListItem>
                                    <asp:ListItem Selected="false">19</asp:ListItem>
                                    <asp:ListItem Selected="false">20</asp:ListItem>
                                    <asp:ListItem Selected="false">21</asp:ListItem>
                                    <asp:ListItem Selected="false">22</asp:ListItem>
                                    <asp:ListItem Selected="false">23</asp:ListItem>
                                    <asp:ListItem Selected="false">24</asp:ListItem>
                                    <asp:ListItem Selected="false">25</asp:ListItem>
                                    <asp:ListItem Selected="false">26</asp:ListItem>
                                    <asp:ListItem Selected="false">27</asp:ListItem>
                                    <asp:ListItem Selected="false">28</asp:ListItem>
                                    <asp:ListItem Selected="false">29</asp:ListItem>
                                    <asp:ListItem Selected="false">30</asp:ListItem>
                                    <asp:ListItem Selected="false">31</asp:ListItem>

                                </asp:DropDownList>

                            </asp:TableCell>

                            <asp:TableCell Width="100px" HorizontalAlign="Center">

                                <asp:Label ID="Label7" runat="server" Text="Hora :"></asp:Label>

                            </asp:TableCell>


                            <asp:TableCell>
                                <asp:DropDownList ID="oddlHora" runat="server">
                                    <asp:ListItem Selected="false">07</asp:ListItem>
                                    <asp:ListItem Selected="false">08</asp:ListItem>
                                    <asp:ListItem Selected="false">09</asp:ListItem>
                                    <asp:ListItem Selected="false">10</asp:ListItem>
                                    <asp:ListItem Selected="false">11</asp:ListItem>
                                    <asp:ListItem Selected="false">12</asp:ListItem>
                                    <asp:ListItem Selected="false">13</asp:ListItem>
                                    <asp:ListItem Selected="false">14</asp:ListItem>
                                    <asp:ListItem Selected="false">15</asp:ListItem>
                                    <asp:ListItem Selected="false">16</asp:ListItem>
                                    <asp:ListItem Selected="false">17</asp:ListItem>
                                    <asp:ListItem Selected="false">18</asp:ListItem>
                                    <asp:ListItem Selected="false">19</asp:ListItem>
                                    <asp:ListItem Selected="false">20</asp:ListItem>
                                    <asp:ListItem Selected="false">21</asp:ListItem>
                                    <asp:ListItem Selected="false">22</asp:ListItem>

                                </asp:DropDownList>

                            </asp:TableCell>

                            <asp:TableCell>
                                <asp:DropDownList ID="oddlMinutos" runat="server">
                                    <asp:ListItem Selected="false">00</asp:ListItem>
                                    <asp:ListItem Selected="false">01</asp:ListItem>
                                    <asp:ListItem Selected="false">02</asp:ListItem>
                                    <asp:ListItem Selected="false">03</asp:ListItem>
                                    <asp:ListItem Selected="false">04</asp:ListItem>
                                    <asp:ListItem Selected="false">05</asp:ListItem>
                                    <asp:ListItem Selected="false">06</asp:ListItem>
                                    <asp:ListItem Selected="false">07</asp:ListItem>
                                    <asp:ListItem Selected="false">08</asp:ListItem>
                                    <asp:ListItem Selected="false">09</asp:ListItem>
                                    <asp:ListItem Selected="false">10</asp:ListItem>
                                    <asp:ListItem Selected="false">11</asp:ListItem>
                                    <asp:ListItem Selected="false">12</asp:ListItem>
                                    <asp:ListItem Selected="false">13</asp:ListItem>
                                    <asp:ListItem Selected="false">14</asp:ListItem>
                                    <asp:ListItem Selected="false">15</asp:ListItem>
                                    <asp:ListItem Selected="false">16</asp:ListItem>
                                    <asp:ListItem Selected="false">17</asp:ListItem>
                                    <asp:ListItem Selected="false">18</asp:ListItem>
                                    <asp:ListItem Selected="false">19</asp:ListItem>
                                    <asp:ListItem Selected="false">20</asp:ListItem>
                                    <asp:ListItem Selected="false">21</asp:ListItem>
                                    <asp:ListItem Selected="false">22</asp:ListItem>
                                    <asp:ListItem Selected="false">23</asp:ListItem>
                                    <asp:ListItem Selected="false">24</asp:ListItem>
                                    <asp:ListItem Selected="false">25</asp:ListItem>
                                    <asp:ListItem Selected="false">26</asp:ListItem>
                                    <asp:ListItem Selected="false">27</asp:ListItem>
                                    <asp:ListItem Selected="false">28</asp:ListItem>
                                    <asp:ListItem Selected="false">29</asp:ListItem>
                                    <asp:ListItem Selected="false">30</asp:ListItem>
                                    <asp:ListItem Selected="false">31</asp:ListItem>
                                    <asp:ListItem Selected="false">32</asp:ListItem>
                                    <asp:ListItem Selected="false">33</asp:ListItem>
                                    <asp:ListItem Selected="false">34</asp:ListItem>
                                    <asp:ListItem Selected="false">35</asp:ListItem>
                                    <asp:ListItem Selected="false">36</asp:ListItem>
                                    <asp:ListItem Selected="false">37</asp:ListItem>
                                    <asp:ListItem Selected="false">38</asp:ListItem>
                                    <asp:ListItem Selected="false">39</asp:ListItem>
                                    <asp:ListItem Selected="false">40</asp:ListItem>
                                    <asp:ListItem Selected="false">41</asp:ListItem>
                                    <asp:ListItem Selected="false">42</asp:ListItem>
                                    <asp:ListItem Selected="false">43</asp:ListItem>
                                    <asp:ListItem Selected="false">44</asp:ListItem>
                                    <asp:ListItem Selected="false">45</asp:ListItem>
                                    <asp:ListItem Selected="false">46</asp:ListItem>
                                    <asp:ListItem Selected="false">47</asp:ListItem>
                                    <asp:ListItem Selected="false">48</asp:ListItem>
                                    <asp:ListItem Selected="false">49</asp:ListItem>
                                    <asp:ListItem Selected="false">50</asp:ListItem>
                                    <asp:ListItem Selected="false">51</asp:ListItem>
                                    <asp:ListItem Selected="false">52</asp:ListItem>
                                    <asp:ListItem Selected="false">53</asp:ListItem>
                                    <asp:ListItem Selected="false">54</asp:ListItem>
                                    <asp:ListItem Selected="false">55</asp:ListItem>
                                    <asp:ListItem Selected="false">56</asp:ListItem>
                                    <asp:ListItem Selected="false">57</asp:ListItem>
                                    <asp:ListItem Selected="false">58</asp:ListItem>
                                    <asp:ListItem Selected="false">59</asp:ListItem>
                                </asp:DropDownList>

                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="oddlSegundos" runat="server">
                                    <asp:ListItem Selected="false">00</asp:ListItem>
                                    <asp:ListItem Selected="false">01</asp:ListItem>
                                    <asp:ListItem Selected="false">02</asp:ListItem>
                                    <asp:ListItem Selected="false">03</asp:ListItem>
                                    <asp:ListItem Selected="false">04</asp:ListItem>
                                    <asp:ListItem Selected="false">05</asp:ListItem>
                                    <asp:ListItem Selected="false">06</asp:ListItem>
                                    <asp:ListItem Selected="false">07</asp:ListItem>
                                    <asp:ListItem Selected="false">08</asp:ListItem>
                                    <asp:ListItem Selected="false">09</asp:ListItem>
                                    <asp:ListItem Selected="false">10</asp:ListItem>
                                    <asp:ListItem Selected="false">11</asp:ListItem>
                                    <asp:ListItem Selected="false">12</asp:ListItem>
                                    <asp:ListItem Selected="false">13</asp:ListItem>
                                    <asp:ListItem Selected="false">14</asp:ListItem>
                                    <asp:ListItem Selected="false">15</asp:ListItem>
                                    <asp:ListItem Selected="false">16</asp:ListItem>
                                    <asp:ListItem Selected="false">17</asp:ListItem>
                                    <asp:ListItem Selected="false">18</asp:ListItem>
                                    <asp:ListItem Selected="false">19</asp:ListItem>
                                    <asp:ListItem Selected="false">20</asp:ListItem>
                                    <asp:ListItem Selected="false">21</asp:ListItem>
                                    <asp:ListItem Selected="false">22</asp:ListItem>
                                    <asp:ListItem Selected="false">23</asp:ListItem>
                                    <asp:ListItem Selected="false">24</asp:ListItem>
                                    <asp:ListItem Selected="false">25</asp:ListItem>
                                    <asp:ListItem Selected="false">26</asp:ListItem>
                                    <asp:ListItem Selected="false">27</asp:ListItem>
                                    <asp:ListItem Selected="false">28</asp:ListItem>
                                    <asp:ListItem Selected="false">29</asp:ListItem>
                                    <asp:ListItem Selected="false">30</asp:ListItem>
                                    <asp:ListItem Selected="false">31</asp:ListItem>
                                    <asp:ListItem Selected="false">32</asp:ListItem>
                                    <asp:ListItem Selected="false">33</asp:ListItem>
                                    <asp:ListItem Selected="false">34</asp:ListItem>
                                    <asp:ListItem Selected="false">35</asp:ListItem>
                                    <asp:ListItem Selected="false">36</asp:ListItem>
                                    <asp:ListItem Selected="false">37</asp:ListItem>
                                    <asp:ListItem Selected="false">38</asp:ListItem>
                                    <asp:ListItem Selected="false">39</asp:ListItem>
                                    <asp:ListItem Selected="false">40</asp:ListItem>
                                    <asp:ListItem Selected="false">41</asp:ListItem>
                                    <asp:ListItem Selected="false">42</asp:ListItem>
                                    <asp:ListItem Selected="false">43</asp:ListItem>
                                    <asp:ListItem Selected="false">44</asp:ListItem>
                                    <asp:ListItem Selected="false">45</asp:ListItem>
                                    <asp:ListItem Selected="false">46</asp:ListItem>
                                    <asp:ListItem Selected="false">47</asp:ListItem>
                                    <asp:ListItem Selected="false">48</asp:ListItem>
                                    <asp:ListItem Selected="false">49</asp:ListItem>
                                    <asp:ListItem Selected="false">50</asp:ListItem>
                                    <asp:ListItem Selected="false">51</asp:ListItem>
                                    <asp:ListItem Selected="false">52</asp:ListItem>
                                    <asp:ListItem Selected="false">53</asp:ListItem>
                                    <asp:ListItem Selected="false">54</asp:ListItem>
                                    <asp:ListItem Selected="false">55</asp:ListItem>
                                    <asp:ListItem Selected="false">56</asp:ListItem>
                                    <asp:ListItem Selected="false">57</asp:ListItem>
                                    <asp:ListItem Selected="false">58</asp:ListItem>
                                    <asp:ListItem Selected="false">59</asp:ListItem>
                                </asp:DropDownList>

                            </asp:TableCell>




                        </asp:TableRow>



                    </asp:Table>

                    <asp:Button ID="obutARMAR" runat="server" Text="(*)" Visible="false" />

                    <asp:TextBox ID="otxtgrabacionFechaVendedor" runat="server" Width ="90%" Visible="false"></asp:TextBox>
                    <asp:TextBox ID="otxtNombreArchivo" runat="server" Width ="90%" Visible="false"></asp:TextBox>
                </div>

                <asp:Button ID="obutSubirArchivoVendedor" runat="server" Text="3 - Sube archivo Audio Vendedor y da el alta." />
            </div>
            <div>
                <asp:Label ID="olblMensajeUpload" runat="server" Text=""></asp:Label>
            </div>
             <div>
                <asp:Label ID="Label11" runat="server" Text=""></asp:Label>
            </div>


             <div>
                <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
            </div>





        </asp:Panel>

        <div>
            <asp:Button ID="obutVolver" runat="server" Text="Volver" />
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelAuditoria" runat="server" Visible="false">
        <div>
            <asp:Label ID="Label8" runat="server" Text="Auditoria de grabaciones vendedores."></asp:Label>
        
            <asp:Label ID="Label20" runat="server" Text="ID Grabacion :"></asp:Label>
        </div>
        <div>
            <asp:Label ID="olblIdGrabacion" runat="server" Text="" Font-Bold ="true" Font-Size ="Large"></asp:Label>
        </div>



        <div>
            <asp:Label ID="Label9" runat="server" Text="Procesamiento de la transcripcion para control de seguimiento de politicas de la Empresa."></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label10" runat="server" Text="Vendedor:"></asp:Label>
            <asp:Label ID="olblVendedor" runat="server" Text="" Font-Bold ="true"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label12" runat="server" Text="Archivo de Audio:"></asp:Label>
            <asp:Label ID="olblArchivoAudio" runat="server" Text="" Font-Bold ="true"></asp:Label>
            <asp:Button ID="obutArchivoReproducir" runat="server" Text=">>>>" />
        </div>

        <div>
            <asp:TextBox ID="otxtTranscripcion" runat="server" Text ="" TextMode ="MultiLine" Font-Size="Smaller" Width ="100%" Height ="600px"></asp:TextBox>
        </div>


        <div>
            
            <asp:Button ID="obutTranscripcionGrabar" runat="server" Text="Grabar Transcripcion"  BackColor="Green"   ForeColor ="White" />
       
            <asp:Button ID="obutTranscripcionVolver" runat="server" Text="Volver" />
        </div>
        <div>
            <asp:Label ID="Label18" runat="server" Text="La grabacion de la transcripcion dispara el procesamiento de las palabras positivas, inducciones al si, cierres y pedido de referidos." Font-Italic ="true" Font-Size="Smaller"></asp:Label>

        </div>
        <div>
            <asp:Label ID="Label13" runat="server" Text="Resultados de la transcripcion"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label14" runat="server" Text="Palabras Positivas"></asp:Label>
            <asp:SqlDataSource ID="odsGrabacionPalabrasPositivas" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select * from grabacionPalabrasPositivas gr inner join palabrasPositivas pp on gr.id=pp.id where idGrabacion = @idGrabacion">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblIdGrabacion" Name="idGrabacion" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvGrabacionPalabrasPositivas" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsGrabacionPalabrasPositivas" Width ="60%" EmptyDataText="No se registran palabras positivas en el texto transcripto.">
                <Columns>
                    <asp:BoundField DataField="palabra" HeaderText="Palabra positiva" SortExpression="palabra" />
                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad repeticiones" SortExpression="cantidad" />
                </Columns>
            </asp:GridView>
        </div>

        <div>
            <asp:Label ID="Label15" runat="server" Text="Induccion al sí"></asp:Label>


                    
            <asp:SqlDataSource ID="odsGrabacionInduccionAlSi" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select * from grabacionInduccionAlSi gr inner join induccionAlSi pp on gr.id=pp.id where idGrabacion = @idGrabacion">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblIdGrabacion" Name="idGrabacion" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvGrabacionInduccionAlSi" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsGrabacionInduccionAlSi" Width ="60%" EmptyDataText="No se registran inducciones al si en el texto transcripto .">
                <Columns>
                    <asp:BoundField DataField="induccionAlSi" HeaderText="Frase induccion al si." SortExpression="induccionAlSi" />
                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad repeticiones " SortExpression="cantidad" />
                </Columns>
            </asp:GridView>


        </div>
        <div>
            <asp:Label ID="Label16" runat="server" Text="Cierres"></asp:Label>

                        
            <asp:SqlDataSource ID="odsGrabacionInduccionAlCierre" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select * from grabacionInduccionAlCierre gr inner join induccionAlCierre pp on gr.id=pp.id where idGrabacion = @idGrabacion">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblIdGrabacion" Name="idGrabacion" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvGrabacionInduccionAlCierre" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsGrabacionInduccionAlCierre" Width ="60%" EmptyDataText="No se registran inducciones al cierre en el texto transcripto.">
                <Columns>
                    <asp:BoundField DataField="induccionAlCierre" HeaderText="Frase induccion al cierre" SortExpression="induccionAlCierre" />
                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad repeticiones" SortExpression="cantidad" />
                </Columns>
            </asp:GridView>




        </div>
        <div>
            <asp:Label ID="Label17" runat="server" Text="Pedido de referidos"></asp:Label>


              <asp:SqlDataSource ID="odsGrabacionPedidoReferidos" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select * from grabacionPedidoReferido  gr inner join pedidoReferido pp on gr.id=pp.id where idGrabacion = @idGrabacion">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblIdGrabacion" Name="idGrabacion" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvGrabacionPedidoReferidos" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsGrabacionPedidoReferidos" Width ="60%" EmptyDataText="No se registran pedidos de referidos en el texto transcripto.">
                <Columns>
                    <asp:BoundField DataField="pedidoReferido" HeaderText="Frase para pedido de referido" SortExpression="pedidoReferido" />
                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad repeticiones" SortExpression="cantidad" />
                </Columns>
            </asp:GridView>




        </div>



        <div>
            <br />
            <asp:Label ID="Label19" runat="server" Text="Referencias"></asp:Label>
        
         <uc1:palabrasPositivas runat="server" ID="palabrasPositivas" />
        <uc1:induccionAlSi runat="server" ID="induccionAlSi" />
        <uc1:induccionAlCierre runat="server" ID="induccionAlCierre" />
        <uc1:pedidoReferidos runat="server" ID="pedidoReferidos" />
    </div>
            
            
            </asp:Panel>


    
</asp:Content>


