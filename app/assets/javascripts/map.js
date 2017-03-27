$(document).ready(function(){
  initMap();
  addAddress();
});

function initMap(){
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 12,
    center: {
      lat: 39.7392,
      lng: -104.9903
    }
  });
}

function addAddress(){
  var geocoder = new google.maps.Geocoder();
  $('.submit-address').click(function(){
    // codeAddress(geocoder);
    var address = $('#street-address').val();
    console.log(address);
  })
}

function codeAddress(geocoder){
  var address = $('.submit-address').val();
  console.log(address);
  if(address.length > 0){
    geocoder.geocode({'address': address}, function(result, status){
      debugger;
      if(status == google.maps.GeocoderStatus.OK){
        map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });
      } else {
        alert("Geocode was not successful because " + status);
      }
    })
  } else {
    alert("Please enter your address");
  }
}
