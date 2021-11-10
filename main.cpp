#include <QApplication>
#include <QQmlApplicationEngine>
#include <QLoggingCategory>

#include "adminpanelapplicationengine.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
#if 0
    QLoggingCategory::setFilterRules(QStringLiteral("qt.qml.binding.removal.info=true"));
#endif

    QApplication app(argc, argv);
    QGuiApplication::setApplicationVersion("1.0.0");

    AdminPanelApplicationEngine adminPanel;

    return app.exec();
}
