import QtQuick 2.6

Item {
    id: complexItem
    width: 900; height: 3 //* 1000

    Grid {
        rows: 1//000
        columns: 300

        Repeater {
            model: 300 //1000

            Rectangle {
                width: 3; height: 3
                color: "orange"
                border.width: 1.0
                border.color: "white"
            }
        }
    }
}
