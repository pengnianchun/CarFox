// 移动高亮项目，
// currentIndex是QML里的数组下标，一旦越界就会导致一个运行时报错，所以这里用一个本地变量中转一下以避免报错
function switchHilightItem(offset)
{
    var idx = currentIndex;
    idx += offset;
    if (idx > 2) idx = 0;
    if (idx < 0) idx = 2;

    currentIndex = idx;
}

// 发送重置数据请求
function dataReset(index) {
    switch (index) {
    case 0:
        CarStatus.tripCleanChanged(true);
        break;
    case 1:
        CarStatus.avgFuelCleanChanged(true);
        break;
    case 2:
        CarStatus.maintenanceCleanChanged(true);
        break;
    default:
        break;
    }
}
