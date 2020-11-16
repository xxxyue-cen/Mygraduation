#include "clientwidget.h"
#include "ui_clientwidget.h"

#include <QMessageBox>
#include <QHostAddress>
extern int UserNum;
extern int Width_Pos;
extern int Height_Pos;
QTcpSocket *tcpSocket;
ClientWidget::ClientWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::ClientWidget)
{
    ui->setupUi(this);
    //this->showFullScreen();
    Width_Pos = this->width();
    Height_Pos = this->height();

    mainMenu = new MainMenu();
    subMenu = new SubMenu();
    heart_thread = new thread_heart;
    thread = new QThread(this);
    heart_thread->moveToThread(thread);
    tcpSocket = NULL;
    tcpSocket = new QTcpSocket(this);
    setWindowTitle("客户端");
    connect(this,&ClientWidget::StartThread,heart_thread,&thread_heart::send_hread);


    connect(heart_thread,&thread_heart::heart_send_signal,this,&ClientWidget::SendHeartPack);
    connect(tcpSocket,&QTcpSocket::connected,[=]()
    {
        //ui->textEdit_read->setText("连接成功");
        thread->start();
        emit StartThread();
        mainMenu->show();
    });



    connect(tcpSocket,&QTcpSocket::readyRead,[=]()
    {
        //接收数据
        int buff;
        //    QByteArray array = tcpSocket->readAll();//读取发送过来的数据
        //    ui->textEdit_read->append(array);//显示数据
        int ret = tcpSocket->read((char *)&buff,4);
        if(ret < 0)
        {
            perror("read");
            return ;
        }else
        {
            if(buff == REG_OK)
            {
                QMessageBox::warning(0,"注册","注册成功！！");

                return ;

            }else if(buff == LOG_OK)
            {
                QMessageBox::warning(0,"登陆","登陆成功！！");
                subMenu->show();
                return ;

            }else
            {
                QMessageBox::warning(0,"错误","操作失败");
                return ;
            }

        }
    }
    );



}

ClientWidget::~ClientWidget()
{
    delete ui;
}

void ClientWidget::on_pushButton_connect_clicked()
{
    QString ip = ui->lineEdit_ip->text();//读取窗口的ip
    qint16 port = ui->lineEdit_port->text().toInt();//读取窗口的port
    tcpSocket->connectToHost(QHostAddress(ip),port);//与服务器建立连接
    //    int i = this->width();
    //    int j = this->height();
    //    QString str = QString("i: %1 j: %2").arg(i).arg(j);
    //    QMessageBox::about(0,"about",str);

}

void ClientWidget::SendHeartPack()
{
    //封包 发送心跳

    struct pack *pa  = NULL;

    //printf("sock = %d\n",sock);

    struct msg ma;
//    while(1)
//     {
            pa = (struct pack *)malloc(sizeof(struct pack)+sizeof(struct msg));
            pa->lenth = sizeof(struct msg);
            pa->type = HERART;
            pa->type=pa->type ^KEY;
            ma.num = UserNum; //将id写入心跳包
            memcpy(pa->data,&ma,sizeof(struct  msg));
         int ret  = tcpSocket->write((char *)pa,sizeof(struct  pack) + sizeof(struct msg));
         //printf("发送心跳包 ret = %d \n",ret);
        free(pa);
        pa = NULL;


}


//void ClientWidget::on_pushButton_send_clicked()
//{
//    QString str = ui->textEdit_write->toPlainText();//获取编辑框的内容
//    tcpSocket->write(str.toUtf8().data());//将编辑框的内容发送出去
//}


//void ClientWidget::on_pushButton_close_clicked()
//{
//    tcpSocket ->disconnectFromHost();
//    tcpSocket->close();
//}
