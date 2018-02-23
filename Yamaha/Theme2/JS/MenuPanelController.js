/*
 * 速度值处理函数
 */
function setSpeedValueAction(speedHundredId,speedTenId,speedBitsId,speedValue){
    var speedValueImage = "qrc:/Theme/Theme2/Image/HomePanel/gray";
    var hundred,ten,bits;
    var digits = speedValue.toString().length;
    if(digits === 3){
        speedHundredId.visible = true;
        speedTenId.visible = true;
        speedBitsId.visible = true;
        hundred = parseInt(speedValue/100);
        ten = parseInt((speedValue%100)/10);
        bits = parseInt(speedValue%10);
        speedHundredId.source = speedValueImage + hundred + ".png";
        speedTenId.source = speedValueImage + ten + ".png";
        speedBitsId.source = speedValueImage + bits + ".png";
    }else if(digits === 2){
        speedHundredId.visible = false;
        speedTenId.visible = true;
        speedBitsId.visible = true;
        ten = parseInt((speedValue%100)/10);
        bits = parseInt(speedValue%10);
        speedTenId.source = speedValueImage + ten + ".png";
        speedBitsId.source = speedValueImage + bits + ".png";
    }else if(digits === 1){
        speedHundredId.visible = false;
        speedTenId.visible = false;
        speedBitsId.visible = true;
        bits = parseInt(speedValue%10);
        speedBitsId.source = speedValueImage + bits + ".png";
    }else{
        console.log("speed value is error !");
    }
}
/*
 * 挡位值处理函数
 */
function setGearValueAction(gearId,gearValue){
    var gearValueImage = "qrc:/Theme/Theme2/Image/HomePanel/gear";
    var gear;
    if(gearValue === 0){
        gear = "D";
    }else if(gearValue === 1){
        gear = "N";
    }else if(gearValue === 2){
        gear = "P";
    }else if(gearValue === 3){
        gear = "R";
    }else if(gearValue === 4){
        gear = "S";
    }else{}
    gearId.source = gearValueImage + gear + ".png";
}
