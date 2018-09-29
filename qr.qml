import QtQuick 2.5
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtMultimedia 5.5

import QZXing 2.3


Page {



    Rectangle
    {
        id: bgRect
        color: "white"
        anchors.fill: videoOutput
    }

    Text
    {
        id: text1
        wrapMode: Text.Wrap
        font.pixelSize: 20
        anchors.top: parent.top
        anchors.left: parent.left
        z: 50
        text: "QR detected: " + detectedTags
    }
    Text
    {
        id: fps
        font.pixelSize: 20
        anchors.top: parent.top
        anchors.right: parent.right
        z: 50
        text: (1000 / zxingFilter.timePerFrameDecode).toFixed(0) + "fps"
    }

    Camera
    {
        id:camera
        focus {
            focusMode: CameraFocus.FocusContinuous
            focusPointMode: CameraFocus.FocusPointAuto
        }
    }

    VideoOutput
    {
        id: videoOutput
        source: camera
        anchors.top: text1.bottom
        anchors.bottom: text2.top
        anchors.left: parent.left
        anchors.right: parent.right
        autoOrientation: true
        fillMode: VideoOutput.Stretch
        filters: [ zxingFilter ]
        MouseArea {
            anchors.fill: parent
            onClicked: {
                camera.focus.customFocusPoint = Qt.point(mouse.x / width,  mouse.y / height);
                camera.focus.focusMode = CameraFocus.FocusMacro;
                camera.focus.focusPointMode = CameraFocus.FocusPointCustom;
            }
        }
        Rectangle {
            id: captureZone
            color: "red"
            opacity: 0.2
            width: height = parent.width * 0.5
            anchors.centerIn: parent
        }
    }

    QZXingFilter
    {
        id: zxingFilter
        captureRect: {
            // setup bindings
            videoOutput.contentRect;
            videoOutput.sourceRect;
            return videoOutput.mapRectToSource(videoOutput.mapNormalizedRectToItem(Qt.rect(
                0.25, 0.25, 0.5, 0.5
            )));
        }

        decoder {
            enabledDecoders: QZXing.DecoderFormat_EAN_13 | QZXing.DecoderFormat_CODE_39 | QZXing.DecoderFormat_QR_CODE

            onTagFound: {
                console.log(tag + " | " + decoder.foundedFormat() + " | " + decoder.charSet());

                window.detectedTags++;
                window.lastTag = tag;

                stackView.push("map.qml")  // Added to navigate to the loaded maps
            }

            tryHarder: false
        }

        onDecodingStarted:
        {
//            console.log("started");
        }

        property int framesDecoded: 0
        property real timePerFrameDecode: 0

        onDecodingFinished:
        {
           timePerFrameDecode = (decodeTime + framesDecoded * timePerFrameDecode) / (framesDecoded + 1);
           framesDecoded++;
           console.log("frame finished: " + succeeded, decodeTime, timePerFrameDecode, framesDecoded);
        }
    }

    Text
    {
        id: text2
        wrapMode: Text.Wrap
        font.pixelSize: 20
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        z: 50
        text: "QR code: " + lastTag
    }
    Switch {
        text: "Autofocus"
        checked: camera.focus.focusMode === CameraFocus.FocusContinuous
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
        onCheckedChanged: {
            if (checked) {
                camera.focus.focusMode = CameraFocus.FocusContinuous
                camera.focus.focusPointMode = CameraFocus.FocusPointAuto
            } else {
                camera.focus.focusPointMode = CameraFocus.FocusPointCustom
                camera.focus.customFocusPoint = Qt.point(0.5,  0.5)
            }
        }
        font.family: Qt.platform.os === 'android' ? 'Droid Sans Mono' : 'Monospace'
        font.pixelSize: Screen.pixelDensity * 5
    }



    Component.onCompleted: {
        var binary = "1111111111111111111111111111111111111111111111100000001111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000011111100011111111100000111111111100111111111111110111111111111111111110111100000000000110000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000011000000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000001100000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000110000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000011000000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000001100000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000110000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000011000000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000001100000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000110000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000011000000000000111111111111111111111111111111111111111111111111111111111111111111111111111000000000001100000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000110000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000011000000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000001100000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000110000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000011000000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000001100000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000110000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000011000000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000001100000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000110000000000001111111111111111111100011111111100000011111111011111111111100001111100001110000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000011111111111111000000000000000000000000000000000000000000001100000000000000000000000000000000000011111000010000000111110000000000000000000000000000000000000000110000000000000000000000000000000001111000000001000000000001111000000000000000000000000000000000000011000000000000000000000000000000011100000000000100000000000000111000000000000000000000000000000000001100000000000000000000000000000011000000000000010000000000000000110000000000000000000000000000000000110000000000000000000000000000011000000000000001000000000000000001100000000000000000000000000000000011000000000000000000000000000011000000000000000100000000000000000011000000000000000000000000000000001100000000000000000000000000011000000000000000010000000000000000000110000000000000000000000000000000110000000000000000000000000001000000000000000001000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000011000000000000000000000000000110000000000000000100000000000000000001100000000000000000000000000000001100000000000000000000000000001100000000000000010000000000000000001100000000000000000000000000000000110000000000000000000000000000011000000000000001000000000000000001100000000000000000000000000000000011000000000000000000000000000000110000000000000100000000000000001100000000000000000000000000000000001100000000000000000000000000000001110000000000010000000000000011100000000000000000000000000000000000110000000000000000000000000000000001111000000001000000000001111000000000000000000000000000000000000011000000000000000000000000000000000000111110000100000001111100000000000000000000000000000000000000001100000000000000000000000000000000000000001111111111111100000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000011111100011111111100000111111111100111111111111110111111111111111111110111100000000000011000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000001100000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000000110000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000011000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000001100000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000000110000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000011000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000001100000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000000110000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000011000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000001100000000000111111111111111111111111111111111111111111111111111111111111111111111111111000000000000110000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000011000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000001100000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000000110000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000011000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000001100000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000000110000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000011000000000001000000000000010000000000001000000000000010000000000001000000000010000000010000000000001100000000000100000000000001000000000000100000000000001000000000000100000000001000000001000000000000110000000000010000000000000100000000000010000000000000100000000000010000000000100000000100000000000011000000000001111111111111111111100011111111100000011111111011111111111100001111100001110000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
        console.log(binary)
    }
}
