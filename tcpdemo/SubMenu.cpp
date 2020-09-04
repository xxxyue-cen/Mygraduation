#include "SubMenu.h"
#include "ui_SubMenu.h"

SubMenu::SubMenu(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::SubMenu)
{
    ui->setupUi(this);
}

SubMenu::~SubMenu()
{
    delete ui;
}
