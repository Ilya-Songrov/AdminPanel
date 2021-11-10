import QtQuick 2.15
import QtQuick.Controls 2.15


ApplicationWindow {
    id: rootWindow
    width: rectScreen.width
    height: rectScreen.height
    x: rectScreen.x
    y: rectScreen.y
    color: colorBackgroundLight
    visible: true


    readonly property color colorBackgroundLight        : "#eee9e3"
    readonly property color colorTextDark               : "#08113B"
    property real heightHeaderFooter: height / 10

    header: QmlHeader {
        id: qmlHeader
        width: parent.width
        height: rootWindow.heightHeaderFooter
    }
    SideBarAndStackWidgets{
        property int heightHeader: parent.height * 0.072

        id: sideBarAndStackWidgets
        anchors.fill: parent
        colorBackground: colorBackgroundLight

        QmlTabActions {
            property string title: qsTr("Actions")
            anchors.fill: parent

        }
        Rectangle{
            property string title: qsTr("Current orders")
            anchors.fill: parent
            color: "blue"
            opacity: 0.5
        }
        Rectangle{
            property string title: qsTr("Completed orders")
            anchors.fill: parent
            color: "green"
            opacity: 0.5
        }
        Rectangle{
            property string title: qsTr("Canceled orders")
            anchors.fill: parent
            color: "#0d2530"
        }

        Component.onCompleted: { sideBarAndStackWidgets.setActiveWidget(0); }
    }

    footer: QmlFooter {
        id: amlFooter
        width: parent.width
        height: rootWindow.heightHeaderFooter
        widthSideBar: sideBarAndStackWidgets.sideBar.width
        labelVisible: sideBarAndStackWidgets.currentWidget === 0
        onButtonComebackWasCliced: {
            console.log("ButtonComebackWasCliced");
            providerQml.emptySlot()
        }
    }
}
