import QtQuick 2.5
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtMultimedia 5.5

import QZXing 2.3

ApplicationWindow
{
    id: window
    visible: true
    width: 640
    height: 480
    title: "BitMap"

    property int detectedTags: 0
    property string lastTag: ""

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }




    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Scan QR")
                width: parent.width
                onClicked: {
                    stackView.push("qr.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Stores")
                width: parent.width
                onClicked: {
                    stackView.push("xxx.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Map")
                width: parent.width
                onClicked: {
                    stackView.push("map.qml")
                    drawer.close()
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "qr.qml"
        anchors.fill: parent
    }
}
