#ifndef REGDLG_H
#define REGDLG_H

#include <QWidget>

namespace Ui {
class RegDlg;
}

class RegDlg : public QWidget
{
    Q_OBJECT

public:
    explicit RegDlg(QWidget *parent = 0);
    ~RegDlg();

private slots:
    void on_pushButton_RegOk_clicked();

    void on_pushButton_2_clicked();

private:
    Ui::RegDlg *ui;
};

#endif // REGDLG_H
