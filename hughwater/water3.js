var data = [1,3,2,5,4,2,4,3,3,2,1,2,1,4,3,2,6,5,4,3,2,1,3,2,5,4,2,4,3,3,2,1,2,1,4,3,2,6,5,4,3,2,1,3,2,5,4,2,4,3,3,2,1,2,1,4,3,2,6,5,4,3,2,1,3,2,5,4,2,4,3,3,2,1,2,1,4,3,2,6,5,4,3,2];

function getWater(data) {
    var i = 0;
    var j = data.length-1;
    var iHeight = data[i];
    var jHeight = data[j];
    var forward = true;
    var totalWater = 0;
    

    while ( i != j ) {
        var bigger;
        //if (iHeight < jHeight)
        if (data[i] < data[j])
            foward = true;
        //if (jHeight < iHeight)
        if (data[j] < data[i])
            forward = false; 

        if ( forward ) {
            bigger = (data[i] > iHeight);
            if ( bigger ) {
                // hit bigger switch
                iHeight = data[i];
                forward = !forward;
                j -= 1;
            } else {
                totalWater += max(iHeight - data[i], 0);
                i +=1;
            }
        } else {
            bigger = (data[j] > jHeight);
            if ( bigger ) {
                // hit bigger switch
                jHeight = data[j];
                forward = !forward;
                i += 1;
            } else {
                totalWater += max(jHeight - data[j], 0);
                j -= 1;
            }

        }
        
    }
    return totalWater;
}

function max (a,b) {
    if ( a > b )
        return a;
    return b;
}
