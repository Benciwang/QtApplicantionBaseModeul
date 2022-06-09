import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.12
import Ui_proxy 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property int allwgt_height: 25
    property int allwgt_width: 90
    //font defined
    property var fontNormal: 8
    property var fontTitle: 10
    property var fontFamily: "Microsoft YaHei"
    Ui_proxy {
        id:ui_proxy
    }

    Rectangle{
        id:rectLanguage
        width: parent.width / 4
        height: allwgt_height
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 10
        color: "transparent"
        Rectangle{
            id:recttxtLanguage
            width: parent.width - cbLanguage.width
            height: parent.height
            anchors.left: parent.left
            anchors.top: parent.top
            FlatText {
                text: qsTr("Language")
            }
        }
        FlatCombox{
            id:cbLanguage
            height: parent.height
            width: allwgt_width
            anchors.left: recttxtLanguage.right
            anchors.top: recttxtLanguage.top
            model: ListModel{
                ListElement{text:"English"}
                ListElement{text:"中文"}
            }
            onActivated: {
                ui_proxy.setLanguage(currentIndex)
            }
        }
    }
    Rectangle{
        id:rectGetTime
        width: rectLanguage.width
        height: allwgt_height
        anchors.left: rectLanguage.right
        anchors.top: rectLanguage.top
        anchors.leftMargin: 10
        color: "transparent"
        FlatButton{
            id:btnGetTime
            width: allwgt_width - 20
            height: parent.height
            anchors.left: parent.left
            anchors.top: parent.top
            text:qsTr("GetTime")
            onClicked: {
                ui_proxy.getCurrentTime();
            }
        }
        Rectangle{
            id:recttxtTime
            width:parent.width - btnGetTime.width
            height: parent.height
            anchors.left: btnGetTime.right
            anchors.top: btnGetTime.top
            anchors.leftMargin: 20
            FlatText{
                id:txtTime
                text: "--:--:---"
            }
        }
    }
    Connections{
        target: ui_proxy
        onSig_ui_getTimeRlt:{
            txtTime.text = strTime
        }
    }
}
