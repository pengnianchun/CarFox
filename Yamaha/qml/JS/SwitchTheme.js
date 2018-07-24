function doSwitchTheme(offset) {
    CarStatus.enableKeys(false);
    CarStatus.alarmInterfaceChanged(0);
//    UiController.setRemainContent("isNaviWorking", false);
    CarStatus.themeSetChanged(offset)
}

function switchTheme(key) {
    // 大于25KM/H时不允许切换主题
    if (CarStatus.speed >= 25)
        return;
    if (UiController.isMenuShown) return;

    if (key === CustomEnum.KEY_UP) {
        CarStatus.enableKeys(false);
        doSwitchTheme(-1)
    } else if (key === CustomEnum.KEY_DOWN) {
        CarStatus.enableKeys(false);
        doSwitchTheme(1)
    }
}

// 菜单项中选中新主题后调用这个函数
function doEnterMenu(currentThemeId) {
    if (themePathView.currentIndex !== currentThemeId) {
        CarStatus.enableKeys(false);
        doSwitchTheme(themePathView.currentIndex - currentThemeId);
    }

    if (UiController.remainContent("closeNavigate")) {
        UiController.popFromStackView(1)
        UiController.setRemainContent("closeNavigate", false)
    }
}
