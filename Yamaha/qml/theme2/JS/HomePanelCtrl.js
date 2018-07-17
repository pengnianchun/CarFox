
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

function setEngineValueAction(thousandId,hundredId,tenId,bitsId,value){
    var engineValueImage = "qrc:/theme2/symbol/Theme2/Num/";
    var thousand,hundred,ten,bits;
    var digits = value.toFixed(0).length;
    if(digits === 4){
        thousandId.visible = true;
        hundredId.visible = true;
        tenId.visible = true;
        bitsId.visible = true;
        thousand = parseInt(value/1000);
        hundred = parseInt((value/100)%10);
        ten = parseInt((value/10)%10);
        bits = parseInt(value%10);
        thousandId.source = engineValueImage + thousand + ".png";
        hundredId.source = engineValueImage + hundred + ".png";
        tenId.source = engineValueImage + ten + ".png";
        bitsId.source = engineValueImage + bits + ".png";
    }else if(digits === 3){
        thousandId.visible = false;
        hundredId.visible = true;
        tenId.visible = true;
        bitsId.visible = true;
        hundred = parseInt(value/100);
        ten = parseInt((value/10)%10);
        bits = parseInt(value%10);
        hundredId.source = engineValueImage + hundred + ".png";
        tenId.source = engineValueImage + ten + ".png";
        bitsId.source = engineValueImage + bits + ".png";
    }else if(digits === 2){
        thousandId.visible = false;
        hundredId.visible = false;
        tenId.visible = true;
        bitsId.visible = true;
        ten = parseInt((value/10)%10);
        bits = parseInt(value%10);
        tenId.source = engineValueImage + ten + ".png";
        bitsId.source = engineValueImage + bits + ".png";
    }else if(digits === 1){
        thousandId.visible = false;
        hundredId.visible = false;
        tenId.visible = false;
        bitsId.visible = true;
        bits = parseInt(value%10);
        bitsId.source = engineValueImage + bits + ".png";
    }else{
        console.log("engine speed value is error !");
    }
}
