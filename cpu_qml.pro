TEMPLATE = app

QT += qml quick
QT += widgets

CONFIG += c++11

SOURCES += main.cpp \
    fileio.cpp \
    cpumodel.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =


HEADERS += \
    fileio.h \
    cpumodel.h

DISTFILES += \
    romb.png
