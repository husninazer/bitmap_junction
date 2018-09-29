#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtCore/QLoggingCategory>
#include <QDebug>

#include <Qt>
#include <QZXing.h>
#include <QQuickView>
#include "application.h"
#include "device.h"

int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);
    QGuiApplication app(argc, argv);


    QZXing::registerQMLTypes();

    Device d;
    QQuickView *view = new QQuickView;
    view->rootContext()->setContextProperty("device", &d);

    Application customApp;
    customApp.checkPermissions();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("device", &d);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));


   // view->setSource(QUrl("qrc:/assets/main.qml"));
    view->setResizeMode(QQuickView::SizeRootObjectToView);
    view->show();
    return app.exec();
}
