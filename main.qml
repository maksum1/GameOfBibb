import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtMultimedia 5.8
import QtQuick.Window 2.3

ApplicationWindow {
    id: mainwindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Bibb")
    Audio {
        id: playMusic
        source: "/music.mp3"

    }

    onSceneGraphInitialized:  { playMusic.play()}


    StackView{
        id: pagestack
        anchors.fill: parent
        initialItem:Page{
            id:mainmenu
            Column
            {
                spacing: 10
                anchors.centerIn: parent
                Button
                {
                    id: playbut
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
                    id: settingbut
                    width: mainwindow.width*0.3
                    height: mainwindow.height*0.15
                    background:Rectangle {
                        radius: 64
                        opacity:
                            parent.pressed ? 0.3 : 0.1
                    }
                    text: "Setting"

                    MouseArea {
                        anchors.fill: parent;
                        onClicked:
                            ParallelAnimation {
                            NumberAnimation { target: settingbut; property: "y"; easing.type: Easing.InOutQuint; to: 1000; duration: 1000 }
                            NumberAnimation { target: playbut; property: "y"; easing.type: Easing.InOutQuint; to: 1000; duration: 1000 }
                            NumberAnimation { target: exitbut; property: "y"; easing.type: Easing.InOutQuint; to: 1000; duration: 1000 }
                            PauseAnimation { duration: 1000 }
                            NumberAnimation { target: musicswitch; property: "y"; easing.type: Easing.Linear; from: -500; to:0+musicswitch.height; duration: 1000 }
                            NumberAnimation { target: backbut; property: "y"; easing.type: Easing.Linear; from: -500; to:0+musicswitch.height+10+backbut.height;  duration: 1000 }



                        }
                        onPressed: pagestack.push(settingmenu)

                    }

                }
                Button
                {
                    id: exitbut
                    width: mainwindow.width*0.3
                    height: mainwindow.height*0.15
                    background:Rectangle {
                        radius: 64
                        opacity:
                            parent.pressed ? 0.3 : 0.1
                    }
                    onPressed: {
                        mainwindow.close()}
                    text: "Exit"

                }
            }
            background:
                AnimatedImage{
                id:galaxy1
                source:"/background.gif"
                anchors.fill: parent
            }
        }
        Page{
            id: settingmenu
            Column
            {
                spacing: 10

                anchors.centerIn:  parent



                Switch {
                    id: musicswitch
                    text:"Music"
                    checked: false
                    onPressed: {
                        if(checked == false)
                            playMusic.stop()
                        else
                            playMusic.play()
                    }

                    background:Rectangle {
                        radius: 64
                        opacity:
                            parent.pressed ? 0.3 : 0.1
                    }
                }
                Button
                {
                    id: backbut
                    width: mainwindow.width*0.15
                    height: mainwindow.height*0.075
                    background:Rectangle {
                        radius: 64
                        opacity:
                            parent.pressed ? 0.3 : 0.1

                    }
                    text: "Back"
                    MouseArea {
                        anchors.fill: parent;
                        onClicked:
                            ParallelAnimation {
                            NumberAnimation { target: settingbut; property: "y"; easing.type: Easing.InOutQuint;from: 1000; to: settingbut.y; duration: 1000 }
                            NumberAnimation { target: playbut; property: "y"; easing.type: Easing.InOutQuint; from:1000 ;to:playbut.y ; duration: 1000 }
                            NumberAnimation { target: exitbut; property: "y"; easing.type: Easing.InOutQuint; from:1000 ;to:exitbut.y ; duration: 1000 }
                            PauseAnimation { duration: 1000 }
                            NumberAnimation { target: musicswitch; property: "y"; easing.type: Easing.Linear; from:0+musicswitch.height ; to:-500; duration: 1000 }
                            NumberAnimation { target: backbut; property: "y"; easing.type: Easing.Linear; from:0+musicswitch.height+10+backbut.height; to: -500;  duration: 1000 }



                        }
                        onPressed:  pagestack.pop()}



                }


            }
            background:
                AnimatedImage{
                id:galaxy2
                source:"/background.gif"
                anchors.fill: parent
            }
        }
        pushExit:  Transition {
            PropertyAnimation {

                property: "opacity"
                easing.type: Easing.InOutQuint
                from: 1
                to: 0.8
                duration: 1000
            }
        }

        pushEnter:  Transition {
            PropertyAnimation {

                property: "opacity"
                easing.type: Easing.InOutQuint
                from: 0.8
                to: 1
                duration: 1000
            }

        }
        popExit:  Transition {
            PropertyAnimation {

                property: "opacity"
                easing.type: Easing.InOutQuint
                from: 1
                to: 0.8
                duration: 500
            }
        }

        popEnter:  Transition {
            PropertyAnimation {

                property: "opacity"
                easing.type: Easing.InOutQuint
                from: 0.8
                to: 1
                duration: 500
            }

        }





    }
}

