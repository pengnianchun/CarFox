/*
 * home按键处理
 */
function homeButtonClick(mainRingPanel,menuMainDetail,layerArray) {
    if(layerArray[0]){
        //mainRingPanel.mainRingStatus = false;
        //resetLayerStatus(layerArray);
        //layerArray[1] = true;
    }else if(layerArray[1]){
        /*
            执行动画
        */
        //menuMainDetail.menuCurrentIndex = mainRingPanel.menuCurrentIndex;
        //menuMainDetail.visible = true;
        //mainRingPanel.visible = false;
        resetLayerStatus(layerArray);
        layerArray[2] = true;
    }else if(layerArray[2]){
        if(mainRingPanel.menuCurrentIndex === 8){
            var settingIndex = menuMainDetail.menuInfoId[8].settingSystemId[0].listViewSelectId.currentIndex;
            var themeIndex = menuMainDetail.menuInfoId[8].settingSystemId[1].listViewSelectId.currentIndex;
            if(settingIndex === 0){
                var initializeStatus = menuMainDetail.menuInfoId[8].initializeStatus;
                menuMainDetail.menuInfoId[8].settingSystemStatus = [false,false,true];
                var dateYMDHMStatusCount = menuMainDetail.menuInfoId[8].dateYMDHMStatus.length;
                for(var i=0;i<dateYMDHMStatusCount;i++){
                    if(menuMainDetail.menuInfoId[8].dateYMDHMStatus[i]){
                        if(i === dateYMDHMStatusCount-1){
                            console.log("时间设置请求发送...")
                            menuMainDetail.menuInfoId[8].dateYMDHMStatus[i] = false;
                            menuMainDetail.menuInfoId[8].dateYMDHMId[i].fontColor = "#ffffff";
                            menuMainDetail.menuInfoId[8].dateYMDHMStatus[0] = true;
                            menuMainDetail.menuInfoId[8].dateYMDHMId[0].fontColor = "#00deff";
                            menuMainDetail.menuInfoId[8].initializeStatus = 0;
                            menuMainDetail.menuInfoId[8].settingSystemStatus = [true,false,false];
                        }else if(initializeStatus === 0){
                            menuMainDetail.menuInfoId[8].initializeStatus = 1;
                        }else{
                            menuMainDetail.menuInfoId[8].dateYMDHMStatus[i] = false;
                            menuMainDetail.menuInfoId[8].dateYMDHMId[i].fontColor = "#ffffff";
                            menuMainDetail.menuInfoId[8].dateYMDHMStatus[i+1] = true;
                            menuMainDetail.menuInfoId[8].dateYMDHMId[i+1].fontColor = "#00deff";
                        }
                        //console.log("menuMainDetail.menuInfoId[8].dateYMDHMStatus:" + menuMainDetail.menuInfoId[8].dateYMDHMStatus)
                        break;
                    }
                }
            }else if(settingIndex === 1){
                if(menuMainDetail.menuInfoId[8].settingSystemStatus[1]){
                    console.log("主题" + (themeIndex+1) + "切换成功！");
                }else{
                    menuMainDetail.menuInfoId[8].settingSystemStatus = [false,true,false];
                }
            }else{}
        }else{}
    }else{}
}
/*
 * return按键处理
 */
function returnButtonClick(mainRingPanel,menuMainDetail,layerArray) {
    if(layerArray[0]){
    }else if(layerArray[1]){
        //resetLayerStatus(layerArray);
        //mainRingPanel.mainRingStatus = true;
        //layerArray[0] = true;
        //mainRingPanel.menuCurrentIndex = 0;
    }else if(layerArray[2]){
        if((mainRingPanel.menuCurrentIndex === 8)&&(!menuMainDetail.menuInfoId[8].settingSystemStatus[0])){
            var dateYMDHMStatusCount = menuMainDetail.menuInfoId[8].dateYMDHMStatus.length;
            menuMainDetail.menuInfoId[8].settingSystemStatus = [true,false,false];
            for(var i=0;i<dateYMDHMStatusCount;i++){
                menuMainDetail.menuInfoId[8].dateYMDHMStatus[i] = false;
                menuMainDetail.menuInfoId[8].dateYMDHMId[i].fontColor = "#ffffff";
            }
            menuMainDetail.menuInfoId[8].initializeStatus = 0;
            menuMainDetail.menuInfoId[8].dateYMDHMStatus[0] = true;
            menuMainDetail.menuInfoId[8].dateYMDHMId[0].fontColor = "#00deff";
        }else{
            /*
                执行动画
            */
            //menuMainDetail.visible = false;
            //mainRingPanel.visible = true;
            resetLayerStatus(layerArray);
            layerArray[1] = true;
        }
    }else{}
}
/*
 * go按键处理
 */
function goButtonClick(mainRingPanel,menuMainDetail,layerArray) {
    if(layerArray[0]){
    }else if(layerArray[1]){
        if((mainRingPanel.menuCurrentIndex >= 0)&&(mainRingPanel.menuCurrentIndex < 8)){
            mainRingPanel.menuCurrentIndex += 1;
        }else{
            mainRingPanel.menuCurrentIndex = 0;
        }
    }else if(layerArray[2]){
        if(mainRingPanel.menuCurrentIndex === 7){
            if((menuMainDetail.moduleCurrentIndex >= 0)&&(menuMainDetail.moduleCurrentIndex < 3)){
                menuMainDetail.moduleCurrentIndex += 1;
            }else{
                menuMainDetail.moduleCurrentIndex = 0;
            }
        }else if(mainRingPanel.menuCurrentIndex === 8){
            turnPageStatus(menuMainDetail,"add");
        }else{}
    }else{}
}
/*
 * back按键处理
 */
