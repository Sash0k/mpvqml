TARGET = org.meecast.mpvqml

QT += qml

CONFIG += \
    auroraapp \
    dbus \

PKGCONFIG += \
           dbus-1 \

QT += \
    dbus

SOURCES += \
    src/main.cpp \
    src/settings.cpp \
    src/dbusadaptor.cpp \
    src/volume/pulseaudiocontrol.cpp \

HEADERS += \
    src/main.h \
    src/settings.h \
    src/dbusadaptor.h \
    src/volume/pulseaudiocontrol.h \

DISTFILES += \
    rpm/org.meecast.mpvqml \

#QMAKE_CXXFLAGS += "-fPIC"    
#QMAKE_LFLAGS += "-no-pie"
AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += \
    auroraapp_i18n_idbased \
    auroraapp_i18n \

TRANSLATIONS = \
   translations/org.meecast.mpvqml-ru.ts \

PKGCONFIG += mpv
