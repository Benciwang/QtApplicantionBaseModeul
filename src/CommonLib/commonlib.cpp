#include "commonlib.h"
#include <QDebug>
#include <QTime>
#include <QThread>
CommonLib::CommonLib()
{
}

CommonLib::~CommonLib()
{

}

void CommonLib::consoleTest()
{
    QString strTime = QTime::currentTime().toString("mm:ss:zzz");
    qDebug()<<"console time:"<<strTime<<" id:"<<QThread::currentThreadId();
    emit sig_getTimeRlt(strTime);

}
