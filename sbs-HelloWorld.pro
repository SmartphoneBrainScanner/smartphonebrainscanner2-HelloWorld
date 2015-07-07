TEMPLATE = app

QT += qml quick

SOURCES += main.cpp \
    mycallback.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

include(../../smartphonebrainscanner2-core/src/sbs2.pri)
#include(../../smartphonebrainscanner2-core/src/sbs2_binary_decryptor.pri)

HEADERS += \
    mycallback.h
