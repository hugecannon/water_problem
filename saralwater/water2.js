 var map = [1,3,2,5,4,2,4,3,3,2,1,2,1,4,3,2,6,5,4,3,2];
 
function area(map) {
  var sum = 0;
  var peaks = findPeaks(map);
  for (var i = 0; i<map.length; i++) {
      sum += waterAtIndex(map, i, peaks);
  }
  return sum;
}

function waterAtIndex(map, index, peaks) {
  if (map[index] < peaks[index]) {
      return peaks[index] - map[index];
  }

  return 0;
}
 
function findPeaks(map) {
    var peaks = [];
    var peak = 0;
 
    for (var i = 0; i<map.length; i++) {
        if (map[i] > peak) {
            peak = map[i];
        }
 
        peaks[i] = peak;
    }
 
    peak = 0;
    for (i = map.length-1; i>=0; i--) {
        if (map[i] > peak) {
            peak = map[i];
        }
 
        if (peaks[i] > peak) {
            peaks[i] = peak;
        }
    }
 
    return peaks;
}
