import QtQuick 2.15
import QtQuick.Controls 2.15

Item {

    default property alias content: stack.children // if you delete this line, this qml does not work correct
    property alias stackAlias: stack
    property alias sideBar: listSideBar
    property color colorBackground: "transparent"
    property var listNameWidgets: getModel()
    property int currentWidget: 0


    function setActiveWidget(numWidget){
        currentWidget = numWidget
        listSideBar.currentIndex = currentWidget
        setOpacities(currentWidget)
    }

    function setOpacities(numWidget) {
        let childrenOfStack = stackAlias.children
        for (var i = 0; i < childrenOfStack.length; ++i) {
            childrenOfStack[i].visible = (i === numWidget ? true : false)
        }
    }
    function getModel(){
        let model = []
        let childrenOfStack = stackAlias.children
        for (var index = 0; index < childrenOfStack.length; ++index) {
            let child = childrenOfStack[index]
            model.push(child.title)
        }
        return model
    }

    ListView {
        id: listSideBar
        width: parent.width / 3.5
        height: parent.height
        anchors.left: parent.left
        spacing: height * 0.012
        clip: true

        headerPositioning: ListView.OverlayHeader
        header: Rectangle {
            id: header
            z: 2
            width: parent.width
            height: 1
            color: colorBackground
            MenuSeparator {
                parent: header
                width: parent.width
                anchors.verticalCenter: parent.bottom
                visible: !listSideBar.atYBeginning
                contentItem: Rectangle {
                    implicitWidth: parent.width
                    implicitHeight: 1
                    color: "black"
                }
            }
        }
        model: listNameWidgets
        delegate: ItemDelegate {
            id: itemDelegateRoot
            width: parent.width
            height: delegateHeight

            property real delegateHeight: ListView.view.height / 10
            property real maxPixelSizeText: 222

            Item {
                width: parent.width
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                Rectangle{
                    anchors.fill: parent
                    color: Qt.darker(colorBackground, 1.15)
                    visible: currentWidget === index
                }
                Text {
                    id: textDelegate
                    anchors.fill: parent
                    anchors.margins: Math.min(parent.width, parent.height) * 0.248
                    leftPadding: width * 0.03
                    horizontalAlignment: Qt.AlignLeft
                    verticalAlignment: Qt.AlignVCenter
                    wrapMode: Text.WordWrap
                    fontSizeMode: Text.Fit
                    font.weight: Font.DemiBold
                    color: colorTextDark
                    text: modelData
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: setActiveWidget(index)
                }
                Component.onCompleted: {
                    if(textDelegate.font.pixelSize < itemDelegateRoot.maxPixelSizeText){
                        itemDelegateRoot.maxPixelSizeText = textDelegate.font.pixelSize
                    }
                }
            }
        }

        footerPositioning: ListView.OverlayFooter
        footer: Rectangle {
            id: footer
            z: 1111
            width: parent.width
            height: 1
            color: colorBackground

            MenuSeparator {
                parent: footer
                width: parent.width
                anchors.verticalCenter: parent.top
                visible: !listSideBar.atYEnd
                contentItem: Rectangle {
                    implicitWidth: parent.width
                    implicitHeight: 1
                    color: "black"
                }
            }
        }
        ScrollIndicator.vertical: ScrollIndicator {}
    }

    Item {
        id: stack
        width: parent.width
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: sideBar.right
    }
}
