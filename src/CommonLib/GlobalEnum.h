#ifndef GLOBALENUM_H
#define GLOBALENUM_H
#include <QObject>
#include <QtCore/qglobal.h>
#include "CommonLib_global.h"
#include <QMetaType>

class COMMONLIB_EXPORT GlobalEnum : public QObject
{
    Q_OBJECT
public:
    enum Animal{
        Animal_Unknow = -1,
        Animal_Cat,
        Animal_Dog
    };
    Q_ENUM(Animal)
};




#endif // GLOBALENUM_H
