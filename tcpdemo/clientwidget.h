#ifndef CLIENTWIDGET_H
#define CLIENTWIDGET_H

#include <QWidget>
#include <QTcpSocket>
#include "SubMenu.h"
#include "MainMenu.h"
namespace Ui {
class ClientWidget;
}

class ClientWidget : public QWidget
{
    Q_OBJECT

public:
    explicit ClientWidget(QWidget *parent = 0);
    ~ClientWidget();

private slots:
    void on_pushButton_connect_clicked();

//    void on_pushButton_send_clicked();

//    void on_pushButton_close_clicked();

private:
    SubMenu *subMenu;
    MainMenu *mainMenu;
    Ui::ClientWidget *ui;

};

#endif // CLIENTWIDGET_H