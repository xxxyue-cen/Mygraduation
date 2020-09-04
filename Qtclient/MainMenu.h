#ifndef MAINMENU_H
#define MAINMENU_H

#include <QWidget>
#include "RegDlg.h"
#include "LogDlg.h"
namespace Ui {
class MainMenu;
}


class MainMenu : public QWidget
{
    Q_OBJECT

public:
    explicit MainMenu(QWidget *parent = 0);
    ~MainMenu();

private slots:
    void on_pushButton_reg_clicked();

    void on_pushButton_log_clicked();

    void on_pushButton_exit_clicked();

private:
    LogDlg *logDlg;
    RegDlg *regDlg;
    Ui::MainMenu *ui;
};

#endif // MAINMENU_H
