/*
 * 车速菜单显示值处理函数
 */
function setSpeedValueAction(speedHundredId,speedTenId,speedBitsId,value){
    var speedValueImage = "qrc:/Theme/Theme2/Image/HomePanel/gray";
    var hundred,ten,bits;
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
/*
 * 发动机转速值处理函数
 */
function setEngineValueAction(thousandId,hundredId,tenId,bitsId,value){
    var engineValueImage = "qrc:/Theme/Theme2/Image/HomePanel/blue";
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
/*
 * （车速侧栏/蓄电池百分比/蓄电池电压）值处理函数
 */
function setGeneralValueAction(hundredId,tenId,bitsId,value){
    var engineValueImage = "qrc:/Theme/Theme2/Image/HomePanel/blue";
    var hundred,ten,bits;
    var digits = value.toFixed(0).length;
    if(digits === 3){
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
        hundredId.visible = false;
        tenId.visible = true;
        bitsId.visible = true;
        ten = parseInt((value/10)%10);
        bits = parseInt(value%10);
        tenId.source = engineValueImage + ten + ".png";
        bitsId.source = engineValueImage + bits + ".png";
    }else if(digits === 1){
        hundredId.visible = false;
        tenId.visible = false;
        bitsId.visible = true;
        bits = parseInt(value%10);
        bitsId.source = engineValueImage + bits + ".png";
    }else{
        console.log("battery value is error !");
    }
}
