
function setSpeedValueAction(speedHundredId, speedTenId, speedBitsId, value) {
    var speedValueImage = "qrc:/theme2/symbol/Theme2/Num/";
    var hundred, ten, bits;
    var digits = value.toFixed(0).length;
    if(digits === 3){
        speedHundredId.visible = true;
        speedTenId.visible = true;
        speedBitsId.visible = true;
        hundred = parseInt(value/100);
        ten = parseInt((value/10)%10);
        bits = parseInt(value%10);
        speedHundredId.source = speedValueImage + hundred + ".png";
        speedTenId.source = speedValueImage + ten + ".png";
        speedBitsId.source = speedValueImage + bits + ".png";
    }else if(digits === 2){
        speedHundredId.visible = false;
        speedTenId.visible = true;
        speedBitsId.visible = true;
        ten = parseInt((value/10)%10);
        bits = parseInt(value%10);
        speedTenId.source = speedValueImage + ten + ".png";
        speedBitsId.source = speedValueImage + bits + ".png";
    }else if(digits === 1){
        speedHundredId.visible = false;
        speedTenId.visible = false;
        speedBitsId.visible = true;
        bits = parseInt(value%10);
        speedBitsId.source =  speedValueImage + bits + ".png";
    }else{
        // error
    }
}
