#ifndef COMMON_H
#define COMMON_H

#include <QFile>
#include <QDebug>
#include <QDateTime>
#include <iostream>
#include <stdio.h>

#define HOST_IP_ADDRESS   "192.168.3.5"
#define LOACTION_ADDRESS  "127.0.0.1"

typedef enum {
    NORMAL_STATE,
    NEWEST_VERSION,     // send to mcu, new version found, msg: ui, mcu, ui:mcu
    UPDATE_NOTIFY,      // recv from mcu, should begin update, msg: NULL
    UPDATING_STATE,     // send to mcu, update process, msg: ui:90, mcu:40
    UPDATED_SUCCESS,    // send to mcu, update successfully, msg: NULL
    UPDATED_FAILED,     // send to mcu, update fail, msg: fail reason, success as "udisk remove".
} UpgradeMode;

/*
MENU TYPES；
*/
typedef enum {
    MENU_L0_NULL,
    MENU_UPGRADE_TIPS,
    MENU_UPGRADE_PROCESS,
    MENU_UPGRADE_COMPELETE,
    MENU_USB_PLAGIN_OUT,
    MENU_UPGRADE_MAX,
}MENU_L0_TYPES;

typedef enum {
    MENU_L1_NULL,	// 00，NULL
    MENU_MAIN,		// 01, Main Menu
    MENU_SUB,       // 02, Sub Menu
    MENU_CHILD,
}MENU_L1_TYPES;

typedef enum {
    MENU_L2_NULL,		      //00，NULL；
    MENU_CONTROLSYSTEM,		  //01，控制系统信息界面；
    MENU_MOTORSYSTEM,		  //02，发动机系统信息界面；
    MENU_AUXILIARYSYSTEM,     //03，辅助系统信息界面；
    MENU_TCUSYSTEM,			  //04，TCU系统信息界面；
    MENU_BATTERYMANAGESYSTEM, //05，电池管理系统信息界面；
    MENU_BATTERYSTATE,		  //06，电池状态信息界面；
    MENU_AIRCONTROLSYSTEM,	  //07，空调系统信息界面；
    MENU_TESTMODULESYSTEM,    //08，仪表系统信息界面；
    MENU_SYSTEMSET,			  //09,系统设置信息界面
    MENU_L2_MAX,	          //10，NULL;
}MENU_L2_TYPES;

typedef enum {
    MENU_L3_NULL,	        //00，NULL；
    MENU_BATSTATUS_PAGE1,
    MENU_BATSTATUS_PAGE2,
    MENU_BATSTATUS_PAGE3,
    MENU_BATSTATUS_PAGE4,
    MENU_BATSTATUS_PAGE5,
    MENU_BATSTATUS_PAGE6,
    MENU_BATSTATUS_PAGE7,
    MENU_BATSTATUS_PAGE8,
    MENU_BATSTATUS_PAGE9,
    MENU_BATSTATUS_PAGE10,
    MENU_BATSTATUS_MAX,
}MENU_L3_TYPES;

typedef enum {
    MENU_L4_NULL,	        //00，NULL；
    MENU_BATTEMPERATURE_PAGE1,
    MENU_BATTEMPERATURE_PAGE2,
    MENU_BATTEMPERATURE_PAGE3,
    MENU_BATTEMPERATURE_MAX,
}MENU_L4_TYPES;

typedef enum {
    MENU_L5_NULL,	        //00，NULL；
    MENU_HIGHVOLTAGE_PAGE1,
    MENU_HIGHVOLTAGE_PAGE2,
    MENU_HIGHVOLTAGE_MAX,
}MENU_L5_TYPES;

typedef enum {
    MENU_L9_NULL,	        //00，NULL；
    MENU_MOTORINFO_PAGE1,
    MENU_MOTORINFO_PAGE2,
    MENU_MOTORINFO_MAX,
}MENU_L9_TYPES;

typedef enum {
    MENU_L6_NULL,	        //00，NULL；
    MENU_TESTDIAG_PAGE1,
    MENU_TESTDIAG_PAGE2,
    MENU_TESTDIAG_PAGE3,
    MENU_TESTDIAG_PAGE4,
    MENU_TESTDIAG_PAGE5,
    MENU_TESTDIAG_PAGE6,
    MENU_TESTDIAG_PAGE7,
    MENU_TESTDIAG_PAGE8,
    MENU_TESTDIAG_PAGE9,
    MENU_TESTDIAG_PAGE10,
    MENU_TESTDIAG_PAGE11,
    MENU_TESTDIAG_PAGE12,
    MENU_TESTDIAG_PAGE13,
    MENU_TESTDIAG_MAX,
}MENU_L6_TYPES;

typedef enum {
    MENU_L7_NULL,	        //00，NULL；
    MENU_BATMANAGE_PAGE1,
    MENU_BATMANAGE_PAGE2,
    MENU_BATMANAGE_PAGE3,
    MENU_BATMANAGE_MAX,
}MENU_L7_TYPES;

typedef enum {
    MENU_L8_NULL,	        //00，NULL；
    MENU_TIME_SETTINGS,
    MENU_THEME_SETTINGS,
    MENU_SYSTEM_MAX,
}MENU_L8_TYPES;

typedef enum {
    APP_THEME_ONE,          //00，NULL；
    APP_THEME_TWO,
    APP_THEME_THREE,
}APP_THEME_TYPES;

typedef enum {
    MENU_MODULE_NULL = 0,     //00，NULL；
    MENU_FRONT_MODULE = 8,	  //08，前模块信息界面；
    MENU_MIDDLE_MODULE = 9,	  //09，中模块信息界面；
    MENU_BACK_MODULE = 10,    //10，后模块信息界面；
    MENU_MODULE_MAX,	      //11，NULL;
}MENU_MODULE_TYPES;

