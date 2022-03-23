<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="HearMe._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script>
        //function that gets the location and returns it
        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                console.log("Geo Location not supported by browser");
            }
        }
        //function that retrieves the position
        function showPosition(position) {
            var location = {
                longitude: position.coords.longitude,
                latitude: position.coords.latitude
            }
            console.log(location);
            //showInMap(position);
            showMaps(position);
        }
        //request for location
        getLocation();


        function showInMap(pos) {
            var latlon = pos.coords.latitude + "," + pos.coords.longitude;

            var imgurl = "https://maps.googleapis.com/maps/api/staticmap?center=" + latlon + "&zoom=14&size=400x300&sensor=false&key=AIzaSyCu4QWSl3KHU3WaFzjxUAE2-9BnXtoJBq0";
            //var map = document.querySelector("mapholder");
            document.getElementById('mapholder').innerHTML = "<img src='" + imgurl + "'>";

        }

        function showMaps(pos) {
            const curloc = { lat: pos.coords.latitude, lng: pos.coords.longitude };
            // The map, centered at Uluru
            const map = new google.maps.Map(document.getElementById("mapholder"), {
                zoom: 17,
                center: curloc,

            });
            map.panBy(0, 60);
            // The marker, positioned at Uluru
            const marker = new google.maps.Marker({
                position: curloc,
                map: map,
            });
            var geoloccontrol = new klokantech.GeolocationControl(map, 20);
        }

    </script>

    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCu4QWSl3KHU3WaFzjxUAE2-9BnXtoJBq0&libraries=&v=weekly"
        defer>
    </script>


    <div id="wrapper">
        <div id="mapholder">
        </div>
    </div>

    <div class="container body-content new">
        <div class="row">

            <div class="col-md-4">
            </div>
            <div class="col-md-4 text-center">
                <asp:Button ID="Button1" runat="server" CssClass="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" Text="SOS" Height="3.8em" Width="3.8em" Style="background: #D72729; border-color: Black; font-size: 3.8em; box-shadow: 0 10px 18px 0 rgba(0,0,0,0.2), 0 8px 22px 0 rgba(0,0,0,0.19)" />
            </div>
            <div class="col-md-4">
            </div>
        </div>

        <div class="row">
            <div class="col-md-8">
            </div>
            <div class="col-md-4">
            </div>
        </div>

    </div>

  

</asp:Content>
