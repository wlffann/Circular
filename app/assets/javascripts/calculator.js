$(function(){
  var gallonsPerUnitPerWeek = 6.4;
  var relevantUpper = 10;
  var relevantLower = 0.5;
  var table = $("#calc-table");
  var unitsInput = $("#num-units");

  //Reduces displayed numbers to one decimal place.
  //and removes trailing 0s
  var truncZeros = function(num){
    var round = num.toFixed(1);
    if(round % 1 === 0){
      return num.toFixed(0);
    }
    else if(num === 0){
      return num.toFixed(0);
    }
    else{
      return round;
    }
  };

  //does the actual work of calculating the number of containers
  var calculate = function (numUnits, pickupsPerWeek, numGallons){
    var result = (numUnits * gallonsPerUnitPerWeek) / (numGallons / pickupsPerWeek);
    var rounded = truncZeros(result);
    return rounded;
  };

  $("#num-units").keyup( function(){
  	table.find("td.calc-output").each(function(){
  	  var cell = $(this);
  	  var numUnits = Number(unitsInput.val())
  		var numGallons = Number($(this).data("gallons"));
  		var numPickups = Number($(this).data("pickups"));

      result = calculate(numUnits, numPickups, numGallons);
    	cell.text(result);
  	});
  });
});
