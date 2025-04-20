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

            Component.onCompleted: {
                showStatusbar = true
            }

            MpvObject {
                id: renderer
                anchors.fill: parent
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (showStatusbar){
                            showStatusbar = false
                        }else{
                            showStatusbar = true
                        }
                    }
                }
            }

            Row{ 
                anchors.bottom: parent.bottom
                width: parent.width
                visible: showStatusbar
                Button {
                    anchors.bottom: parent.bottom
                    id: play_button
                    visible: false
                    //anchors.centerIn: parent
                    text: "Pause"
                    onClicked: {
                        renderer.command(["cycle", "pause"])
                        if (play_button.text == "Pause"){
                            play_button.text = "Play"
                            //renderer.command(["cycle", "pause"])
                        }else{
                            play_button.text = "Pause"
                        }
                    }
                }

                Button {
                    anchors.bottom: parent.bottom
                    id: file_button
                    //anchors.centerIn: parent
                    text: "File"
                    onClicked: pageStack.push(filePickerPage)
                }
            }

            Component {
                 id: filePickerPage
                 FilePickerPage {
                     nameFilters: [ '*.*' ]
                     onSelectedContentPropertiesChanged: {
                         page.selectedFile = selectedContentProperties.filePath
                         renderer.command(["loadfile", selectedFile])
                         showStatusbar = false
                         play_button.visible = true
                     }
                 }
             }
        }
    }
}
