import QtQuick 2.0

Row {
	id: digitValue

	property int value: 0
	property int num3: 0
	property int num2: 0
	property int num1: 0
	property int showNum: 1

	property bool completed: false

	property var imageSource: new Array
    	property string icon0: ""
    	property string icon1: ""
   	property string icon2: ""
    	property string icon3: ""
    	property string icon4: ""
    	property string icon5: ""
    	property string icon6: ""
    	property string icon7: ""
    	property string icon8: ""
    	property string icon9: ""

	onValueChanged: {
		num3 = (value % 1000) / 100;
		num2 = (value % 100) / 10;
		num1 = value % 10;
	}

	Image {
		id: num3Image
		visible: showNum >= 3 ? true :((num3 ==0) ? false : true)
		source: completed ? digitValue.imageSource[num3] : ""
	}
	Image {
		id: num2Image
		visible: showNum >= 2 ? true :(num3 ==0 && num2 ==0) ? false : true
		source: completed ? digitValue.imageSource[num2] : ""
	}
	Image {
		id: num1Image
		source: completed ? digitValue.imageSource[num1] : ""
	}

	Component.onCompleted: {
		if (!completed) {
			imageSource[0] = icon0;
			imageSource[1] = icon1;
			imageSource[2] = icon2;
			imageSource[3] = icon3;
			imageSource[4] = icon4;
			imageSource[5] = icon5;
			imageSource[6] = icon6;
			imageSource[7] = icon7;
			imageSource[8] = icon8;
			imageSource[9] = icon9;
			completed = true;
		}
	}
}
