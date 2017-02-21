$(function(){
  var gallonsPerUnitPerWeek = 6.4;
  var context = $("#calculator");
  var unitsInput = context.find("#num-units");
  var output1 = context.find("#64x2");

  var calculate = function (numUnits, pickupsPerWeek, numGallons){
    var result = (numUnits * gallonsPerUnitPerWeek) / (numGallons / pickupsPerWeek) ;
    return result;
  };

  $("#num-units").keyup( function(){
    output1.text(calculate(unitsInput.val(), 2, 64));
  });
});
