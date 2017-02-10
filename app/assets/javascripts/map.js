$(document).ready(function(){
  initMap();
})



// function initMap() {
//   handler = Gmaps.build('Google');
//   handler.buildMap({ provider: {
//   }, internal: {id: 'map'}}, function(){
//     markers = handler.addMarkers([
//       {
//         "lat": 39.7392,
//         "lng": -104.9903,
//         "picture": {
//           "url": "",
//           "width":  32,
//           "height": 32
//         },
//         "infowindow": "hello!"
//       }
//     ]);
//     handler.bounds.extendWith(markers);
//     handler.fitMapToBounds();
//     handler.getMap().setZoom(10);
//   });
// }

function initMap() {
  var latLng = {
    lat: 39.7392,
    lng: -104.9903
  }
  var map = new google.maps.Map($("#map"), {
    zoom: 10,
    center: latLng
  })
}

function markerListener(map) {
  $("#submit").on('click', function(e) {
    $.ajax({
      url: "https://maps.googleapis.com/maps/api/geocode/json?address=" + $("#street_address").val().replace(/ /g , "+") + "&key=???",
      success: function(response) {
        var marker = new google.maps.Marker({
          position: response.results[0].geometry.location
        })
        marker.setMap(map);
      }
    });
  });
/* use http://maps.googleapis.com/maps/api/geocode/json?address=${street_address}?key=${ENV['google_maps_secret']}
to get latitude and longitude - JSON.parse(response.results.geometry.location) */
}
