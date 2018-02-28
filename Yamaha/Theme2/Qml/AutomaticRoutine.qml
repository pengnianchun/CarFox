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
    onVisibleChanged: {
        if(visible){
            animation1.running = true;
        }else{}
    }
    //前一页翻页定时器
    Timer {
        id: previous_timer
        interval: 2000
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
        interval: 2000
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
        //running: true
        //loops: Animation.Infinite
        PauseAnimation { duration: 3000 }
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
        PauseAnimation { duration: 3000 }
        ScriptAction {
            script: {
                onBackAction();
            }
        }
        PauseAnimation { duration: 3000 }
        ScriptAction {
            script: {
                onBackAction();
            }
        }
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
        PauseAnimation { duration: 3000 }
        ScriptAction {
            script: {
                onNextAction();
            }
        }
        PauseAnimation { duration: 2000 }
        ScriptAction {
            script: {
                onNextAction();
            }
        }
        PauseAnimation { duration: 2000 }
        ScriptAction {
            script: {
                onNextAction();
            }
        }
        PauseAnimation { duration: 2000 }
        ScriptAction {
            script: {
                onBackAction();
            }
        }
        PauseAnimation { duration: 2000 }
        ScriptAction {
            script: {
                onPreviousAction();
            }
        }
        PauseAnimation { duration: 3000 }
        ScriptAction {
            script: {
                onBackAction();
            }
        }
        PauseAnimation { duration: 3000 }
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
        PauseAnimation { duration: 3000 }
        ScriptAction {
            script: {
                onEnterAction();
            }
        }
        PauseAnimation { duration: 2000 }
        ScriptAction {
            script: {
                onBackAction();
            }
        }
        PauseAnimation { duration: 2000 }
        ScriptAction {
            script: {
                onNextAction();
            }
        }
        PauseAnimation { duration: 2000 }
        ScriptAction {
            script: {
                onEnterAction();
            }
        }
        PauseAnimation { duration: 2000 }
        ScriptAction {
            script: {
                onNextAction();
            }
        }
        PauseAnimation { duration: 2000 }
        ScriptAction {
            script: {
                onBackAction();
            }
        }
        PauseAnimation { duration: 2000 }
        ScriptAction {
            script: {
                onBackAction();
            }
        }
        PauseAnimation { duration: 3000 }
        ScriptAction {
            script: {
                onBackAction();
            }
        }
        PauseAnimation { duration: 3000 }
        ScriptAction {
            script: {
                animation1.running = true;
            }
        }
    }
}
