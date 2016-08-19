import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Window {
    id: root

    visible: true
    height: 480
    width: 800
    Rectangle {
        color: "#0AA"
        id: trackInfo
        x: 0
        y: 0
        width: parent.width/3*2
        height: parent.height-buttonRow.height
    }
    Rectangle {
        id: trackList
        color: "#AAA"
        height: trackInfo.height
        anchors.left: trackInfo.right
        anchors.right: parent.right

        ListModel {
            id: playlistModel
            ListElement {
                artist: "New Model Army"
                track: " Vengeance"
            }
            ListElement {
                artist: "The Weakerthans"
                track: " Left and Leaving"
            }
            ListElement {
                artist: "New Model Army"
                track: " The Hunt"
            }
            ListElement {
                artist: "Rush"
                track: " The Trees"
            }
            ListElement {
                artist: "Kate Bush"
                track: " Army Dreamers"
            }
            ListElement {
                artist: "New Model Army"
                track: " Vengeance"
            }
            ListElement {
                artist: "The Weakerthans"
                track: " Left and Leaving"
            }
            ListElement {
                artist: "New Model Army"
                track: " The Hunt"
            }
            ListElement {
                artist: "Rush"
                track: " The Trees"
            }
            ListElement {
                artist: "Kate Bush"
                track: " Army Dreamers"
            }
        }

        Component {
            id: trackDelegate
            Item {
                id:wrapper
                width: parent.width
                height:20
                Row {
                    Text {text: index+1; font.pixelSize: 15; font.bold: true}
                    Text {text: artist; font.pixelSize: 15; font.bold: true}
                    Text {text: track; font.pixelSize: 20; font.italic: true}
                }
                states: State {
                    name: "Current"
                    when: wrapper.ListView.isCurrentItem
                    PropertyChanges { target: wrapper; x:15}
                }
                transitions: Transition {
                    SpringAnimation { properties: "x"; spring: 4; damping: 0.2}
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked:{wrapper.ListView.view.currentIndex = index; console.log("click")}
                }
            }
        }

        ListView {
            id:trackListView
            anchors.fill: parent
            keyNavigationWraps: false
            preferredHighlightEnd: 2
            spacing: 5
            model: playlistModel
            delegate: trackDelegate
            snapMode: ListView.SnapToItem
            highlight: Rectangle
            {
                color:"black"
                radius: 5
                opacity: 0.3
                focus: true
                width: trackListView.currentItem.width
                height: trackListView.currentItem.height
                y: trackListView.currentItem.y;
                Behavior on y { SpringAnimation { spring: 4; damping: 0.2} }
            }
            highlightFollowsCurrentItem: false

        }

    }

    Button {
        id:ghostButton
        height: 50
        text: qsTr("Exit")
        onClicked: Qt.quit()
        style: DefaultButtonStyle{}
        focus:true
    }

    Rectangle{
        color:"#000"
        x:0
        y:trackInfo.height
        width: parent.width
        height: buttonRow.height
    }

    Row {
        id: buttonRow
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: trackInfo.bottom
        ImageButton {
            id: eject
            source: "qrc:/images/media-eject-4.png"
            onClicked: console.log("eject", xPos, yPos)
        }

      ImageButton {
            id: record
            source: "qrc:/images/media-record-4.png"
            onClicked: console.log("record", xPos, yPos)
        }

        ImageButton {
            id: skipBackward
            source: "qrc:/images/media-skip-backward-4.png"
            onClicked: console.log("skip-backward", xPos, yPos)
        }

        ImageButton {
            id: seekBackward
            source: "qrc:/images/media-seek-backward-4.png"
            onClicked: console.log("seek-backward", xPos, yPos)
        }
        ImageButton {
            property bool playing : false
            id: playPause
            source: playing ? "qrc:/images/media-playback-pause-4.png" : "qrc:/images/media-playback-start-4.png"
            onClicked: {
                playing = playing ? false : true;
                console.log("playback-pause", playing, xPos, yPos)
            }
        }

        ImageButton {
            id: stop
            source: "qrc:/images/media-playback-stop-4.png"
            onClicked: console.log("playback-stop", xPos, yPos)
        }
        ImageButton {
            id: seekForward
            source: "qrc:/images/media-seek-forward-4.png"
            onClicked: console.log("seek-forward", xPos, yPos)
        }

        ImageButton {
            id: skipForward
            source: "qrc:/images/media-skip-forward-4.png"
            onClicked: console.log("skip-forward", xPos, yPos)
        }

    }
}
