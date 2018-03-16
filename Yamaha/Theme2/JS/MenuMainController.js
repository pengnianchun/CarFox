/*
 * 菜单切换子菜单公共函数
 */
function showMenuDetail(menuCurrentIndex){
    UiController.showLayer("MenuMainDetail");
    UiController.setLayerProperty("MenuMainDetail","menuCurrentIndex",menuCurrentIndex);
    UiController.setLayerProperty("MenuMainDetail","moduleCurrentIndex",0);
    if(menuCurrentIndex === 0){
        UiController.showLayer("ControlSystem");
    }else if(menuCurrentIndex === 1){
        UiController.showLayer("EngineSystem");
    }else if(menuCurrentIndex === 2){
        UiController.showLayer("AuxiliarySystem");
    }else if(menuCurrentIndex === 3){
        UiController.showLayer("TcuSystem");
    }else if(menuCurrentIndex === 4){
        UiController.showLayer("BatterySystem");
    }else if(menuCurrentIndex === 5){
        UiController.showLayer("BatteryStatus");
    }else if(menuCurrentIndex === 6){
        UiController.showLayer("AirCondition");
    }else if(menuCurrentIndex === 7){
        UiController.showLayer("InstrumentSystem");
    }else if(menuCurrentIndex === 8){
        UiController.showLayer("SettingSystem");
        var settingSystemStatus = [true,false,false];
        var dateYMDHMStatus = [true,false,false,false,false,false];
        UiController.setLayerProperty("SettingSystem","settingSystemStatus",settingSystemStatus);
        UiController.setLayerProperty("SettingSystem","dateYMDHMStatus",dateYMDHMStatus);
    }else{}
    UiController.hideLayer("MenuPanel");
}
/*
 * 仪表信息模块切换公共函数
 */
function showModule(moduleCurrentIndex){
    UiController.hideLayer("InstrumentSystem");
    UiController.hideLayer("InstrumentModule");
    if(moduleCurrentIndex === 0){
        UiController.showLayer("InstrumentSystem");
    }else{
        UiController.showLayer("InstrumentModule");
        UiController.setLayerProperty("InstrumentModule","instrumentCurrentIndex",moduleCurrentIndex);
    }
}
