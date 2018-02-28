/*
This program displays content of the /proc/cpuinfo file


Copyright (C) <2016>  <Sergey Tsybanov>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4


ColumnLayout{
    spacing: 2

    Label {
        text: "CPU INFO"
        font.pixelSize: 30
        font.italic: true
        color: "steelblue"
        horizontalAlignment: Text.AlignHCenter
        width: 1000
        Layout.fillWidth: true
    }

    ListView
    {
        id: list
        width: 1000
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

            GridLayout {
                id: layout
                columns: 3
                rows: 1
                anchors.fill: parent
                anchors.margins: 5

                Rectangle
                {
                    id: rectImage
                    //x:10
                    Layout.row: 1
                    Layout.column: 1
                    Layout.preferredWidth: 20
                    Layout.preferredHeight: 20
                    Layout.minimumWidth: 20
                    Layout.fillWidth: false
                    Layout.fillHeight: false
                    color: "transparent"
                    /*
                    Layout.fillWidth: true
                    Layout.minimumWidth: 20
                    Layout.preferredWidth: 20
                    Layout.maximumWidth: 20
                    Layout.minimumHeight: 20
                    color: "transparent"
                    */

                    Image {
                       id: image
                       anchors.fill: parent
                       anchors.horizontalCenter: parent.horizontalCenter
                       source: "romb.png"
                       sourceSize.width: 20
                       sourceSize.height: 20
                    }
                }

                Rectangle
                {
                    Layout.row: 1
                    Layout.column: 2
                    Layout.minimumWidth: list.width / 2 -20 - 50
                    Layout.preferredWidth: list.width / 2 -20 - 50
                    /*
                    Layout.fillWidth: true
                    Layout.minimumWidth: list.width / 2 -20 - 50
                    Layout.preferredWidth: list.width / 2 -20 - 50
                    Layout.maximumWidth: list.width / 2 -20 - 50
                    Layout.minimumHeight: list.width / 2 -20 - 50
                    */

                    Text
                    {
                        text: type;
                        anchors.fill:parent
                        anchors.horizontalCenter: parent.horizontalCenter
                        wrapMode: Text.WordWrap
                        font.pixelSize: 17
                    }
                }

                Rectangle
                {
                    Layout.row: 1
                    Layout.column: 3
                    Layout.minimumWidth: list.width / 2 -20 - 50
                    Layout.preferredWidth: list.width / 2 -20 - 50
                    /*
                    Layout.fillWidth: true
                    Layout.minimumWidth: list.width / 2 -20 - 50
                    Layout.preferredWidth: list.width / 2 -20 - 50
                    Layout.maximumWidth: list.width / 2 -20 - 50
                    Layout.minimumHeight: list.width / 2 -20 - 50
                    */

                    Text
                        {
                            text: value;
                            anchors.fill: parent
                            anchors.horizontalCenter: parent.horizontalCenter
                            wrapMode: Text.WordWrap
                            font.pixelSize: 14
                        }
                    }
            }
        }
    }
}
