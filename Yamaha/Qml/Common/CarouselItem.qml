/***************************************************
 *
 *  轮播类，按指定的频率轮播列表中的图层
 *  轮播内容必须放在id=warningInfoContainer的Item中
 *
 **************************************************/

import QtQuick 2.6
import "qrc:/Common/Qml/Common"

CommonItem {
    visible: true
    property int carouselInterval: 5000 // 默认的轮播频率， 应用层可以指定, =0时不轮播

    /*** 以下内容用户层不能修改 ***/
    property var activeWarnings: [] // 轮播列表
    property int currentIndex: 0
    onVisibleChanged: {
        if (visible) {
            currentIndex = 0;
            warningTimer.start();
        } else {
            warningTimer.stop();
        }
    }

    // Back键，取消当前项目的轮播
    onKeyBack: function()
    {
        var currentWarn = activeWarnings[currentIndex - 1];
        if (currentWarn)
            currentWarn.depress();
    }

    // 隐藏容器中所有项目，除了指定项
    function hideWarningInfo(warn) {
        for (var i in warningInfoContainer.visibleChildren) {
            if (warn !== warningInfoContainer.visibleChildren[i])
                warningInfoContainer.visibleChildren[i]['visible'] = false;
        }
    }

    // 显示最后到来的项目
    function showTopItem()
    {
        if (0 === activeWarnings.length) return;
        showWarningInfo(activeWarnings.length-1)
    }

    // 显示下一个项目
    function showNextItem()
    {
        if (0 === activeWarnings.length) return;

        currentIndex ++;
        if (currentIndex >= activeWarnings.length)
            currentIndex = 0;

        showWarningInfo(currentIndex);
    }

    // 显示上一个项目
    function showPreviousItem()
    {
        if (0 === activeWarnings.length) return;
        currentIndex --;
        if (currentIndex < 0)
            currentIndex = activeWarnings.length - 1;

        showWarningInfo(currentIndex);
    }

    // 显示列表中的指定项
    function showWarningInfo(index) {
        hideWarningInfo(activeWarnings[index]);
        if (0 === activeWarnings.length) {
            UiController.popFromStackView(2);
        } else if (index < activeWarnings.length) {
            activeWarnings[index].visible = true;
        }
        //console.log("showWarningInfo", index);
    }

    function getCurrentWarningIndex() {
        if (activeWarnings.length > 0) return currentIndex - 1;
        return -1
    }

    // 每来一个信号，都遍历容器中所有项目，并重整轮播列表
    function updateActiveWarnings() {
        //activeWarnings = [];
        for (var i in warningInfoContainer.children) {
            var w = warningInfoContainer.children[i];
            if (w.hasOwnProperty('isActive')) {
                if (w['isActive']) {
                    // 原列表中不存在该项
                    if (activeWarnings.indexOf(w) === -1)
                    {
                        //activeWarnings.push(w);
                        var cwIndex = getCurrentWarningIndex();
                        if (cwIndex > -1) {
                            activeWarnings.splice(cwIndex + 1, 0, w);
                        } else {
                            activeWarnings.push(w);
                        }

                        currentIndex = activeWarnings.indexOf(w)
                        warningTimer.restart();
                    }
                }
                else
                {
                    // 从列表中移除
                    var idx = activeWarnings.indexOf(w);
                    if (idx >= 0) {
                        activeWarnings.splice(idx, 1);
                    }
                    // 取消的项目当前可见，立即刷新
                    if (w['visible'] && !w['isActive'])
                    {
                        warningTimer.restart();
                    }

                    if (idx >= 0) {
                        w.visible = false
                    }
                }
            }
        }
    }

    Timer {
        id: warningTimer
        interval: carouselInterval
        repeat: true
        triggeredOnStart: true

        onTriggered: {
            if (currentIndex >= activeWarnings.length)
                currentIndex = 0;

            showWarningInfo(currentIndex);
            currentIndex++;
        }
    }

}
