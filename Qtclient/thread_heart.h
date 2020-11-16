#ifndef THREAD_HEART_H
#define THREAD_HEART_H
#include "client.h"

#include <QObject>
#include <QThread>
#include <QTcpSocket>
class thread_heart : public QObject
{
    Q_OBJECT
public:
    explicit thread_heart(QObject *parent = nullptr);

    void send_hread(QTcpSocket *sock);

signals:



public slots:
};

#endif // THREAD_HEART_H
