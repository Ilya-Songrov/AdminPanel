#include "adminpanelapplicationengine.h"

AdminPanelApplicationEngine::AdminPanelApplicationEngine(QObject *parent) : QQmlApplicationEngine(parent)
    , providerQml(new ProviderQml())
{
    setConnections();
    setQmlProperty();
    loadQml();
}

AdminPanelApplicationEngine::~AdminPanelApplicationEngine()
{

}

void AdminPanelApplicationEngine::setConnections()
{
    connect(providerQml.get(), &ProviderQml::buttonLoadWasClicid, this, [](QString message){ qDebug() << "message:" << message << Qt::endl;});
}

void AdminPanelApplicationEngine::setQmlProperty()
{
    this->rootContext()->setContextProperty("rectScreen", getRectScreen());
    this->rootContext()->setContextProperty("providerQml", providerQml.get());
}

void AdminPanelApplicationEngine::loadQml()
{
#ifdef QT_DEBUG
    const QUrl url(QUrl::fromLocalFile(QFileInfo(__FILE__).dir().absolutePath() + "/resources/qml/main.qml"));
#else
    const QUrl url(QStringLiteral("qrc:/qml/qml/main.qml"));
#endif
//    this->load(url);
    this->load("/home/songrov/DeveloperRoot/Projects_Main/NewJob/AdminPanel/AdminPanel/resources/qml/main.qml");
    if (this->rootObjects().isEmpty()){
        qCritical() << "Qml files were not loaded" << Qt::endl;
        emit exit(-1);
    }
}

QRect AdminPanelApplicationEngine::getRectScreen()
{
    const auto *primaryScreen = QGuiApplication::primaryScreen();
    QRect rect(QPoint(), QSize(1280, 1024));
#ifdef QT_DEBUG
    rect.setSize(QSize(1280, 1024) / 1.4);
#endif
    rect.moveCenter(primaryScreen ? primaryScreen->geometry().center() : QPoint());
    return rect;
}
