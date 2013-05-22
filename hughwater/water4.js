function getWater(data) {
    var i = 0,
        j = data.length-1,
        iHeight = data[i],
        jHeight = data[j],
        totalWater = 0;

    while ( i != j ) {
        if ( data[i] < data[j] ) {
            //forwards
            i++; 
            if (data[i] < iHeight) {
                //fill
                totalWater += max(iHeight - data[i], 0);        
            } else {
                // dont fill
                iHeight = data[i];

            }

        } else {
            //backwards
            j--;

            if (data[j] < jHeight) {
                //fill
                totalWater += max(jHeight - data[j], 0); 
            } else {
                // dont fill
                jHeight = data[j];
            }

        }
    }

    return totalWater;
}

function max(a,b) {
    if ( a >= b ) 
        return a;
    return b;
}

