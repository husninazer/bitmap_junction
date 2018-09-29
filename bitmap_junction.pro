TEMPLATE = app

CONFIG += c++11 qzxing_multimedia

INCLUDEPATH = .

#QT +=  quick bluetooth

CONFIG(debug, debug|release) {
    CONFIG+=qml_debug
} else {
    DEFINES += QT_NO_DEBUG
    DEFINES += QT_NO_DEBUG_OUTPUT
}

HEADERS += \
    application.h \
    native.h \
    device.h \
    deviceinfo.h \
    characteristicinfo.h \
    serviceinfo.h

SOURCES += main.cpp \
    application.cpp \
    native.cpp \
    device.cpp \
    deviceinfo.cpp \
    serviceinfo.cpp \
    characteristicinfo.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

include(./src/QZXing.pri)

# Default rules for deployment.
include(deployment.pri)

android {
    QT += androidextras quick bluetooth

    DISTFILES += \
        android/AndroidManifest.xml \
        android/gradle/wrapper/gradle-wrapper.jar \
        android/gradlew \
        android/res/values/libs.xml \
        android/build.gradle \
        android/gradle/wrapper/gradle-wrapper.properties \
        android/gradlew.bat \
        android/AndroidManifest.xml \
        android/gradle/wrapper/gradle-wrapper.jar \
        android/gradlew \
        android/res/values/libs.xml \
        android/build.gradle \
        android/gradle/wrapper/gradle-wrapper.properties \
        android/gradlew.bat

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
}

else:ios {
  QMAKE_INFO_PLIST=Info.plist
}

DISTFILES += \
    icons/map.jpeg

