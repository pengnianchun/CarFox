/*
 * 菜单定义
 */
var menuInfoLayerArray = ["ControlSystem", "EngineSystem",
                          "AuxiliarySystem", "TcuSystem",
                          "BatterySystem", "BatteryStatus",
                          "AirCondition", "InstrumentSystem",
                          "SettingSystem", "DcdcSystemMenu",
                          "OtherInformationMenu", "TirePressureMenu"]
var menuInfoTitleArray = ["控制系统信息", "发动机系统信息",
                          "辅助系统信息", "TCU系统信息",
                          "电池管理系统信息", "电池状态系统信息",
                          "空调系统信息", "仪表系统信息",
                          "设置", "DC/DC系统信息",
                          "杂项信息查询", "胎压监测系统信息"]
var menuInfoIconArray = ["icon1.png", "icon2.png",
                         "icon3.png", "icon4.png",
                         "icon5.png", "icon6.png",
                         "icon7.png", "icon8.png",
                         "icon9.png", "dc-dc.png",
                         "icon9.png", "icon9.png"]
var moduleInfoTitleArray = ["仪表系统信息", "前模块",
                            "中模块", "后模块"]
var menuInstrumentSystemIndexSP = 7 // 仪表系统信息IndexSP
var menuSettingSystemIndexSP = 8 // 设置系统信息IndexSP

/*
 * 菜单切换子菜单公共函数
 */
function showMenuDetail(menuCurrentIndex){
    UiController.hideLayer("MenuPanel");
    UiController.showLayer("MenuMainDetail");
    UiController.setLayerProperty("MenuMainDetail", "menuCurrentIndex", menuCurrentIndex);
    UiController.setLayerProperty("MenuMainDetail", "moduleCurrentIndex", 0);

    //显示SubMenu
    UiController.showLayer(menuInfoLayerArray[menuCurrentIndex]);

    // SP
    if(menuCurrentIndex === menuSettingSystemIndexSP){
        var settingSystemStatus = [true, false, false];
        var dateYMDHMStatus = [true, false, false, false, false, false];
        UiController.setLayerProperty("SettingSystem", "settingSystemStatus", settingSystemStatus);
        UiController.setLayerProperty("SettingSystem", "dateYMDHMStatus", dateYMDHMStatus);
    }
}

/*
 * 仪表信息模块切换公共函数
 */
function showModule(moduleCurrentIndex){
    UiController.hideLayer("InstrumentSystem");
    UiController.hideLayer("InstrumentModule");
    if (moduleCurrentIndex === 0) {
        UiController.showLayer("InstrumentSystem");
    } else {
        UiController.showLayer("InstrumentModule");
        UiController.setLayerProperty("InstrumentModule", "instrumentCurrentIndex", moduleCurrentIndex);
    }
}
