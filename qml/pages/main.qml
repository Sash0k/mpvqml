import QtQuick 2.2
import Sailfish.Silica 1.0
import Sailfish.Pickers 1.0

Page {
    id: mainpage
    allowedOrientations: Orientation.All
    property bool seek_slider_pressed : false

    Component.onCompleted: {
    }
    Column {
        id: column
        spacing: Theme.paddingLarge
        width: parent.width
        Image {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            source: "../images/icon.png"
            fillMode: Image.PreserveAspectFit
            width: implicitWidth / 2
            height: implicitHeight / 2
        }
        ButtonLayout {
            Button {
                preferredWidth: Theme.buttonWidthMedium
                text: qsTrId("Play file")
                icon.source: "image://theme/icon-m-file-folder"
                onClicked: pageStack.push(filePickerPage)
            }
            Button {
                preferredWidth: Theme.buttonWidthMedium
                text: qsTrId("Play URL")
                icon.source: "image://theme/icon-m-link"
            }
        }
    }

    Component {
         id: filePickerPage
         FilePickerPage {
             nameFilters: [ '*.*' ]
             onSelectedContentPropertiesChanged: {
                 pageStack.push(Qt.resolvedUrl("play.qml"), {selectedFile: selectedContentProperties.filePath})
             }
         }
     }
}
