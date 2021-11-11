import QtQml 2.15
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

Item {
    signal buttonComebackWasClicked()
    property real widthSideBar: parent.width / 4
    property bool labelTextVisible: false

    RowLayout{
        width: parent.width
        height: parent.height
        spacing: -1
        Item {
            Layout.maximumWidth: widthSideBar
            Layout.minimumWidth: widthSideBar
            Layout.fillWidth: true
            Layout.fillHeight: true
            RoundButton {
                width: parent.width * 0.9
                height: parent.height / 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                radius: Math.min(width, height) * 0.2
                palette.button: "#b0aba5"
                text: qsTr("Comeback")
                onClicked: buttonComebackWasClicked()
            }
        }
        Label{
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignHCenter
            color: "#c72624"
            font.bold: true
            text: labelTextVisible ? qsTr("Attention! All cells are occupied") : ""
            background: Rectangle{
                anchors.fill: parent
                color: "#d0cbc5"
            }
        }
    }
}
