QT += gui core quick

TEMPLATE = lib
DEFINES += COMMONLIB_LIBRARY

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    Ui_proxy.cpp \
    commonlib.cpp

HEADERS += \
    CommonLib_global.h \
    GlobalEnum.h \
    Ui_proxy.h \
    commonlib.h
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
# Default rules for deployment.
unix {
    target.path = /usr/lib
}
!isEmpty(target.path): INSTALLS += target
