#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Ui_proxy.h"
#include "GlobalEnum.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<GlobalEnum>("GlobalEnum", 1, 0, "GlobalEnum");
    qmlRegisterType<Ui_proxy>("Ui_proxy",1,0,"Ui_proxy");
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    app.installTranslator(Ui_proxy::m_pTranslation);
    Ui_proxy::m_pApp = &app;
    Ui_proxy::m_pEngine = &engine;

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
