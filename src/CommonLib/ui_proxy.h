#ifndef UI_PROXY_H
#define UI_PROXY_H

#include <QObject>
#include "CommonLib_global.h"
#include <QThread>
#include <QUuid>
#include <QJsonArray>
#include <QJsonObject>
#include <QTranslator>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "commonlib.h"
#include <QSharedPointer>
#include <QWeakPointer>
class COMMONLIB_EXPORT Ui_proxy :public QObject
{
    Q_OBJECT
public:
    Ui_proxy();
    ~Ui_proxy();
    Q_INVOKABLE void saveSysIni(QJsonArray jsData);
    Q_INVOKABLE void loadSysIni();
    Q_INVOKABLE void setLanguage(int iLanguange = 0);
    Q_INVOKABLE void getCurrentTime();
public:
    static QTranslator* m_pTranslation;
    static QGuiApplication* m_pApp;
    static QQmlApplicationEngine* m_pEngine;
private:
    QSharedPointer<CommonLib> m_spCommonLib;
    QPointer<QThread> m_wpThread;
signals:
    void sig_consoleTime();

    void sig_ui_updateLanguage();
    void sig_ui_sysIniData(QJsonObject jsData);
    void sig_ui_getTimeRlt(QString strTime);

};

#endif // UI_PROXY_H
