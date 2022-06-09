import QtQuick 2.0
import QtQuick.Controls 2.14

TextField {
    id: textAreaContent
    font.pointSize: fontNormal
    font.family: fontFamily
    verticalAlignment: Text.AlignVCenter
//    placeholderText: qsTr("Content")
    placeholderText: ""
    wrapMode: TextEdit.WrapAnywhere
    selectByMouse: true
//    background: Rectangle {
//       implicitWidth: 100
//       implicitHeight: 25
//       color: textAreaContent.enabled ? "white" : "lightgrey"
//       border.color: "grey"
//    }
    implicitHeight: 25
    property var iHeight: 0
    property var perHeight: 0

    onContentHeightChanged: {
        if (perHeight === 0)
        {
            perHeight = contentHeight
        }
        else
        {
            if (contentHeight / perHeight > 15)
                return

            if (contentHeight > 0)
            {
                iHeight = (contentHeight / perHeight - 1) * 25
            }
            if (contentHeight / perHeight > 4)
            {
                iHeight = iHeight - iHeight / 4
            }
        }
    }
}
