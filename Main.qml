import QtQuick
import QtQuick.Controls

Window {
    id: root

    width: 720
    height: 520
    visible: true
    title: qsTr("Temperature Control")

    property color temperatureColor:
        tempObject.tempValue < 8
            ? "#4DA3FF"
            : tempObject.tempValue > 35
                ? "#FF5C5C"
                : "#42D392"

    Rectangle {
        anchors.fill: parent

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#111827" }
            GradientStop { position: 1.0; color: "#1F2937" }
        }

        Column {
            anchors.centerIn: parent
            width: parent.width * 0.82
            spacing: 25

            // -------------------------------------------------
            // TITLE
            // -------------------------------------------------

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "TEMPERATURE CONTROL"
                color: "#94A3B8"
                font.pixelSize: 16
                font.bold: true
                font.letterSpacing: 2
            }

            // -------------------------------------------------
            // TEMPERATURE DISPLAY
            // -------------------------------------------------

            Rectangle {
                width: 260
                height: 260
                radius: width / 2

                anchors.horizontalCenter: parent.horizontalCenter

                color: "#172033"
                border.width: 8
                border.color: root.temperatureColor

                // Glow
                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 10
                    radius: width / 2
                    color: "transparent"
                    border.width: 2
                    border.color: Qt.alpha(root.temperatureColor, 0.25)
                }

                Column {
                    anchors.centerIn: parent
                    spacing: 5

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: tempObject.tempValue
                        color: root.temperatureColor
                        font.pixelSize: 67
                        font.bold: true
                    }

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        rightPadding: 12
                        text: "°C"
                        color: "#CBD5E1"
                        font.pixelSize: 23
                        font.bold: true
                    }

                    Rectangle {
                        anchors.horizontalCenter: parent.horizontalCenter

                        width: 110
                        height: 28
                        radius: 14

                        color: Qt.alpha(root.temperatureColor, 0.15)

                        Text {
                            anchors.centerIn: parent

                            text:
                                tempObject.tempValue <= 7
                                    ? "COLD"
                                    : tempObject.tempValue >= 36
                                        ? "HOT"
                                        : "COMFORT"

                            color: root.temperatureColor
                            font.pixelSize: 12
                            font.bold: true
                        }
                    }
                }
            }

            // -------------------------------------------------
            // TEMPERATURE BAR
            // -------------------------------------------------

            Rectangle {
                width: parent.width
                height: 12
                radius: 6

                color: "#374151"

                Rectangle {
                    width: Math.max(0,Math.min(parent.width,(tempObject.tempValue + 10) / 50 * parent.width))

                    height: parent.height
                    radius: 6

                    color: root.temperatureColor

                    Behavior on width {
                        NumberAnimation {
                            duration: 200
                        }
                    }

                    Behavior on color {
                        ColorAnimation {
                            duration: 200
                        }
                    }
                }
            }

            // -------------------------------------------------
            // + / - CONTROLS
            // -------------------------------------------------

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 25

                Button {
                    width: 75
                    height: 55

                    text: "−"

                    font.pixelSize: 30

                    onClicked: {
                        tempObject.decrease_Value()
                    }

                    background: Rectangle {
                        radius: 15
                        color: parent.down ? "#374151" : "#273449"
                        border.color: "#475569"
                    }

                    contentItem: Text {
                        text: parent.text

                        color: "white"
                        font: parent.font

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                Button {
                    width: 75
                    height: 55

                    text: "+"

                    font.pixelSize: 30

                    onClicked: {
                        tempObject.increase_Value()
                    }

                    background: Rectangle {
                        radius: 15
                        color: parent.down ? "#374151" : "#273449"
                        border.color: "#475569"
                    }

                    contentItem: Text {
                        text: parent.text

                        color: "white"
                        font: parent.font

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }

            // -------------------------------------------------
            // PRESETS
            // -------------------------------------------------

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 12

                Button {
                    width: 135
                    height: 48

                    text: "❄  COLD"

                    onClicked: {
                        tempObject.tempValue = 7
                    }

                    background: Rectangle {
                        radius: 14
                        color: parent.down ? "#1E3A8A" : "#172554"
                        border.color: "#3B82F6"
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "#93C5FD"
                        font.bold: true
                        font.pixelSize: 14

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }



                Button {
                    width: 135
                    height: 48

                    text: "⚡  ECO"

                    onClicked: {
                        tempObject.tempValue = 18
                    }

                    background: Rectangle {
                        radius: 14
                        color: parent.down ? "#14532D" : "#163522"
                        border.color: "#22C55E"
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "#86EFAC"
                        font.bold: true
                        font.pixelSize: 14

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }


                Button {
                    width: 135
                    height: 48

                    text: "  HOT"

                    onClicked: {
                        tempObject.tempValue = 36
                    }

                    background: Rectangle {
                        radius: 14
                        color: parent.down ? "#7F1D1D" : "#3F1D1D"
                        border.color: "#EF4444"
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "#FCA5A5"
                        font.bold: true
                        font.pixelSize: 14

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }


            }
        }
    }
}
