/*
 * 返回主菜单页面通用函数
 */
function returnMenuPanel(menuLayerId,parentMenuId){
    UiController.setLayerProperty(menuLayerId, "visible", false);
    UiController.setLayerProperty(menuLayerId, "bKeyEnable", false);
    UiController.setLayerProperty(parentMenuId, "bKeyEnable", true);
    UiController.setLayerProperty(parentMenuId, "visible", true);
    UiController.setLayerProperty(parentMenuId, "state", "show");
    UiController.hideRootMenu();
    CarMsg.sendMenuInfo(0,0);
}
/*
 * 设置页面Enter键功能实现
 */
function enterSettingSystemAction(settingSystem,settingSystemId,dateYMDHMId){
    if(settingSystem.settingSystemStatus[0]){
        if(settingSystemId[0].listViewSelectId.currentIndex === 0){
            settingSystem.settingSystemStatus = [false,false,true];
        }else if(settingSystemId[0].listViewSelectId.currentIndex === 1){
            settingSystem.settingSystemStatus = [false,true,false];
        }else{}
    }else if(settingSystem.settingSystemStatus[1]){
        console.log("主题" + (settingSystemId[1].listViewSelectId.currentIndex+1) + "切换成功！");
    }else if(settingSystem.settingSystemStatus[2]){
        var dateYMDHMStatusCount = settingSystem.dateYMDHMStatus.length;
        for(var i=0;i<dateYMDHMStatusCount;i++){
            if(settingSystem.dateYMDHMStatus[i]){
                if(i === dateYMDHMStatusCount-1){
                    var year = dateYMDHMId[2].textValue;
                    var month = dateYMDHMId[3].textValue;
                    var day = dateYMDHMId[4].textValue;
                    var hour = dateYMDHMId[0].textValue;
                    var miniute = dateYMDHMId[1].textValue;
                    var date = new Date( year + '-' + month + '-' + day + ' ' + hour +':' + miniute +':00');
                    var timestamp = date.getTime()/1000;
                    CarMsg.sendDateTime(timestamp);
                    settingSystem.dateYMDHMStatus[i] = false;
                    dateYMDHMId[i].fontColor = "#ffffff";
                    settingSystem.dateYMDHMStatus[0] = true;
                    dateYMDHMId[0].fontColor = "#00deff";
                    settingSystem.settingSystemStatus = [false,false,true];
                    console.log("time date send:::::::::::::::::::::::::" + year + '-' + month + '-' + day + ' ' + hour +':' + miniute +':00');
                    console.log("time stamp:::::::::::::::::::::::::" + timestamp);
                }else{
                    settingSystem.dateYMDHMStatus[i] = false;
                    dateYMDHMId[i].fontColor = "#ffffff";
                    settingSystem.dateYMDHMStatus[i+1] = true;
                    dateYMDHMId[i+1].fontColor = "#00deff";
                }
                break;
            }else{}
        }
    }else{}
}
/*
 * 设置页面Return键功能实现
 */
function returnSettingSystemAction(settingSystem,dateYMDHMId,menuLayerId,parentMenuId) {
    /*
    if(!settingSystem.settingSystemStatus[0]){
        var dateYMDHMStatusCount = settingSystem.dateYMDHMStatus.length;
        settingSystem.settingSystemStatus = [true,false,false];
        for(var i=0;i<dateYMDHMStatusCount;i++){
            settingSystem.dateYMDHMStatus[i] = false;
            dateYMDHMId[i].fontColor = "#ffffff";
        }
        settingSystem.dateYMDHMStatus[0] = true;
        dateYMDHMId[0].fontColor = "#00deff";
    }else{
        returnMenuPanel(menuLayerId,parentMenuId);
    }
    */
    returnMenuPanel(menuLayerId,parentMenuId)
}
/*
 * 设置UI翻页切换功能
 */
function turnPageStatus(settingSystem,settingSystemId,dateYMDHMId,action){
    var settingIndex = settingSystemId[0].listViewSelectId.currentIndex;
    var themeIndex = settingSystemId[1].listViewSelectId.currentIndex;
    if(settingSystem.settingSystemStatus[0]){
        //时间设置/主题设置处理
        if(settingIndex === 0){
            settingSystemId[0].listViewSelectId.currentIndex = 1;
        }else if(settingIndex === 1){
            settingSystemId[0].listViewSelectId.currentIndex = 0;
        }else{}
    }else if(settingSystem.settingSystemStatus[1]){
        //主题设置处理
        if(themeIndex === 0){
            settingSystemId[1].listViewSelectId.currentIndex = 1;
        }else if(themeIndex === 1){
            settingSystemId[1].listViewSelectId.currentIndex = 0;
        }else{}
    }else if(settingSystem.settingSystemStatus[2]){
        //时间设置处理
        var setValueS,setValueE,currentValue;
        if(settingSystem.dateYMDHMStatus[0]){
            currentValue = dateYMDHMId[0].textValue;
            dateYMDHMId[0].textValue = getDateValue(23,currentValue,action,true);
        }else if(settingSystem.dateYMDHMStatus[1]){
            currentValue = dateYMDHMId[1].textValue;
            dateYMDHMId[1].textValue = getDateValue(59,currentValue,action,true);
        }else if(settingSystem.dateYMDHMStatus[2]){
            currentValue = dateYMDHMId[2].textValue;
            if(action === "add"){
                setValueS =  parseInt(currentValue)+1;
                setValueE = setValueS.toString();
            }else if(action === "reduce"){
                setValueS =  parseInt(currentValue)-1;
                setValueE = setValueS.toString();
            }else{}
            dateYMDHMId[2].textValue = setValueE;
        }else if(settingSystem.dateYMDHMStatus[3]){
            currentValue = dateYMDHMId[3].textValue;
            dateYMDHMId[3].textValue = getDateValue(12,currentValue,action,false);
        }else if(settingSystem.dateYMDHMStatus[4]){
            currentValue = dateYMDHMId[4].textValue;
            dateYMDHMId[4].textValue = getDateValue(31,currentValue,action,false);
        }else if(settingSystem.dateYMDHMStatus[5]){
            console.log("确认...")
        }else{}
    }else{}
}
/*
 * add reduce 功能
 */
function getDateValue(scopeValue,currentValue,action,zero){
    var setValueS,setValueE;
    if(action === "add"){
        if(parseInt(currentValue)<scopeValue){
            setValueS =  parseInt(currentValue)+1;
            setValueE = setValueS.toString();
            if(setValueS<10){
                setValueE = "0"+ setValueS;
            }else{}
        }else if(zero){
            setValueE = "00";
        }else{
            setValueE = "01";
        }
    }else if(action === "reduce"){
        if(parseInt(currentValue)>=1){
            setValueS =  parseInt(currentValue)-1;
            setValueE = setValueS.toString();
            if(setValueS<10){
                if((setValueS === 0)&&(!zero)){
                    setValueE = scopeValue;
                }else {
                    setValueE = "0"+ setValueS;
                }
            }else{}
        }else{
            setValueE = scopeValue;
        }
    }else{}
    return setValueE;
}
//轮胎状态功能切换函数
function switchTireStatus(tireIdArray){
    if(tireIdArray[0].fontColor === "red"){
        tireIdArray[0].fontColor = "#06fd00";
        tireIdArray[1].fontColor = "red";
    }else{
        tireIdArray[0].fontColor = "red";
        tireIdArray[1].fontColor = "#06fd00";
    }
}
