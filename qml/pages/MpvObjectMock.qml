import QtQuick 2.0
import Sailfish.Silica 1.0

/** Мок для UI-элемента плеера */
Item {
    readonly property string getMpvVersion: "0.0-mock"

    signal mpvVersionIsDone(string version)
    signal onUpdate()
    signal updateTimePos(double _time)
    signal updateDuration(double _time)
    signal brightness()
    signal playbackRestart()
    signal fileLoaded()

    function command(value) {
        console.log("called command: " + value)
    }

    function setProperty(name, value) {
        console.log("called setProperty: " + name + " | " + value)
    }

    function getProperty(name) {
        console.log("called getProperty: " + name)
        return name
    }

    function set_display_brightness(value) {
        console.log("called set_display_brightness: " + value)
        return value
    }

    function get_display_brightness() {
        console.log("called get_display_brightness")
    }

    Rectangle {
        id: mock
        anchors.fill: parent
        color: "black"
    }
}
