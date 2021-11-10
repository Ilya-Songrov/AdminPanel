#pragma once

#include <QDebug>
#include <QApplication>
#include <QScreen>
#include <QQmlApplicationEngine>
#include <QQuickItem>
#include <QQmlEngine>
#include <QQmlContext>
#include <QFileInfo>
#include <QDir>
#include <QMessageBox>
#include <QTimer>

#include "providerqml.h"

class AdminPanelApplicationEngine : public QQmlApplicationEngine
{
    Q_OBJECT
public:
    explicit AdminPanelApplicationEngine(QObject *parent = nullptr);
    virtual ~AdminPanelApplicationEngine();

private slots:

private:
    void setConnections();
    void setQmlProperty();
    void loadQml();

    QRect getRectScreen();

private:
    QScopedPointer<ProviderQml> providerQml;
};
