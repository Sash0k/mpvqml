import QtQuick 2.2
import Sailfish.Silica 1.0
import Sailfish.Pickers 1.0

import mpvobject 1.0

ApplicationWindow {
    initialPage: Component {
        Page {
            id: page
            allowedOrientations: Orientation.All
            property string selectedFile
            property bool showStatusbar
            property double duration_time

            Component.onCompleted: {
                showStatusbar = true
            }

            function convert_time_to_string(_time){
                var hours = 0
                var minutes = 0
                var seconds = 0
                hours = parseInt(_time/(60*60));
                minutes = parseInt((_time-(hours*60*60))/(60));
                seconds = parseInt((_time-(minutes*60)-(hours*60*60)));
                if (hours == 0){
                    var result = ("0" + minutes).slice(-2) + ":" + ("0" + seconds).slice(-2) 
                }else{
                    var result = ("0" + hours).slice(-2) + ":" + ("0" + minutes).slice(-2) + ":" + ("0" + seconds).slice(-2) 
                }
                return result
            }
            MpvObject {
                id: renderer
                anchors.fill: parent
                onUpdateTimePos: {
                    if (!fadeRect.folded){
                        timeprogressbar.value = _time
                        time_pos.text = convert_time_to_string(_time)
                    }
                }
                onUpdateDuration: {
                    duration_time = _time
                    //duration.text = new Date(duration_time*1000).toLocaleTimeString(Qt.locale(), "hh:" + "mm:" + "ss" ) 
                    duration.text = convert_time_to_string(_time)
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (fadeRect.folded){
                            fadeRect.folded = false
                        }else{
                            fadeRect.folded = true
                        }
                    }
                }
            }
            Label {
                id: label_prompt
                anchors.centerIn: parent
                text: "Click on the menu to select a video file"
            }
            Rectangle {
                id: fadeRect
                anchors.bottom: parent.bottom
                width: parent.width
                height: 2*Theme.itemSizeSmall
                property bool folded: false
                color: "transparent"
                Column{
                    id: main_column
                    height: buttons_row.height
                    width: parent.width
                    anchors.bottom: parent.bottom
                    Rectangle{
                        height: Theme.itemSizeSmall
                        //spacing: 10
                        width: parent.width
                        id: timerow
                        visible: false
                        color: "transparent"
                        Label {
                            id: time_pos
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            height: Theme.itemSizeSmall
                            text: ""
                        }
                        ProgressBar {
                            id: timeprogressbar
                            minimumValue: 0
                            maximumValue: duration_time
                            anchors.left: time_pos.right
                            anchors.right: duration.left
                            value: 0
                        }
                        Label {
                           id: duration
                           anchors.bottom: parent.bottom
                           anchors.right: parent.right
                           height: Theme.itemSizeSmall
                           text: ""
                        }
                    }
                    Row{ 
                        width: parent.width
                        visible: true 
                        spacing: 10
                        height: Theme.itemSizeSmall
                        id: buttons_row
                        Button {
                            anchors.bottom: parent.bottom
                            id: play_button
                            width: play_button.height
                            height: Theme.itemSizeSmall
                            visible: false
                            text: "\u23F8"
                            onClicked: {
                                renderer.command(["cycle", "pause"])
                                if (play_button.text == "\u23F8"){
                                    play_button.text = "\u25B6"
                                }else{
                                    play_button.text = "\u23F8"
                                    fadeRect.folded = !fadeRect.folded
                                }
                            }
                        }
                        Button {
                            anchors.bottom: parent.bottom
                            height: Theme.itemSizeSmall
                            width: file_button.height
                            anchors.right: parent.right
                            id: file_button
                            text: "\u2630"
                            onClicked: {
                                pageStack.push(filePickerPage)
                                anim_file_button.running = false
                            }
                            SequentialAnimation on opacity {
                                id: anim_file_button
                                running: true
                                loops: Animation.Infinite
                                NumberAnimation { from: 0; to: 1; duration: 2000 }
                                NumberAnimation { from: 1; to: 0; duration: 2000 }
                            } 
                        }
                    }
                }
                state: !folded ? "Visible" : "Invisible"
                states: [
                    State{
                        name: "Visible"
                        PropertyChanges{target: fadeRect; opacity: 1.0}
                        PropertyChanges{target: fadeRect; visible: true}
                    },
                    State{
                        name:"Invisible"
                        PropertyChanges{target: fadeRect; opacity: 0.0}
                        PropertyChanges{target: fadeRect; visible: false}
                    }
                ]
                transitions: [
                    Transition {
                        from: "Visible"
                        to: "Invisible"

                        SequentialAnimation{
                            NumberAnimation {
                                target: fadeRect
                                property: "opacity"
                                duration: 500
                                easing.type: Easing.InOutQuad
                            }
                            NumberAnimation {
                                target: fadeRect
                                property: "visible"
                                duration: 0
                            }
                        }
                    },

                    Transition {
                        from: "Invisible"
                        to: "Visible"
                        SequentialAnimation{
                            NumberAnimation {
                                target: fadeRect
                                property: "visible"
                                duration: 0
                            }
                            NumberAnimation {
                                target: fadeRect
                                property: "opacity"
                                duration: 500
                                easing.type: Easing.InOutQuad
                            }
                        }
                    }
                ]
            }

            Component {
                 id: filePickerPage
                 FilePickerPage {
                     nameFilters: [ '*.*' ]
                     onSelectedContentPropertiesChanged: {
                         page.selectedFile = selectedContentProperties.filePath
                         renderer.command(["loadfile", selectedFile])
                         label_prompt.visible = false
                         fadeRect.folded = true
                         play_button.visible = true
                         timerow.visible = true
                         main_column.height = timerow.height + buttons_row.height
                     }
                 }
             }
        }
    }
}
