#include <QTcpSocket>
#include "LogDlg.h"
#include "ui_LogDlg.h"
#include "client.h"
extern QTcpSocket *tcpSocket;
LogDlg::LogDlg(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::LogDlg)
{
    ui->setupUi(this);


}

LogDlg::~LogDlg()
{
    delete ui;
}

void LogDlg::on_pushButton_log_clicked()
{

    struct  pack *pa = NULL;
    struct msg ma;

    pa =(struct pack*) malloc(sizeof(struct pack) + sizeof(struct msg));
    pa->lenth = sizeof(struct msg);
    pa->type = LOG ^KEY;

    ma.num = ui->lineEdit_num->text().toInt();

    QByteArray temp2 = ui->lineEdit_passwd->text().toLatin1();
    strcpy(ma.passwd ,temp2.data());
    memcpy(pa->data,&ma,sizeof(struct msg));

    int ret = tcpSocket->write((char *)pa,sizeof(struct pack)+sizeof(struct msg));
    if(ret < 0 )
    {
        perror("write");
        return;
    }
    this->close();
    return ;

}
