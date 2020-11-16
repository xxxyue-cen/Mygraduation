#ifndef CLIENTWIDGET_H
#define CLIENTWIDGET_H

#include <QWidget>
#include <QTcpSocket>
#include <QThread>
#include <thread_heart.h>
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

    void SendHeartPack();
//    void on_pushButton_send_clicked();

//    void on_pushButton_close_clicked();

signals:
    void StartThread();

private:

    thread_heart *heart_thread; //发送心跳的线程
    QThread *thread;
    SubMenu *subMenu;
    MainMenu *mainMenu;
    Ui::ClientWidget *ui;

};

#endif // CLIENTWIDGET_H
