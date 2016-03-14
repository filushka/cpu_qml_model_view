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
