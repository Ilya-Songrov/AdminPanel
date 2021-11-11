import QtQml 2.15
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12


Item {
    property color colorBackground: "transparent"

    Item {
        id: itemHeader
        anchors.fill: parent
        anchors.margins: Math.min(parent.width, parent.height) / 3.4

        Row {
            anchors.centerIn: parent
            spacing: parent.width * 0.01
            Item {
                width: height
                height: itemHeader.height
                Image {
                    anchors.fill: parent
                    anchors.centerIn: parent
                    source: "qrc:/otherImages/otherImages/1348652_click_cursor_finger_gesture_hand_icon.png"
                }
            }
            Label{
                height: itemHeader.height
                verticalAlignment: Qt.AlignVCenter
                horizontalAlignment: Qt.AlignLeft
                color: colorTextDark
                text: qsTr("Admin-panel")
            }
        }
    }
}