typedef enum {
    MENU_DATETIME_NULL,	    //00，NULL；
    MENU_DATETIME_HOUR,
    MENU_DATETIME_MINUTE,
    MENU_DATETIME_YEAR,
    MENU_DATETIME_MONTH,
    MENU_DATETIME_DAY,
    MENU_DATETIME_CONFIRM,
    MENU_DATETIME_MAX,
}MENU_DATETIME_TYPES;

typedef enum {
    MENU_DIRECTION_NULL,	//00，NULL；
    MENU_DIRECTION_PREV,
    MENU_DIRECTION_NEXT,
    MENU_DIRECTION_MAX,
}MENU_DIRECTION_TYPES;

/* ValueChangeNotify for Model: Notify to VielModel value changed and update value */
#define ValueChangeNotify(name, v) \
    do { \
        if(m_##name!=(v)){ \
            m_##name=(v); qDebug() << QString(#name) <<(m_##name) ; \
            emit name##Changed(v); \
        } \
    } while(0)

/* ValueChangeNotify for Model: Notify to VielModel value changed but will not update value */
#define ValueChangeOnlyNotify(name, v) \
    do { \
        /*qDebug() << QString(#name) << v; */ \
        emit name##Changed(v); \
    } while(0)

/* ValueChangeNotify for Model: Notify to VielModel value changed but will not update value */
#define ValueChangeFollowNotify(name, v, i) \
    do { \
        /*qDebug() << QString(#name) << v; */ \
        emit name##Changed(i, v); \
    } while(0)

/* ValueChangeOnlyNotifyMultiData for Model: Notify to VielModel value changed but will not update value */
#define ValueChangeOnlyNotifyMultiData(name, v_str, v_int) \
    do { \
        /*qDebug() << QString(#name) << v; */ \
        emit name##Changed(v_str, v_int); \
    } while(0)

/*
 * ValueChangeSet for ViewModel: the same as ValueChangeNotify
 */
#define ValueChangeSet(name, v) \
    do { \
        if(m_##name!=(v)){ \
            m_##name=(v); qDebug() << QString(#name) <<(m_##name) ; \
            emit name##Changed(v); \
        } \
    } while(0)

/*
 * WarningChangeSet for ViewModel: notify QML add/delete a warning.
 */
#define ACTION_DEL 0
#define ACTION_ADD 1

#define WarningChangeSet(name, warningContent, warningCode) \
    do { \
        qDebug() << QString(#name) << ":" << (m_str_##name) << "(" << (m_##name) << ")" << "-->" << warningContent << "(" << warningCode << ")"; \
        if(m_str_##name != warningContent && warningContent.size() > 0) { \
            m_##name = (warningCode); \
            emit name##Changed(warningCode); \
            if ((warningContent) == "normal") { \
                emit faultChanged(m_str_##name, ACTION_DEL); \
            } else {\
                emit faultChanged(m_str_##name, ACTION_DEL); \
                emit faultChanged(warningContent, ACTION_ADD); \
            } \
            m_str_##name= (warningContent); \
        } \
    } while(0)

#define WarningValueChangeSet(name, warningContent) \
    do { \
        if(m_##name != warningContent) { \
            QString content = warningContent.left(warningContent.length()-2); \
            m_##name = warningContent; \
            QString flag = warningContent.right(1); \
            if (flag == "0") { \
                emit faultChanged(content, ACTION_DEL); \
            } else if (flag == "1") {\
                emit faultChanged(content, ACTION_ADD); \
            } \
        } \
    } while(0)

#ifdef DEBUG_INFO_TO_FILE
static QString msgBuffer;
#endif

class LogMsgHandle : public QObject
{
    Q_OBJECT

public:
    LogMsgHandle() {}
    static void initialize() {
#ifdef DEBUG_INFO_TO_FILE
#ifdef __arm__
        qInstallMessageHandler(customMessageHandler);
#endif
#endif
    }

#ifdef DEBUG_INFO_TO_FILE
#define  TIME_STAMP  QDateTime::currentDateTime().toString("yyyy-MM-dd HH:mm:ss:zzz")
    static void customMessageHandler(QtMsgType type, const QMessageLogContext &context, const QString &msg)
    {
        Q_UNUSED(context);

        QString txt;
        switch (type) {
            case QtDebugMsg:
                txt = QString("Debug   [stamp:%2]: %1\n").arg(msg).arg(TIME_STAMP);
                break;
            case QtWarningMsg:
                txt = QString("Warning [stamp:%2]: %1\n").arg(msg).arg(TIME_STAMP);
                break;
            case QtCriticalMsg:
                txt = QString("Critical[stamp:%2]: %1\n").arg(msg).arg(TIME_STAMP);
                break;
            case QtFatalMsg:
                txt = QString("Fatal   [stamp:%2]: %1\n").arg(msg).arg(TIME_STAMP);
                abort();
        default:
            break;
        }

        msgBuffer.append(txt);
        if (msgBuffer.length() > 500) {

            QFile outFile("/var/FangYan/fangyan.log");
            outFile.open(QIODevice::WriteOnly | QIODevice::Append);

            QTextStream ts(&outFile);
            ts << msgBuffer;

            msgBuffer.clear();
        }
    }
#endif
};

#define logPrint(log) std::cout<<log<<std::endl

#ifdef  QT_PRINT_CMD
#define Q_PRINT(log) logPrint(log)
#else
#define Q_PRINT(log)
#endif

#ifdef DEBUG_ENABLE
#define Q_PRINTK(fmt, args...) qDebug("[Q_PRINT]  [%s %d]" fmt"\n", __FILE__, __LINE__, ##args)
#else
#define Q_PRINTK(fmt, ...)
#endif

#endif // COMMON_H
