<%@ Page Language="VB" AutoEventWireup="false" CodeFile="mapeo.aspx.vb" Inherits="ventaWEB_mapeo" %>
<link href="bootstrap/bootstrap.css" rel="stylesheet" />
<link href="bootstrap/bootstrap-pachu.css" rel="stylesheet" />
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administracion -Seleccion de Lote</title>
</head>
<body>
    <form id="form1" runat="server">

       
        <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC__z2k5-eRSVKiMCNww4IS5XtGsXk56Qs&callback=initMap">

        </script>
        <script type="text/javascript">
            var markers = [
            <asp:Repeater ID="rptMarkers" runat="server">
            <ItemTemplate>
                     {
                         "title": '<%# Eval("Name") %>',
                         "lat": '<%# Eval("Latitude").ToString.Replace(",", ".")%>',
                         "lng": '<%# Eval("Longitude").ToString.Replace(",", ".")%>',
                         "description": '<%# Eval("Description") %>',
                         "icon":'<%# Eval("icono") %>',
                         "color": '<%# Eval("color")%>'

                     }
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
            ];


            var markers2 = [
 <asp:Repeater ID="rptMarkers2" runat="server">
 <ItemTemplate>
          {
              "title": '<%# Eval("Name") %>',
              "lat": '<%# Eval("Latitude").ToString.Replace(",", ".")%>',
              "lng": '<%# Eval("Longitude").ToString.Replace(",", ".")%>',
              "description": '<%# Eval("Description") %>',
              "icon":'<%# Eval("icono") %>',
              "color": '<%# Eval("color")%>'
          }
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
            ];
            var markers3 = [
 <asp:Repeater ID="rptMarkers3" runat="server">
 <ItemTemplate>
          {
              "title": '<%# Eval("Description") %>',
              "lat": '<%# Eval("Latitude").ToString.Replace(",", ".")%>',
              "lng": '<%# Eval("Longitude").ToString.Replace(",", ".")%>',
              "description": '<%# Eval("Description") %>',
              "color": '<%# Eval("color")%>',
              "icon":'<%# Eval("icono") %>'
          }
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
            ];

            var markers4 = [
          <asp:Repeater ID="rptMarkers4" runat="server">
          <ItemTemplate>
          {
              "title": '<%# Eval("Description") %>',
              "lat": '<%# Eval("Latitude").ToString.Replace(",", ".")%>',
              "lng": '<%# Eval("Longitude").ToString.Replace(",", ".")%>',
              "description": '<%# Eval("Description") %>',
              "color": '<%# Eval("color")%>',
              "icon":'<%# Eval("icono") %>'
          }
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
            ];



            var markers5 = [
<asp:Repeater ID="rptMarkers5" runat="server">
<ItemTemplate>
{
    "title": '<%# Eval("Description") %>',
    "lat": '<%# Eval("Latitude").ToString.Replace(",", ".")%>',
    "lng": '<%# Eval("Longitude").ToString.Replace(",", ".")%>',
    "description": '<%# Eval("Description") %>',
    "color": '<%# Eval("color")%>',
    "icon":'<%# Eval("icono") %>'
}
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
            ];

            var markers6 = [
<asp:Repeater ID="rptMarkers6" runat="server">
<ItemTemplate>
{
    "title": '<%# Eval("Description") %>',
    "lat": '<%# Eval("Latitude").ToString.Replace(",", ".")%>',
    "lng": '<%# Eval("Longitude").ToString.Replace(",", ".")%>',
    "description": '<%# Eval("Description") %>',
    "color": '<%# Eval("color")%>',
    "icon":'<%# Eval("icono") %>'
}
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
            ];
            var markers7 = [
<asp:Repeater ID="rptMarkers7" runat="server">
<ItemTemplate>
{
    "title": '<%# Eval("Description") %>',
    "lat": '<%# Eval("Latitude").ToString.Replace(",", ".")%>',
    "lng": '<%# Eval("Longitude").ToString.Replace(",", ".")%>',
    "description": '<%# Eval("Description") %>',
    "color": '<%# Eval("color")%>',
    "icon":'<%# Eval("icono") %>'
}
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
            ];

            var markers8 = [
<asp:Repeater ID="rptMarkers8" runat="server">
<ItemTemplate>
{
    "title": '<%# Eval("Description") %>',
    "lat": '<%# Eval("Latitude").ToString.Replace(",", ".")%>',
    "lng": '<%# Eval("Longitude").ToString.Replace(",", ".")%>',
    "description": '<%# Eval("Description") %>',
    "color": '<%# Eval("color")%>',
    "icon":'<%# Eval("icono") %>'
}
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
            ];

            var markers9 = [
<asp:Repeater ID="rptMarkers9" runat="server">
<ItemTemplate>
{
    "title": '<%# Eval("Description") %>',
    "lat": '<%# Eval("Latitude").ToString.Replace(",", ".")%>',
    "lng": '<%# Eval("Longitude").ToString.Replace(",", ".")%>',
    "description": '<%# Eval("Description") %>',
    "color": '<%# Eval("color")%>',
    "icon":'<%# Eval("icono") %>'
}
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
            ];
            var markers10 = [
<asp:Repeater ID="rptMarkers10" runat="server">
<ItemTemplate>
{
    "title": '<%# Eval("Description") %>',
    "lat": '<%# Eval("Latitude").ToString.Replace(",", ".")%>',
    "lng": '<%# Eval("Longitude").ToString.Replace(",", ".")%>',
    "description": '<%# Eval("Description") %>',
    "color": '<%# Eval("color")%>',
    "icon":'<%# Eval("icono") %>'
}
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
            ];

            var markersPin = [
                               <asp:Repeater ID="rptMarkersPin" runat="server">
                               <ItemTemplate>
                                        {
                                            "title": '<%# Eval("Name") %>',
                                "lat": '<%# Eval("Latitude").ToString.Replace(",", ".")%>',
                                "lng": '<%# Eval("Longitude").ToString.Replace(",", ".")%>',
                                "description": '<%# Eval("Description") %>',
                                "icon":'<%# Eval("icono") %>'
                            }
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
];





        </script>









        <script type="text/javascript">

            window.onload = function () {
             
                var lineSymbol2 = {
                    path: google.maps.SymbolPath.circle,
                    strokeColor: "#a040a0",
                    strokeOpacity: 1
                };
                var lineSymbol3 = {
                    path: google.maps.SymbolPath.circle,
                    strokeColor: "#000000",
                    strokeOpacity: 1
                };
                var lineSymbol4 = {
                    path: google.maps.SymbolPath.circle,
                    strokeColor: "#000000",
                    strokeOpacity: 1
                };
                var lineSymbol5 = {
                    path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
                    strokeColor: "#000000",
                    strokeOpacity: 1
                };

                var lineSymbol6 = {
                    path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
                    strokeColor: "#000000",
                    strokeOpacity: 1
                };
                var lineSymbol6 = {
                    path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
                    strokeColor: "#000000",
                    strokeOpacity: 1
                };

                var lineSymbol7 = {
                    path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
                    strokeColor: "#000000",
                    strokeOpacity: 1
                };
                var lineSymbol8 = {
                    path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
                    strokeColor: "#000000",
                    strokeOpacity: 1
                };

                var lineSymbol9 = {
                    path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
                    strokeColor: "#000000",
                    strokeOpacity: 1
                };
                var lineSymbol10 = {
                    path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
                    strokeColor: "#000000",
                    strokeOpacity: 1
                };
                var mapOptions = {center: new google.maps.LatLng(markers[0].lat, markers3[0].lng), zoom: 15,mapTypeId: google.maps.MapTypeId.TERRAIN};
                /* alert("Paso 02 - Por instanciar Mapa PolyLine ");*/

                var infoWindow = new google.maps.Polyline();

                /* alert("Paso 03 - Alta de mapa para posicionar en Mapa01");*/

                var map = new google.maps.Map(document.getElementById("Mapa01"), mapOptions);

                /* alert("Paso 032 - Incializo array");*/
                /* alert("Paso 01 - Por cargar Mapa con opciones desde el centro de la primer coordenada");*/
              
                var flightPlanCoordinates2 = new Array();
                var flightPlanCoordinates3 = new Array();
                var flightPlanCoordinates4 = new Array();
                var flightPlanCoordinates5 = new Array();
                var flightPlanCoordinates6 = new Array();
                var flightPlanCoordinates7 = new Array();
                var flightPlanCoordinates8 = new Array();
                var flightPlanCoordinates9 = new Array();
                var flightPlanCoordinates10 = new Array();
                /* alert("Paso 04 - Por Comenzar a iterar para cargar las variables de repeticion ");*/


                var lineSymbol = {
                    path: google.maps.SymbolPath.circle,
                    strokeColor: "#FF0000",
                    strokeOpacity: 1
                };
                var flightPlanCoordinates = new Array();

                for (i = 0; i < markers.length; i++) 
                {
                    /* alert ("Paso 04 - n");*/

                    var data = markers[i];
                    var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                    /* alert ("Paso 04- n2 - por agregar punto en mapa en variable de coordenadas de vuelo");*/
                    flightPlanCoordinates.push(myLatlng)

                    /* alert ("Paso 04- n3 - Coordenada agregada ");*/

                }


                
                /* alert ("Finalizada la carga de coordenadas");*/

                var flightPath = new google.maps.Polyline({
                    path: flightPlanCoordinates,
                    geodesic: true,
                    strokeColor: '#FF0000',
                    strokeOpacity: 1.0,
                    strokeWeight: 2,
                    icons: [{
                        icon: lineSymbol,
                        offset: '70%',repeat: '40px'
                    }]
                });


                flightPath .setMap(map);


                for (i = 0; i < markers.length; i++) {
                    var data = markers[i]
                    var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                    var marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        draggable: false,
                        description:  markers[i].description,
                        icon: data.icon,
                        title: data.title
                    });
                    
                }





                for (i = 0 ; i < markers2.length; i++) 
                {
                    /* alert ("Paso 04 - n");*/

                    var data2 = markers2[i];
                    var myLatlng2 = new google.maps.LatLng(data2.lat, data2.lng);
                    /* alert ("Paso 04- n2 - por agregar punto en mapa en variable de coordenadas de vuelo");*/
                    flightPlanCoordinates2.push(myLatlng2)

                    /* alert ("Paso 04- n3 - Coordenada agregada ");*/

                }

                
                for (i = 0 ; i < markers3.length; i++) 
                {
                    /* alert ("Paso 04 - n");*/

                    var data3 = markers3[i];
                    var myLatlng3 = new google.maps.LatLng(data3.lat, data3.lng);
                    /* alert ("Paso 04- n2 - por agregar punto en mapa en variable de coordenadas de vuelo");*/
                    flightPlanCoordinates3.push(myLatlng3)

                    /* alert ("Paso 04- n3 - Coordenada agregada ");*/

                }

                
                for (i = 0 ; i < markers4.length; i++) 
                {
                    /* alert ("Paso 04 - n");*/

                    var data4 = markers4[i];
                    var myLatlng4 = new google.maps.LatLng(data4.lat, data4.lng);
                    /* alert ("Paso 04- n2 - por agregar punto en mapa en variable de coordenadas de vuelo");*/
                    flightPlanCoordinates4.push(myLatlng4)

                    /* alert ("Paso 04- n3 - Coordenada agregada ");*/

                }




                for (i = 0 ; i < markers5.length; i++) 
                {
                    /* alert ("Paso 04 - n");*/

                    var data5 = markers5[i];
                    var myLatlng5 = new google.maps.LatLng(data5.lat, data5.lng);
                    /* alert ("Paso 04- n2 - por agregar punto en mapa en variable de coordenadas de vuelo");*/
                    flightPlanCoordinates5.push(myLatlng5)

                    /* alert ("Paso 04- n3 - Coordenada agregada ");*/

                }


                
                for (i = 0 ; i < markers6.length; i++) 
                {
                    /* alert ("Paso 04 - n");*/

                    var data6 = markers6[i];
                    var myLatlng6 = new google.maps.LatLng(data6.lat, data6.lng);
                    /* alert ("Paso 04- n2 - por agregar punto en mapa en variable de coordenadas de vuelo");*/
                    flightPlanCoordinates6.push(myLatlng6)

                    /* alert ("Paso 04- n3 - Coordenada agregada ");*/

                }

                
                for (i = 0 ; i < markers7.length; i++) 
                {
                    /* alert ("Paso 04 - n");*/

                    var data7 = markers7[i];
                    var myLatlng7 = new google.maps.LatLng(data7.lat, data7.lng);
                    /* alert ("Paso 04- n2 - por agregar punto en mapa en variable de coordenadas de vuelo");*/
                    flightPlanCoordinates7.push(myLatlng5)

                    /* alert ("Paso 04- n3 - Coordenada agregada ");*/

                }

                
                for (i = 0 ; i < markers8.length; i++) 
                {
                    /* alert ("Paso 04 - n");*/

                    var data8 = markers8[i];
                    var myLatlng8 = new google.maps.LatLng(data8.lat, data8.lng);
                    /* alert ("Paso 04- n2 - por agregar punto en mapa en variable de coordenadas de vuelo");*/
                    flightPlanCoordinates8.push(myLatlng8)

                    /* alert ("Paso 04- n3 - Coordenada agregada ");*/

                }

                
                for (i = 0 ; i < markers9.length; i++) 
                {
                    /* alert ("Paso 04 - n");*/

                    var data9 = markers9[i];
                    var myLatlng9 = new google.maps.LatLng(data9.lat, data9.lng);
                    /* alert ("Paso 04- n2 - por agregar punto en mapa en variable de coordenadas de vuelo");*/
                    flightPlanCoordinates9.push(myLatlng9)

                    /* alert ("Paso 04- n3 - Coordenada agregada ");*/

                }


                
                for (i = 0 ; i < markers10.length; i++) 
                {
                    /* alert ("Paso 04 - n");*/

                    var data10 = markers10[i];
                    var myLatlng10 = new google.maps.LatLng(data10.lat, data10.lng);
                    /* alert ("Paso 04- n2 - por agregar punto en mapa en variable de coordenadas de vuelo");*/
                    flightPlanCoordinates10.push(myLatlng10)

                    /* alert ("Paso 04- n3 - Coordenada agregada ");*/

                }



                var flightPath2 = new google.maps.Polyline({
                    path: flightPlanCoordinates2,
                    geodesic: true,
                    strokeColor: '#a040a0',
                    strokeOpacity: 1.0,
                    strokeWeight: 2,
                    icons: [{
                        icon: lineSymbol2,
                        offset: '70%',repeat: '40px'
                    }]
                });
                flightPath2 .setMap(map);
       
                var flightPath3 = new google.maps.Polyline({
                    path: flightPlanCoordinates3,
                    geodesic: true,
                    strokeColor: '#fffff',
                    strokeOpacity: 1.0,
                    strokeWeight: 2,
                    icons: [{
                        icon: lineSymbol3,
                        offset: '70%',repeat: '40px'
                    }]
                });
                flightPath3 .setMap(map);


                var flightPath4 = new google.maps.Polyline({
                    path: flightPlanCoordinates4,
                    geodesic: true,
                    strokeColor: '#a040a0',
                    strokeOpacity: 1.0,
                    strokeWeight: 2,
                    icons: [{
                        icon: lineSymbol4,
                        offset: '70%',repeat: '40px'
                    }]
                });
                flightPath4 .setMap(map);

                var flightPath5 = new google.maps.Polyline({
                    path: flightPlanCoordinates5,
                    geodesic: true,
                    strokeColor: '#FF0000',
                    strokeOpacity: 1.0,
                    strokeWeight: 2,
                    icons: [{
                        icon: lineSymbol5,
                        offset: '70%',repeat: '40px'
                    }]
                });
                flightPath5 .setMap(map);


                var flightPath6 = new google.maps.Polyline({
                    path: flightPlanCoordinates6,
                    geodesic: true,
                    strokeColor: '#a040a0',
                    strokeOpacity: 1.0,
                    strokeWeight: 2,
                    icons: [{
                        icon: lineSymbol6,
                        offset: '70%',repeat: '40px'
                    }]
                });
                flightPath6 .setMap(map);


                var flightPath7 = new google.maps.Polyline({
                    path: flightPlanCoordinates7,
                    geodesic: true,
                    strokeColor: '#FF0000',
                    strokeOpacity: 1.0,
                    strokeWeight: 2,
                    icons: [{
                        icon: lineSymbol7,
                        offset: '70%',repeat: '40px'
                    }]
                });
                flightPath7 .setMap(map);


                var flightPath8 = new google.maps.Polyline({
                    path: flightPlanCoordinates8,
                    geodesic: true,
                    strokeColor: '#a040a0',
                    strokeOpacity: 1.0,
                    strokeWeight: 2,
                    icons: [{
                        icon: lineSymbol8,
                        offset: '70%',repeat: '40px'
                    }]
                });
                flightPath8 .setMap(map);


                var flightPath9 = new google.maps.Polyline({
                    path: flightPlanCoordinates9,
                    geodesic: true,
                    strokeColor: '#FF0000',
                    strokeOpacity: 1.0,
                    strokeWeight: 2,
                    icons: [{
                        icon: lineSymbol9,
                        offset: '70%',repeat: '40px'
                    }]
                });
                flightPath9 .setMap(map);


                var flightPath10 = new google.maps.Polyline({
                    path: flightPlanCoordinates10,
                    geodesic: true,
                    strokeColor: '#a040a0',
                    strokeOpacity: 1.0,
                    strokeWeight: 2,
                    icons: [{
                        icon: lineSymbol10,
                        offset: '70%',repeat: '40px'
                    }]
                });
                flightPath10 .setMap(map);





                
                for (i = 0; i < markers2.length; i++) {
                    var data = markers2[i]
                    var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                    var marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        draggable: false,
                        description:  markers2[i].description,
                        icon: data.icon,
                        title: data.title
                    });
                    
                }



                for (i = 0; i < markers3.length; i++) {
                    var data = markers3[i]
                    var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                    var marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        draggable: false,
                        description:  markers3[i].description,
                        icon: data.icon,
                        title: data.title
                    });
                    
                }



                for (i = 0; i < markers4.length; i++) {
                    var data = markers4[i]
                    var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                    var marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        draggable: false,
                        description:  markers4[i].description,
                        icon: data.icon,
                        title: data.title
                    });
                    
                }



                for (i = 0; i < markers5.length; i++) {
                    var data = markers5[i]
                    var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                    var marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        draggable: false,
                        description:  markers5[i].description,
                        icon: data.icon,
                        title: data.title
                    });
                    
                }



               



                for (i = 0; i < markers6.length; i++) {
                    var data = markers6[i]
                    var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                    var marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        draggable: false,
                        description:  markers6[i].description,
                        icon: data.icon,
                        title: data.title
                    });
                    
                }



                for (i = 0; i < markers7.length; i++) {
                    var data = markers7[i]
                    var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                    var marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        draggable: false,
                        description:  markers7[i].description,
                        icon: data.icon,
                        title: data.title
                    });
                    
                }



                for (i = 0; i < markers8.length; i++) {
                    var data = markers8[i]
                    var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                    var marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        draggable: false,
                        description:  markers8[i].description,
                        icon: data.icon,
                        title: data.title
                    });
                    
                }



                for (i = 0; i < markers9.length; i++) {
                    var data = markers9[i]
                    var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                    var marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        draggable: false,
                        description:  markers9[i].description,
                        icon: data.icon,
                        title: data.title
                    });
                    
                }



                for (i = 0; i < markers10.length; i++) {
                    var data = markers10[i]
                    var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                    var marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        draggable: false,
                        description:  markers10[i].description,
                        icon: data.icon,
                        title: data.title
                    });
                    
                }





            }      
    


        </script>

   
        <script type="text/javascript">

            //window.onload = function () {
               
            //    var flightPlanCoordinates = [];
            //    var bounds = new google.maps.LatLngBounds();
                                
            //    for (i = 0; i < markersPin.length; i++) {
            //        var data = markersPin[i]
            //        var myLatlng = new google.maps.LatLng(data.lat, data.lng);
            //        var markerPin = new google.maps.Marker({
            //            position: myLatlng,
            //            map: map,
            //            draggable: false,
            //            icon: markersPin[i].icon,
            //            title: data.title
            //        });

                     


            //        (function (marker, data) {
            //            google.maps.event.addListener(marker, "click", function (e) {
            //                infoWindow.setContent(data.description);
            //                infoWindow.open(map, marker);
            //            });
            //        })(marker, data);
            //    }
            //}


        </script>

        <div>
            <asp:Label ID="olblBarrio" runat="server" Text="Seleccione Barrio." Width="15%"></asp:Label>
            <asp:SqlDataSource ID="odsBarrioTrae" runat="server" ConnectionString="<%$ ConnectionStrings:strsystem %>" SelectCommand="barrioTraerODDL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:DropDownList ID="oddlBarrioTrae" runat="server" DataSourceID="odsBarrioTrae" DataTextField="barrioDescripcion" DataValueField="idBarrio" Height="36px" Width="80%" AutoPostBack="True">
            </asp:DropDownList>
        </div>
    
            <div>
            <asp:Label ID="olblManzana" runat="server" Text="Seleccione Manzana." Width="15%"></asp:Label>
            <asp:SqlDataSource ID="odsBarrioManzanaTrae" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="barrioManzanaTraeODDL" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="oddlBarrioTrae" Name="idBarrio" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                </asp:SqlDataSource>
            <asp:DropDownList ID="oddlBarrioManzanaTrae" runat="server" DataSourceID="odsBarrioManzanaTrae" DataTextField="barrioManzanaDescripcion" DataValueField="idBarrioManzana" Height="36px" Width="80%" AutoPostBack="True">
            </asp:DropDownList>
        </div>   
        <asp:Panel ID="PanelSeleccion" runat="server" Visible="true">
            <div>
                <asp:Label ID="olblLote" runat="server" Text="Seleccione Lote o parcela." Width="15%"></asp:Label>
                <asp:SqlDataSource ID="odsBarrioManzanaParcelaTrae" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="barrioManzanaLoteTraeODDL" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="oddlBarrioTrae" Name="idBarrio" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="oddlBarrioManzanaTrae" Name="idBarrioManzana" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DropDownList ID="oddlBarrioManzanaParcelaTrae" runat="server" DataSourceID="odsBarrioManzanaParcelaTrae" DataTextField="barrioLoteDescripcion" DataValueField="idBarrioLote" Height="36px" Width="80%" AutoPostBack="True">
                </asp:DropDownList>
            </div>

            <div>
                <asp:Label ID="Label1" runat="server" Text="Perimetros" Font-Bold="true"></asp:Label>
            </div>
            <div>
                <asp:Label ID="Label2" runat="server" Text="Perimetro Barrio"></asp:Label>
                <asp:SqlDataSource ID="odsBarrioPerimetro" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select * from barrioPerimetro where idBarrio=@idBarrio order by barrioPerimetroOrden">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="oddlBarrioTrae" Name="idBarrio" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="ogvBarrioPerimetro" runat="server" DataSourceID="odsBarrioPerimetro" AutoGenerateColumns="False" EmptyDataText="Barrio sin perimetro definido">
                    <Columns>
                        <asp:BoundField DataField="idBarrioPerimetro" HeaderText="idBarrioPerimetro" SortExpression="idBarrioPerimetro" Visible="False" />
                        <asp:BoundField DataField="idBarrio" HeaderText="idBarrio" SortExpression="idBarrio" Visible="False" />
                        <asp:BoundField DataField="barrioPerimetroReferencia" HeaderText="Referencia" SortExpression="barrioPerimetroReferencia" />
                        <asp:BoundField DataField="barrioPerimetroOrden" HeaderText="Orden" SortExpression="barrioPerimetroOrden" />
                        <asp:BoundField DataField="latitud" HeaderText="latitud" SortExpression="latitud" />
                        <asp:BoundField DataField="longitud" HeaderText="longitud" SortExpression="longitud" />
                    </Columns>
                </asp:GridView>
                <br />
            </div>

            <div>
                <asp:Label ID="Label3" runat="server" Text="Perimetro Manzana"></asp:Label>
                <asp:SqlDataSource ID="odsManzanaPerimetro" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select * from manzanaPerimetro where idManzana=@idManzana order by manzanaPerimetroOrden">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="oddlBarrioManzanaTrae" Name="idManzana" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="ogvManzanaPerimetro" runat="server" AutoGenerateColumns="False" DataSourceID="odsManzanaPerimetro" EmptyDataText="Manzana sin perimetro definido">
                    <Columns>
                        <asp:BoundField DataField="idManzanaPerimetro" HeaderText="idManzanaPerimetro" SortExpression="idManzanaPerimetro" Visible="False" />
                        <asp:BoundField DataField="idManzana" HeaderText="idManzana" SortExpression="idManzana" Visible="False" />
                        <asp:BoundField DataField="manzanaPerimetroReferencia" HeaderText="Referencia" SortExpression="manzanaPerimetroReferencia" />
                        <asp:BoundField DataField="manzanaPerimetroOrden" HeaderText="Orden" SortExpression="manzanaPerimetroOrden" />
                        <asp:BoundField DataField="latitud" HeaderText="latitud" SortExpression="latitud" />
                        <asp:BoundField DataField="longitud" HeaderText="longitud" SortExpression="longitud" />
                    </Columns>
                </asp:GridView>
                <br />

            </div>


            <div>
                <asp:Label ID="Label4" runat="server" Text="Perimetro Lote"></asp:Label>
                <asp:SqlDataSource ID="odsLotePerimetro" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select * from lotePerimetro where idLote=@idBarrioLote">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="oddlBarrioManzanaParcelaTrae" Name="idBarrioLote" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="ogvLotePerimetro" runat="server" AutoGenerateColumns="False" DataSourceID="odsLotePerimetro" EmptyDataText="Lote sin perimetro definido">
                    <Columns>
                        <asp:BoundField DataField="idLotePerimetro" HeaderText="idLotePerimetro" SortExpression="idLotePerimetro" Visible="False" />
                        <asp:BoundField DataField="idLote" HeaderText="idLote" SortExpression="idLote" Visible="False" />
                        <asp:BoundField DataField="lotePerimetroReferencia" HeaderText="Referencia" SortExpression="lotePerimetroReferencia" />
                        <asp:BoundField DataField="lotePerimetroOrden" HeaderText="Orden" SortExpression="lotePerimetroOrden" />
                        <asp:BoundField DataField="latitud" HeaderText="latitud" SortExpression="latitud" />
                        <asp:BoundField DataField="longitud" HeaderText="longitud" SortExpression="longitud" />
                    </Columns>
                </asp:GridView>

            </div>
            <div>
                <br />
                <asp:Button ID="obutVerMapa" runat="server" Text="Mostrar mapa" Visible ="false" />

            </div>

            <div>
                <asp:Label ID="olblMensaje" runat="server" Text=""></asp:Label>
            </div>

<div>
 <br />
<asp:Button ID="obutComoLlegar" runat="server" Text="Como llegar (Redirecciona a Google Maps del usuario" Visible="false"  />
</div>



</asp:Panel>


        <asp:Panel ID="PanelMapa" runat="server" Visible="false">
             <div> 
             <br /> 
            <asp:Label ID="olblLoteSeleccionado" runat="server" Text="Lote no seleccionado"></asp:Label><asp:Button ID="obutLoteVolver" runat="server" Text="Volver a Seleccion" />
        </div> 
            <div id="Mapa01" style="width: 100%; height: 600px">
            </div>
            
            <div>
                <br />
              
            </div>


        </asp:Panel> 
    </form>
</body>
</html>
