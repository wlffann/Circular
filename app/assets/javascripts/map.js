
$(document).ready(function(){
  initMap();
  addAddress();
});

var map;
function initMap() {
  var denver = { lat: 39.7392, lng: -104.9903 };
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 12,
    center: denver
  });
}


function addAddress(){
  var geocoder = new google.maps.Geocoder();
  $('.submit-address').on('click', function(e){
    e.preventDefault();
    console.log($('#street-address').val());
    var address = $('#street-address').val();
    codeAddress(geocoder, address, map);
  });
}

function codeAddress(geocoder, address, map){
  console.log(address);
  if(address.length > 0){
    geocoder.geocode({'address': address}, function(results, status){
      if(status == google.maps.GeocoderStatus.OK){
        // map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
          map: map,
            zoom: 12,
            center: results[0].geometry.location
        });
      } else {
        alert("Geocode was not successful because " + status);
      }
    })
  } else {
    alert("Please enter your address");
  }
}
