import QtQml 2.15
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

Item {
    signal buttonComebackWasCliced()
    property real widthSideBar: parent.width / 4
    property bool labelVisible: false

    RowLayout{
        width: parent.width
        height: parent.height
        spacing: 0
        Item {
            Layout.maximumWidth: widthSideBar
            Layout.minimumWidth: widthSideBar
            Layout.fillWidth: true
            Layout.fillHeight: true
            RoundButton {
                width: parent.width * 0.9
                height: parent.height / 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                text: "Comeback"
                radius: Math.min(width, height) * 0.2
                palette.button: "grey"
                onClicked: buttonComebackWasCliced()
            }
        }
        Label{
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignHCenter
            color: "red"
            text: "Attention! All cells are occupied"
            visible: labelVisible
        }
    }

}
