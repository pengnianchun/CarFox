#include <unistd.h>
#include <QGuiApplication>

#include <Global.hpp>
//#include <CarFox/Splash.hpp>
#include <UndeadMain.hpp>
#include <ThemeManager.hpp>

#include "CustomUiController.hpp"

int main(int argc, char *argv[]) {
    qDebug() << "main";

    auto appMain = [](int argc, char *argv[], bool firstInstance) {
        qDebug() << "Begin appMain";
        std::shared_ptr<QGuiApplication> app = std::make_shared<QGuiApplication>(argc, argv);
        // 引用CarFox库中的CarFoxResource.qrc
        // Q_INIT_RESOURCE(CarFoxResource);

        std::unique_ptr<CustomUiController> uiController(new CustomUiController(1440, 540, firstInstance));
        uiController->setReleaseVersion("v1.0.0");
        uiController->start();
        return carfox::UndeadMain::exec(app);
    };

    auto splashMain = [](int argc, char *argv[]) {
        Q_UNUSED(argc);
        Q_UNUSED(argv);
        return ::execl("/usr/bin/mpeg2dec", "mpeg2dec", "/usr/lib/Video/splash.raw", NULL);
    };

    // 尚未确定是否有开机视频, 暂时注释本段代码
//#ifdef Q_PROCESSOR_ARM
//    return carfox::UndeadMain::startWithSplash(splashMain, appMain, argc, argv);
//#else
    Q_UNUSED(splashMain);
    return carfox::UndeadMain::startWithoutSplash(appMain, argc, argv);
//#endif
}
