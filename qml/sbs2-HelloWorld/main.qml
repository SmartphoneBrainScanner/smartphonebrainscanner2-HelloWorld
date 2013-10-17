import QtQuick 1.0

Rectangle {
    id: page //unique id of the main object
    width: 640 //width of the window
    height: 640 //height of the window
    color: "black" //background color of the window
    property int value: 0 //value of one EEG channel
    property int packetCounter: 0 //used for visualizing activity

    /**
      Function receiving time ticks from C++ code.
      */
    function timeTick()
    {
	page.packetCounter = (page.packetCounter + 1)%16;
    }

    function channelValue(value_)
    {
	page.value = value_;
    }



    Rectangle
    {
        //quit button
        color: "red"
        anchors.right: parent.right
        anchors.top: parent.top
        width: 50
        height: 50
        Text
        {
            anchors.centerIn: parent
            font.pixelSize: 40
            color: "white";
            text: "X"
        }
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
        anchors.centerIn: parent
        height: 400
        width: 200
        color: "transparent"


        Text
        {
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 100
            color: "white";
            text: "Hello World"
        }
        Text
        {
            anchors.centerIn: parent
            font.pixelSize: 24
            color: "white";
            text: "You can  now receive your first EEG signal!"
        }
        Text
        {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 120
            color: "white";
            text: page.value
        }

        Rectangle
        {
            //activity visualization
            color: "red"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            height: 33
            width: height
            opacity: page.packetCounter/16.0
        }
    }

}
