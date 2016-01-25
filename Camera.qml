import QtQuick 2.5
import QtMultimedia 5.5

Item {
    id: root
    width: 1280
    height: 800

    Camera {
        id: camera
    }

    VideoOutput {
        source: camera
        anchors.fill: parent
    }

    CameraListButton {
        id: cameraList
        x: 0
        y: 0
        width: 1280
        height: 800
        model: QtMultimedia.availableCameras
        onValueChanged: camera.deviceId = value
    }

    MouseArea {
        id: rootArea
        anchors.fill: parent
        onClicked: {
            cameraList.x = mouseX;
            cameraList.y = mouseY;
            cameraList.toggle();
        }
    }
}
