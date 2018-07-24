import QtQuick 2.6
import CustomEnum 1.0

Item {
    visible: false
    property int previousNumber: 1;
    property int nextNumber: 1;
    property int previousTimer: 1;
    property int nextTimer: 1;
    property var onEnterAction: function(){ CarMsg.keyShortPressed(0) }
    property var onBackAction: function(){ CarMsg.keyShortPressed(1) }
    property var onPreviousAction: function(){ CarMsg.keyShortPressed(2) }
    property var onNextAction: function(){ CarMsg.keyShortPressed(3) }

    //车速初始值
    property int speedTotal: 180;
    //档位初始值
    property real gearValue: 0;
    //发动机转速
    property int engineTotalSpeed: 9999;
    //蓄电池电压
    property int batteryTotalVolt: 120;
    //动力电池电压
    property int batteryPowerTotalVolt: 220;
    //动力电池电流
    property int batteryPowerTotalAmpere: 100;
    property bool timerStatus: true;
    //自动程序按键切换执行时间间隔
    property int intervalTime: 3000
    onVisibleChanged: {
        if(visible){
            animation1.running = true;
            timer.running = true;
        }else{}
    }

    //MenuPanel自定义定时器测试使用
    Timer {
        id: timer
        repeat: true
        interval: 6000
        running: false
        onTriggered: {
            if(timerStatus){
                //车速测试
                UiController.setLayerProperty("MenuPanel","speedValue",speedTotal);
                //发动机测试
                UiController.setLayerProperty("MenuPanel","engineSpeedValue",engineTotalSpeed);
                //蓄电池测试
                UiController.setLayerProperty("MenuPanel","batteryCurrentVolt",batteryTotalVolt);
                //动力电池电压测试
                UiController.setLayerProperty("MenuPanel","batteryPowerVolt",batteryPowerTotalVolt);
                //动力电池电流测试
                UiController.setLayerProperty("MenuPanel","batteryPowerAmpere",batteryPowerTotalAmpere);
                //档位测试
                UiController.setLayerProperty("MenuPanel","gearValue",1);
                timerStatus = false;
            }else{
                //车速测试
                UiController.setLayerProperty("MenuPanel","speedValue",0);
                //发动机测试
                UiController.setLayerProperty("MenuPanel","engineSpeedValue",0);
                //蓄电池测试
                UiController.setLayerProperty("MenuPanel","batteryCurrentVolt",0);
                //动力电池电压测试
                UiController.setLayerProperty("MenuPanel","batteryPowerVolt",0);
                //动力电池电流测试
                UiController.setLayerProperty("MenuPanel","batteryPowerAmpere",0);
                //档位测试
                UiController.setLayerProperty("MenuPanel","gearValue",0);
                timerStatus = true;
            }
        }
    }
    //前一页翻页定时器
    Timer {
        id: previous_timer
        interval: intervalTime-1000
        repeat: true
        running: false
        onTriggered: {
            if(previousTimer === previousNumber){
                if(previousNumber === 3){//仪表信息
                    animation3.running = true;
                }else if(previousNumber === 2){//设置模块
                    animation4.running = true;
                }else{
                    animation2.running = true;
                }
                previousTimer = 1;
                previous_timer.running = false;
            }else{
                previousTimer++;
                onPreviousAction();
            }
        }
    }
    //后一页翻页定时器
    Timer {
        id: next_timer
        interval: intervalTime-1000
        repeat: true
        running: false
        onTriggered: {
            if(nextTimer === nextNumber){
                if(nextNumber === 8){//仪表信息
                    animation3.running = true;
                }else if(nextNumber === 9){//设置模块
                    animation4.running = true;
                }else{
                    animation2.running = true;
                }
                nextTimer = 1;
                next_timer.running = false;
            }else{
                nextTimer++;
                onNextAction();
            }
        }
    }
    //主动画
    SequentialAnimation {
        id: animation1
        PauseAnimation { duration: 5000 }
        ScriptAction {
            script: {
                onEnterAction();
            }
        }
        ScriptAction {
            script: {
                var num = Math.ceil(Math.random()*2);
                var timerNum = Math.ceil(Math.random()*9);
                if(num === 1){
                    nextNumber = timerNum;
                    next_timer.running = true;
                }else if(num === 2){
                    previousNumber = timerNum;
                    previous_timer.running = true;
                }else{}
            }
        }
    }
    //通用返回动画
    SequentialAnimation {
        id: animation2
        ScriptAction {
            script: {
                onEnterAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                onBackAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                onBackAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                animation1.running = true;
            }
        }
    }
    //仪表信息动画
    SequentialAnimation {
        id: animation3
        ScriptAction {
            script: {
                onEnterAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                onNextAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                onNextAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                onNextAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                onBackAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                onPreviousAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                onBackAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                animation1.running = true;
            }
        }
    }
    //设置模块动画
    SequentialAnimation {
        id: animation4
        ScriptAction {
            script: {
                onEnterAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                onEnterAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                onBackAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                onNextAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                onEnterAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                onNextAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                onBackAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                onBackAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                onBackAction();
            }
        }
        PauseAnimation { duration: intervalTime }
        ScriptAction {
            script: {
                animation1.running = true;
            }
        }
    }
}
