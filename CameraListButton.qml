import QtQuick 2.5
import "content/popup"

Rectangle {
    id: root
    width: 144
    height: 70
    visible: model.length > 0
    color: "transparent"

    property alias value: cameraList.currentValue
    property alias model: cameraList.model

    MouseArea {
        id: listViewButtonArea
        anchors.fill: parent
        onClicked: cameraList.toggle()
    }

    PopupList {
        id: cameraList
        anchors.fill: parent
        visible: opacity > 0
        color: "transparent"

        currentValue: root.value
        onSelected: cameraList.toggle()

        model: root.model
        highlight: Rectangle {
                        border.color: "#000000";
                        border.width: 1;
                        color: /* skyblue */ "#00BFFF";
                        radius: 5;
                    }
        delegate: Item {
                    width: 200
                    height: 30

                    Text {
                        text: modelData.displayName

                        anchors.fill: parent
                        anchors.margins: 5
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                        color: "white"
                        font.bold: true
                        style: Text.Raised
                        styleColor: "black"
                        font.pixelSize: 14
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            cameraList.currentIndex = index
                            cameraList.currentValue = modelData.deviceId
                            cameraList.selected(modelData.deviceId)
                        }
                    }
                }
    }
}
