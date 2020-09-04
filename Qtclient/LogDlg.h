#ifndef LOGDLG_H
#define LOGDLG_H

#include <QWidget>

namespace Ui {
class LogDlg;
}

class LogDlg : public QWidget
{
    Q_OBJECT

public:
    explicit LogDlg(QWidget *parent = 0);
    ~LogDlg();

private slots:
    void on_pushButton_log_clicked();

private:
    Ui::LogDlg *ui;
};

#endif // LOGDLG_H
