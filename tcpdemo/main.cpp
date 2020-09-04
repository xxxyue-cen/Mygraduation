
#include "clientwidget.h"
#include <QApplication>
#include <QSize>
#include <QScreen>
int Width_Pos;
int Height_Pos;
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);


    QSize iconSize(32, 32);

    QScreen *screen = qApp->primaryScreen();
    QFont f = qApp->font();
    int pixelSize = (f.pointSize() * screen->logicalDotsPerInch()) / 72;
    QSize screenSize = screen->size();
    if(screenSize.width() > 960 || screenSize.height() > 960)
    {
        iconSize *= ((qreal)pixelSize) / 20;
    }

    Width_Pos =  iconSize.width();
    Height_Pos = iconSize.height();
    ClientWidget w2;

    w2.show();
    return a.exec();
}
