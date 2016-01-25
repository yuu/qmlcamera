import QtQuick 2.0

Popup {
    id: popupList

    property alias model : view.model
    property alias delegate: view.delegate
    property alias currentIndex: view.currentIndex
    property alias highlight: view.highlight
    property variant currentValue
    property variant currentItem : model[view.currentIndex]

    signal selected

    ListView {
        id: view
        anchors.fill: parent
        anchors.margins: 5
        snapMode: ListView.SnapOneItem
        highlightFollowsCurrentItem: true
        currentIndex: 0
    }
}
