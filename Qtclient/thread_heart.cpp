#include "thread_heart.h"

thread_heart::thread_heart(QObject *parent) : QObject(parent)
{

}

void thread_heart::send_hread()
{

    //封包 发送心跳

//    struct pack *pa  = NULL;

//    //printf("sock = %d\n",sock);

//    struct msg ma;
    while(1)
     {
//            pa = (struct pack *)malloc(sizeof(struct pack)+sizeof(struct msg));
//            pa->lenth = sizeof(struct msg);
//            pa->type = HERART;
//            pa->type=pa->type ^KEY;
//            ma.num = UserNum; //将id写入心跳包
//            memcpy(pa->data,&ma,sizeof(struct  msg));
//         int ret  = sock->write((char *)pa,sizeof(struct  pack) + sizeof(struct msg));
//         //printf("发送心跳包 ret = %d \n",ret);
//        free(pa);
//        pa = NULL;

        emit heart_send_signal();
           QThread::sleep(3); //定时3秒
     }
}
