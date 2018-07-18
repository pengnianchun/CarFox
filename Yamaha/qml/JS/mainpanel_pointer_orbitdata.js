
function initializeMainPanelPointerOrbitData() {
    var array = new Array;
    var baseX=0, baseY=0;
    var deltaX=0, deltaY=0;
    var stepCount=0;
    for(var i=0; i<240; i++) {
        if(i>=0 && i<40) {
            baseX = 70; baseY = 474;
            deltaX = -1.025; deltaY = -2.325;
        } else if(i>=40 && i<80) {
            baseX = 29; baseY = 381;
            deltaX = -0.325; deltaY = -2.25;
        } else if(i>=80 && i<120) {
            baseX = 16; baseY = 291;
            deltaX = 0.1; deltaY = 2.2;
        } else if(i>=120 && i<160) {
            baseX = 20; baseY = 203;
            deltaX = 1.6; deltaY = -2.525;
        } else if(i>=160 && i<200) {
            baseX = 84; baseY = 102;
            deltaX = 4.05; deltaY = -1.375;
        } else if(i>=200 && i<240) {
            baseX = 246; baseY = 47;
            deltaX = 3.375; deltaY = -0.225;
        }

        if(i%40 == 0) {
            stepCount = 0;
        }
        array.push([baseX+stepCount*deltaX, baseY+stepCount*deltaY]);
        stepCount++;
    }
    return array;
}
