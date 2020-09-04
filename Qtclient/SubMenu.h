#ifndef SUBMENU_H
#define SUBMENU_H

#include <QWidget>

namespace Ui {
class SubMenu;
}

class SubMenu : public QWidget
{
    Q_OBJECT

public:
    explicit SubMenu(QWidget *parent = 0);
    ~SubMenu();

private:
    Ui::SubMenu *ui;
};

#endif // SUBMENU_H
