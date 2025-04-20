TARGET = org.meecast.mpvqml

QT += qml

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

HEADERS += \
    src/main.h \

DISTFILES += \
    rpm/org.meecast.mpvqml \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

PKGCONFIG += mpv
