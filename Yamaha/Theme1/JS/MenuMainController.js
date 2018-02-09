/*
 * 菜单切换子菜单公共函数
 */
function showMenuDetail(menuCurrentIndex){
    //UiController.showLayer("MenuMainDetail");
    //UiController.setLayerProperty("MenuMainDetail","menuCurrentIndex",menuCurrentIndex);
    //UiController.setLayerProperty("MenuMainDetail","moduleCurrentIndex",0);
    if(menuCurrentIndex === 1){
        UiController.showLayer("DcdcSystemMenu");
        UiController.setLayerProperty("DcdcSystemMenu", "bKeyEnable", true);
    }else if(menuCurrentIndex === 2){
        UiController.showLayer("InstrumentSysMenu");
        UiController.setLayerProperty("InstrumentSysMenu", "bKeyEnable", true);
    }else if(menuCurrentIndex === 3){
        UiController.showLayer("LightAdjustMenu");
        UiController.setLayerProperty("LightAdjustMenu", "bKeyEnable", true);
    }else if(menuCurrentIndex === 4){
        UiController.showLayer("MoterBatteryMenu");
        UiController.setLayerProperty("MoterBatteryMenu", "bKeyEnable", true);
    }else if(menuCurrentIndex === 5){
        UiController.showLayer("OtherInformationMenu");
        UiController.setLayerProperty("OtherInformationMenu", "bKeyEnable", true);
    }else if(menuCurrentIndex === 6){
        UiController.showLayer("TimeSettingsMenu");
        UiController.setLayerProperty("TimeSettingsMenu", "bKeyEnable", true);
    }else if(menuCurrentIndex === 7){
        UiController.showLayer("TirePressureMenu");
        UiController.setLayerProperty("TirePressureMenu", "bKeyEnable", true);
    }else if(menuCurrentIndex === 8){
        UiController.showLayer("VcuSystemMenu");
        UiController.setLayerProperty("VcuSystemMenu", "bKeyEnable", true);
    }else if(menuCurrentIndex === 9){
        UiController.showLayer("VideoConvertMenu");
        UiController.setLayerProperty("VideoConvertMenu", "bKeyEnable", true);
    }
}
/*
 * 仪表信息模块切换公共函数
 */
function showModule(moduleCurrentIndex){
    UiController.hideLayer("InstrumentSystem");
    UiController.hideLayer("BeforeModule");
    UiController.hideLayer("CenterModule");
    UiController.hideLayer("AfterModule");
    switch (moduleCurrentIndex){
    case 0:
        UiController.showLayer("InstrumentSystem");
        break;
    case 1:
        UiController.showLayer("BeforeModule");
        break;
    case 2:
        UiController.showLayer("CenterModule");
        break
    case 3:
        UiController.showLayer("AfterModule");
        break;
    default:
        break;
    }
}
