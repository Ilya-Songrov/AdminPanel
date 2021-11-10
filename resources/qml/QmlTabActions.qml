import QtQml 2.15
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0


Item {
    property color colorBackground: "transparent"


    Rectangle{
        anchors.fill: parent
        color: "#0d2530"
    }

    RoundButton{
        width: parent.width * 0.5
        height: parent.height / 10
        anchors.centerIn: parent
        radius: height * 0.2
        palette.button: "lightblue"

        contentItem: Rectangle{
            anchors.fill: parent
            color: "transparent"
            radius: parent.radius

            RowLayout{
                width: parent.width
                height: parent.height
                spacing: 0
                Item {
                    property real heightIcon: parent.height * 0.7
                    Layout.maximumWidth: heightIcon
                    Layout.minimumWidth: heightIcon
                    Layout.maximumHeight: heightIcon
                    Layout.minimumHeight: heightIcon
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.leftMargin: parent.width * 0.06

                    Rectangle{
                        anchors.fill: parent
                        color: "grey"
                        radius: mask.radius
                        Image {
                            width: parent.width
                            height: width
                            anchors.horizontalCenter: parent.horizontalCenter
                            fillMode: Image.PreserveAspectFit
                            smooth: true
                            layer.enabled: true
                            layer.effect: OpacityMask {
                                maskSource: mask
                            }
                            Rectangle {
                                id: mask
                                width: parent.width
                                height: parent.height
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                radius: width * 0.5
                                visible: false
                            }
                            source: "qrc:/otherImages/otherImages/6585312_checklist_document_list_menu_icon.png"
                        }
                    }
                }
                Label{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: Math.min(parent.width, parent.height) * 0.2
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    color: colorTextDark
                    fontSizeMode: Text.Fit
                    font.pointSize: 222
                    wrapMode: Text.Wrap
                    text: "Load completed order"
                }
            }
        }
        onClicked: providerQml.buttonLoadWasClicid("Message")
    }
}
