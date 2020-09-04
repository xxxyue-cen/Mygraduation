#include   <QTcpSocket>
#include <QMessageBox>
#include "RegDlg.h"
#include "ui_RegDlg.h"
#include "client.h"

extern QTcpSocket *tcpSocket;

RegDlg::RegDlg(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::RegDlg)
{
    ui->setupUi(this);
}

RegDlg::~RegDlg()
{
    delete ui;
}

void RegDlg::on_pushButton_RegOk_clicked()
{
   // int buff;
   struct pack *pa = NULL;
   struct msg ma;
   pa = (struct pack*)malloc(sizeof(struct pack) + sizeof(struct msg));

   pa->lenth = sizeof(struct msg);

   pa->type  = REG ^ KEY;

   ma.num = ui->lineEdit_num->text().toInt();
   QByteArray temp1 = ui->lineEdit_name->text().toLatin1();
   strcpy(ma.name,temp1.data());
   QByteArray temp2 = ui->lineEdit_passwd->text().toLatin1();
   strcpy(ma.passwd ,temp2.data());

    memcpy(pa->data,&ma,sizeof(struct msg));

    int ret = tcpSocket->write((char*)pa,sizeof(struct pack) + sizeof(struct msg));
    if(ret < 0)
    {
        perror("write");
        return ;
    }

//    ret = tcpSocket->read((char *)&buff,4);
//    if(ret < 0)
//    {
//        perror("read");
//        return ;
//    }else
//    {
//        if(buff == REG_OK)
//        {
//            QMessageBox::warning(0,"注册","注册成功！！");
//            return ;

//        }else
//        {
//            QMessageBox::warning(0,"注册","注册失败！！");
//            return ;

//        }
//    }
    this->close();
 return ;
}

void RegDlg::on_pushButton_2_clicked()
{
    this->close();
}
