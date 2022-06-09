#ifndef COMMONLIB_H
#define COMMONLIB_H

#include "CommonLib_global.h"
#include <QObject>
class COMMONLIB_EXPORT CommonLib:public QObject
{
    Q_OBJECT
public:
    CommonLib();
    ~CommonLib();
    Q_SLOT void consoleTest();

signals:
    void sig_getTimeRlt(QString strTime);
};

#endif // COMMONLIB_H
