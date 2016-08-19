import QtQuick 2.0

Image {
    id: root
    property bool pressed : mouseArea.pressed
    signal clicked(real xPos, real yPos)
    scale: pressed ? 0.95: 1.0
    Behavior on scale {NumberAnimation{duration: 50}}
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: root.clicked(mouse.x, mouse.y)
    }

}

