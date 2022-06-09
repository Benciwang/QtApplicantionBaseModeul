import QtQuick 2.0
import QtQuick.Controls 2.14

Button {
    id: btn
    width: 60
    height: 20
    property color bkColor: "transparent"
    property color hoverColor: "#EBEBEB"
    property color pressColor: "#CDC9C9"
    property color borderColor: "#a1a3a6"

    background: Rectangle {
        id: rectbgColor
        implicitHeight: 20
        implicitWidth: 60
        border.color: borderColor
//        border.width: control.activeFocus ? 2 : 0
        color: bkColor
        radius: 3
    }
    icon.color: "transparent"

    font.family: fontFamily
    font.pointSize: fontNormal

//    contentItem: Text {
//              text: btn.text
//              font.family: fontFamily
//              font.pointSize: fontNormal
//              opacity: enabled ? 1.0 : 0.3
//              horizontalAlignment: Text.AlignHCenter
//              verticalAlignment: btn.display === AbstractButton.TextUnderIcon ? Text.AlignBottom : Text.AlignVCenter
//              elide: Text.ElideRight
//    }

    onPressed: {
        rectbgColor.color = pressColor
        btn.scale = 1
    }
    onReleased: {
        if (hovered)
        {
            rectbgColor.color = hoverColor
            btn.scale = 1.1
        }
        else
        {
            rectbgColor.color = bkColor
            btn.scale = 1
        }
    }

    onHoveredChanged: {
        if (hovered)
        {
            rectbgColor.color = hoverColor
            btn.scale = 1.1
        }
        else
        {
            rectbgColor.color = bkColor
            btn.scale = 1
        }
    }
}
