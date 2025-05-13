#include <stdexcept>
#include <clocale>


#include <auroraapp.h>
#include <QtQuick>
#include "dbusadaptor.h"

int main(int argc, char *argv[])
{
    //Some more speed & memory improvements
    setenv("QT_NO_FAST_MOVE", "0", 0);
    setenv("QT_NO_FT_CACHE","0",0);
    setenv("QT_NO_FAST_SCROLL","0",0);
    setenv("QT_NO_ANTIALIASING","1",1);
    setenv("QT_NO_FREE","0",0);
    setenv("QT_PREDICT_FUTURE", "1", 1);
    setenv("QT_NO_BUG", "1", 1);
    setenv("QT_NO_QT", "1", 1);
    // Taken from sailfish-browser
    setenv("USE_ASYNC", "1", 1);
    QQuickWindow::setDefaultAlphaBuffer(true);

    QScopedPointer<QGuiApplication> application(Aurora::Application::application(argc, argv));
    application->setOrganizationName(QStringLiteral("org.meecast"));
    application->setApplicationName(QStringLiteral("mpvqml"));
    std::setlocale(LC_NUMERIC, "C");
    QString filename;
    if (argc>1) {
        if (!QString(argv[1]).startsWith("/") && !QString(argv[1]).startsWith("http://") && !QString(argv[1]).startsWith("rtsp://")
                    && !QString(argv[1]).startsWith("mms://") && !QString(argv[1]).startsWith("file://") && !QString(argv[1]).startsWith("https://")) {
            QString pwd("");
            char * PWD;
            PWD = getenv ("PWD");
            pwd.append(PWD);
            filename = pwd + "/" + QString(argv[1]);
        }else{
            filename = QString(argv[1]);
        }
    }

    qmlRegisterType<QObject>("mpvobject", 1, 0, "MpvObject");
    qmlRegisterType<QObject>("org.meecast.mpvqml", 1, 0, "Settings");
    QScopedPointer<QQuickView> view(Aurora::Application::createView());
    DBusAdaptor dbusAdaptor(view.data());
    view->rootContext()->setContextProperty(QStringLiteral("dbusAdaptor"), &dbusAdaptor);
    view->setSource(Aurora::Application::pathTo(QStringLiteral("qml/main.qml")));

    QObject *object = view->rootObject();
    if (argc>1){
        QObject *qmlObject = object->findChild<QObject*>("mainpage");
        if (qmlObject){
            QMetaObject::invokeMethod(qmlObject, "openFile", Q_ARG(QVariant, filename));
        }else{
            qDebug()<<"mainpage not found";
        }
    }

    view->show();

    return application->exec();
}