function backButtonClick(mainRingPanel,menuMainDetail,layerArray) {
    if(layerArray[0]){
    }else if(layerArray[1]){
        if((mainRingPanel.menuCurrentIndex > 0)&&(mainRingPanel.menuCurrentIndex <= 8)){
            mainRingPanel.menuCurrentIndex -= 1;
        }else{
            mainRingPanel.menuCurrentIndex = 8;
        }
    }else if(layerArray[2]){
        if(mainRingPanel.menuCurrentIndex === 7){
            if((menuMainDetail.moduleCurrentIndex > 0)&&(menuMainDetail.moduleCurrentIndex <= 3)){
                menuMainDetail.moduleCurrentIndex -= 1;
            }else{
                menuMainDetail.moduleCurrentIndex = 3;
            }
        }else if(mainRingPanel.menuCurrentIndex === 8){
            turnPageStatus(menuMainDetail,"reduce");
        }else{}
    }else{}
}
/*
 * 第三层切换UI
 */
function currentMenuDetailInfo(menuCurrentIndex,menuInfoId){
    for(var i=0;i<menuInfoId.length;i++){
        menuInfoId[i].visible = false;
    }
    menuInfoId[menuCurrentIndex].visible = true;
}
/*
 * 第三层切换Module
 */
function currentModuleDetailInfo(moduleCurrentIndex,moduleInfoId){
    for(var i=0;i<moduleInfoId.length;i++){
        moduleInfoId[i].visible = false;
    }
    moduleInfoId[moduleCurrentIndex].visible = true;

}
/*
 * 重置Layer显示状态
 */
function resetLayerStatus(layerArray){
    for(var i=0;i<layerArray.length;i++){
        layerArray[i] = false;
    }
}
/*
 * 设置UI翻页切换功能
 */
function turnPageStatus(menuMainDetail,action){
    var settingIndex = menuMainDetail.menuInfoId[8].settingSystemId[0].listViewSelectId.currentIndex;
    var themeIndex = menuMainDetail.menuInfoId[8].settingSystemId[1].listViewSelectId.currentIndex;
    if(menuMainDetail.menuInfoId[8].settingSystemStatus[0]){
        //时间设置/主题设置处理
        if(settingIndex === 0){
            menuMainDetail.menuInfoId[8].settingSystemId[0].listViewSelectId.currentIndex = 1;
        }else if(settingIndex === 1){
            menuMainDetail.menuInfoId[8].settingSystemId[0].listViewSelectId.currentIndex = 0;
        }else{}
    }else if(menuMainDetail.menuInfoId[8].settingSystemStatus[1]){
        //主题设置处理
        if(themeIndex === 0){
            menuMainDetail.menuInfoId[8].settingSystemId[1].listViewSelectId.currentIndex = 1;
        }else if(themeIndex === 1){
            menuMainDetail.menuInfoId[8].settingSystemId[1].listViewSelectId.currentIndex = 0;
        }else{}
    }else if(menuMainDetail.menuInfoId[8].settingSystemStatus[2]){
        //时间设置处理
        var setValueS,setValueE,currentValue;
        if(menuMainDetail.menuInfoId[8].dateYMDHMStatus[0]){
            currentValue = menuMainDetail.menuInfoId[8].dateYMDHMId[0].textValue;
            menuMainDetail.menuInfoId[8].dateYMDHMId[0].textValue = getDateValue(24,currentValue,action);
        }else if(menuMainDetail.menuInfoId[8].dateYMDHMStatus[1]){
            currentValue = menuMainDetail.menuInfoId[8].dateYMDHMId[1].textValue;
            menuMainDetail.menuInfoId[8].dateYMDHMId[1].textValue = getDateValue(60,currentValue,action);
        }else if(menuMainDetail.menuInfoId[8].dateYMDHMStatus[2]){
            currentValue = menuMainDetail.menuInfoId[8].dateYMDHMId[2].textValue;
            if(action === "add"){
                setValueS =  parseInt(currentValue)+1;
                setValueE = setValueS.toString();
            }else if(action === "reduce"){
                setValueS =  parseInt(currentValue)-1;
                setValueE = setValueS.toString();
            }else{}
            menuMainDetail.menuInfoId[8].dateYMDHMId[2].textValue = setValueE;
        }else if(menuMainDetail.menuInfoId[8].dateYMDHMStatus[3]){
            currentValue = menuMainDetail.menuInfoId[8].dateYMDHMId[3].textValue;
            menuMainDetail.menuInfoId[8].dateYMDHMId[3].textValue = getDateValue(12,currentValue,action);
        }else if(menuMainDetail.menuInfoId[8].dateYMDHMStatus[4]){
            currentValue = menuMainDetail.menuInfoId[8].dateYMDHMId[4].textValue;
            menuMainDetail.menuInfoId[8].dateYMDHMId[4].textValue = getDateValue(31,currentValue,action);
        }else if(menuMainDetail.menuInfoId[8].dateYMDHMStatus[5]){
            console.log("确认...")
        }else{}
    }else{}
}
/*
 * add reduce 功能
 */
function getDateValue(scopeValue,currentValue,action){
    var setValueS,setValueE;
    if(action === "add"){
        if(parseInt(currentValue)<scopeValue){
            setValueS =  parseInt(currentValue)+1;
            setValueE = setValueS.toString();
            if(setValueS<10){
                setValueE = "0"+ setValueS;
            }else{}
        }else{
            setValueE = "01";
        }
    }else if(action === "reduce"){
        if(parseInt(currentValue)>1){
            setValueS =  parseInt(currentValue)-1;
            setValueE = setValueS.toString();
            if(setValueS<10){
                setValueE = "0"+ setValueS;
            }else{}
        }else{
            setValueE = scopeValue;
        }
    }else{}
    return setValueE;
}
