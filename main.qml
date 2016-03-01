import QtQuick 2.4
import QtQuick.Window 2.2

ListView
{
    id: list
    width: 1000
    anchors.fill: parent
    height: 1000

    model: myModel
    delegate: Rectangle {
        width: parent.width
        height:
        {
            if( myHeight )
                parent.height / myHeight
            else
                50
        }
        color: "lightsteelblue"
        border.color: "white"
        border.width: 1
        radius: 3

        Text
        {
            text: modelData
            anchors.verticalCenter: parent.verticalCenter
            width: list.width
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignLeft
            wrapMode: Text.WordWrap
        }
    }
}
