function area(map) {
  var sum = 0;
  for (var i = 0; i<map.length; i++) {
      sum += waterAtIndex(map, i);
  }
  return sum;
}

function waterAtIndex(map, index) {
  var largestLeft = 0;
  var largestRight = 0;
  var i;

  //get the largest left point
  if (index>0) {
      for (i = index-1; i >= 0; i--) {
          if (map[i] > largestLeft) {
              largestLeft = map[i];
          }
      }
  }

  //get the largest right point
  if (index<map.length-1) {
      for (i = index+1; i < map.length; i++) {
         if (map[i] > largestRight) {
              largestRight = map[i];
         }
      }
  }
  var lowest = 0;
  if (largestLeft < largestRight) {
      lowest = largestLeft;
  } else {
      lowest = largestRight;
  }

  if (map[index] < lowest) {
      return lowest - map[index];
  }

  return 0;
}

//console.log(area(map));
