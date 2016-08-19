import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Window {
    id: root
    Component {

        id: defaultButtonStyle

        ButtonStyle {
            background: Rectangle {
                id: bgRect
                implicitWidth: 100
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 4
                gradient: Gradient {
                    GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                    GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                }
            }

            label:
                Text {
                id: itemText
                text: control.text
                clip: true
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

        }
    }

    visible: true
    height: 500
    width: 700
    Button {
        id:ghostButton
        width: 200
        height: 50
        text: qsTr("Exit")
        onClicked: Qt.quit()
        style: defaultButtonStyle
    }


}

