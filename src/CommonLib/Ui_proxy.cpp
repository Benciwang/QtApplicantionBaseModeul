#include "Ui_proxy.h"
#include <QFile>
#include <QDir>
#include <QSettings>
#include <QJsonArray>
#include <QJsonObject>
#include <QTextCodec>
#include <QDebug>
#include <QTime>

QTranslator* Ui_proxy::m_pTranslation = new QTranslator();
QGuiApplication* Ui_proxy::m_pApp = nullptr;
QQmlApplicationEngine* Ui_proxy::m_pEngine = nullptr;
Ui_proxy::Ui_proxy()
{
    m_spCommonLib = QSharedPointer<CommonLib> (new CommonLib(),&QObject::deleteLater);
    m_wpThread = QPointer<QThread>(new QThread);
    m_spCommonLib.data()->moveToThread(m_wpThread.data());
    m_wpThread.data()->start();
    connect(this,&Ui_proxy::sig_consoleTime,m_spCommonLib.data(),&CommonLib::consoleTest);
    connect(m_spCommonLib.data(),&CommonLib::sig_getTimeRlt,this,&Ui_proxy::sig_ui_getTimeRlt);

}
Ui_proxy::~Ui_proxy()
{
    m_spCommonLib.clear();
    if(!m_wpThread.isNull())
    {
        m_wpThread.clear();
    }

}
void Ui_proxy::loadSysIni()
{
    QString strPath = QDir::currentPath() + "/Setup/Sys.ini";
    QFile file(strPath);
    QJsonObject jsData;
    if (file.exists())
    {
        QSettings setting(strPath, QSettings::IniFormat);
        setting.setIniCodec("utf-8");
        QStringList strList = setting.allKeys();
        foreach (QString strData, strList)
        {
            jsData.insert(strData, setting.value(strData).toString());
        }
    }
    emit sig_ui_sysIniData(jsData);
}
void Ui_proxy::saveSysIni(QJsonArray jsData)
{
    if (jsData.isEmpty())
        return;

    QString strFilePath = QDir::currentPath();
    strFilePath += "/Setup/Sys.ini";

    QSettings iniSet(strFilePath, QSettings::IniFormat);
    iniSet.setIniCodec(QTextCodec::codecForName("utf-8"));

    QJsonArray::iterator iter = jsData.begin();
    for (;iter != jsData.end(); iter++)
    {
        QJsonObject tmpData = iter->toObject();
        QJsonObject::iterator dataIter = tmpData.find("SettingName");
        QString strName = dataIter.value().toString();
        tmpData.erase(dataIter);
        dataIter = tmpData.begin();

        iniSet.beginGroup(strName);
        for (; dataIter != tmpData.end(); dataIter++)
        {
            QString strKey = dataIter.key();
            QString strValue = dataIter->toVariant().toString();
            iniSet.setValue(strKey, strValue);
        }
        iniSet.endGroup();
    }
}
void Ui_proxy::setLanguage(int iLanguange)
{
    switch (iLanguange)
    {
    case 0:
        m_pTranslation->load("./translations/translate_en.qm");
        break;
    case 1:
        m_pTranslation->load("./translations/translate_cn.qm");
        break;
    default:
        break;
    }
    QJsonObject js;
    js.insert("SettingName", "Sys");
    js.insert("language", iLanguange);
    QJsonArray arr;
    arr.push_back(js);
    saveSysIni(arr);

    m_pApp->installTranslator(m_pTranslation);
    m_pEngine->retranslate();

    emit sig_ui_updateLanguage();
}

void Ui_proxy::getCurrentTime()
{
    emit sig_consoleTime();
}
