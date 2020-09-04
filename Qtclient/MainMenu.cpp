#include "MainMenu.h"
#include "ui_MainMenu.h"
#include <QTcpSocket>
extern int Width_Pos;
extern int Height_Pos;
extern QTcpSocket *tcpSocket;
MainMenu::MainMenu(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::MainMenu)
{
    ui->setupUi(this);

//    ui->pushButton_reg->setFixedWidth(Width_Pos/2);
//    ui->pushButton_log->setFixedWidth(Width_Pos/2);
//    ui->pushButton_exit->setFixedWidth(Width_Pos/2);
//    ui->pushButton_reg->move(Width_Pos/4,Height_Pos/4);
//    ui->pushButton_log->move(Width_Pos/4,Height_Pos/4+ui->pushButton_reg->height());
//    ui->pushButton_exit->move(Width_Pos/4,Height_Pos/4+ui->pushButton_log->height()*2);

    regDlg = new RegDlg();
    logDlg = new LogDlg();
}

MainMenu::~MainMenu()
{
    delete ui;
}

void MainMenu::on_pushButton_reg_clicked()
{
    //注册
    regDlg->show();
}

void MainMenu::on_pushButton_log_clicked()
{
    //登陆
    logDlg->show();


}

void MainMenu::on_pushButton_exit_clicked()
{
    tcpSocket->close();

    tcpSocket->disconnectFromHost();
    tcpSocket = NULL;

    exit(0);
}
