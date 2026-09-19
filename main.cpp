#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "temperture.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    Temperture tempObject;
    engine.rootContext()->setContextProperty("tempObject" , &tempObject);


    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("TempProject", "Main");

    return app.exec();
}
