import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtMultimedia 5.8
Window {
    id: mainwindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Bibb")
    Audio {
            id: playMusic
            source: "/menu/music.mp3"

    }

onSceneGraphInitialized:  { playMusic.play() }

    AnimatedImage
    {
        id:galaxy
        source: "/menu/background.gif"
        anchors.fill: parent
    }
    Column
    {
        spacing: 10
        anchors.centerIn: parent
        Button
        {

            width: mainwindow.width*0.3
            height: mainwindow.height*0.15
            background:Rectangle {
                radius: 64
                opacity:
                    parent.pressed ? 0.3 : 0.1
            }
            text: "Play"
        }
        Button
        {

            width: mainwindow.width*0.3
            height: mainwindow.height*0.15
            background:Rectangle {
                radius: 64
                opacity:
                    parent.pressed ? 0.3 : 0.1
            }
            text: "Setting"
        }
        Button
        {

            width: mainwindow.width*0.3
            height: mainwindow.height*0.15
            background:Rectangle {
                radius: 64
                opacity:
                    parent.pressed ? 0.3 : 0.1
            }
            text: "Exit"
        }
    }
}
