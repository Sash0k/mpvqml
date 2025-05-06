import QtQuick 2.6
import Sailfish.Silica 1.0
import Sailfish.Pickers 1.0
import org.meecast.mpvqml 1.0

Page {
    id: settings
    allowedOrientations: Orientation.All
    Settings {
        id: appSettings
    }

    Component.onCompleted: {
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + Theme.paddingLarge

        // Why is this necessary?
        contentWidth: parent.width

        VerticalScrollDecorator {
        }

        Column {
            id: column
            spacing: Theme.paddingLarge
            width: parent.width
            PageHeader {
                title: qsTrId("Settings")
            }
            TextSwitch {
                id: savepos
                text: qsTrId("Save position on quit")
                checked: appSettings.savePosition
                description: qsTrId("Remember current playback position on exit. When the same file is played again mpv will seek to the previous position.")
                onCheckedChanged: { appSettings.savePosition = savepos.checked }
            }
            ButtonLayout {
                Button {
                    preferredWidth: Theme.buttonWidthMedium
                    text: qsTrId("About")
                    onClicked: pageStack.push(Qt.resolvedUrl("about.qml"))
                }
            }
        }
    }
}
