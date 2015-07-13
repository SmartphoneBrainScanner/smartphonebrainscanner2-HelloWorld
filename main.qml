import QtQuick 2.0
import QtQuick.Window 2.0

Window {
    visible: true
    width: 640 //width of the window
    height: 640 //height of the window

    Rectangle {
        id: page //unique id of the main object
        objectName: "rect"
        width: 640 //width of the window
        height: 640 //height of the window
        color: "black" //background color of the window
        property int value: 0 //value of one EEG channel
        property int packetCounter: 0 //used for visualizing activity

        function timeTick()
        {
            page.packetCounter = (page.packetCounter + 1)%16;
        }

        function channelValue(value_)
        {
            page.value = value_;
        }

        Text
        {
            anchors.centerIn: parent
            font.pixelSize: 60
            color: "white";
            text: page.value
        }

        Rectangle
        {
            color: "red"
            anchors.right: parent.right
            anchors.top: parent.top
            width: 50
            height: 50
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    Qt.quit();
                }
            }
        }

        Rectangle
        {
            color: "red"
            height: 33
            width: height
            opacity: page.packetCounter/16.0
        }
    }
}
