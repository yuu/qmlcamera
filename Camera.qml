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
        anchors.fill: parent

        model: QtMultimedia.availableCameras
        onValueChanged: camera.deviceId = value
    }
}
