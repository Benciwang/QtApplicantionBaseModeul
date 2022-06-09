QT += quick

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp

RESOURCES += qml.qrc

INCLUDEPATH += ../CommonLib/

# Additional import path used to resolve QML modules in Qt Creator's code model
#QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
#QML_DESIGNER_IMPORT_PATH =
TRANSLATIONS += \
    ../../translations/translate_cn.ts\
    ../../translations/translate_en.ts

RC_ICONS = favicon.ico

greaterThan(QT_MAJOR_VERSION,4){
        TARGET_ARCH=$${QT_ARCH}
}else{
        TARGET_ARCH=$${QMAKE_HOST.arch}
}
contains(TARGET_ARCH, x86_64){
    QML_IMPORT_PATH = I:\Qt\5.14.2\mingw73_64\qml
    CONFIG(debug, debug|release){
        DESTDIR = ../../Output/bin64/debug
        LIBS += -L../../Output/bin64/debug

    }
    else{
        DESTDIR = ../../Output/bin64/release
        LIBS += -L../../Output/bin64/release
    }
}
else{
    QML_IMPORT_PATH = I:\Qt\5.14.2\mingw73_32\qml
    CONFIG(debug, debug|release){
    DESTDIR = ../../Output/bin32/debug
    LIBS += -L../../Output/bin32/debug
    }
    else{
    DESTDIR = ../../Output/bin32/release
    LIBS += -L../../Output/bin32/release
    }
}
LIBS += -lCommonLib
# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
