#include <unistd.h>
#include <QGuiApplication>

#include <Global.hpp>
//#include <CarFox/Splash.hpp>
#include <UndeadMain.hpp>
#include <ThemeManager.hpp>

#include "CustomUiController.hpp"


int main(int argc, char *argv[]) {
    qDebug() << "main";

    std::shared_ptr<QGuiApplication> app = std::make_shared<QGuiApplication>(argc, argv);
    std::unique_ptr<CustomUiController> uiController(new CustomUiController(1440, 540, false));
    uiController->setReleaseVersion("v1.0.0");
    uiController->start();
    return app->exec();
}
