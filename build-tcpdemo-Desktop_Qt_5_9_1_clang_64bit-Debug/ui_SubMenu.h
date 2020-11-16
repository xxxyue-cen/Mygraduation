/********************************************************************************
** Form generated from reading UI file 'SubMenu.ui'
**
** Created by: Qt User Interface Compiler version 5.9.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_SUBMENU_H
#define UI_SUBMENU_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_SubMenu
{
public:
    QGridLayout *gridLayout;
    QSpacerItem *verticalSpacer;
    QPushButton *pushButton_2;
    QPushButton *pushButton;
    QPushButton *pushButton_6;
    QPushButton *pushButton_5;
    QPushButton *pushButton_4;
    QPushButton *pushButton_3;
    QSpacerItem *horizontalSpacer;
    QSpacerItem *verticalSpacer_2;
    QSpacerItem *horizontalSpacer_2;

    void setupUi(QWidget *SubMenu)
    {
        if (SubMenu->objectName().isEmpty())
            SubMenu->setObjectName(QStringLiteral("SubMenu"));
        SubMenu->resize(356, 360);
        gridLayout = new QGridLayout(SubMenu);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        verticalSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout->addItem(verticalSpacer, 0, 1, 1, 1);

        pushButton_2 = new QPushButton(SubMenu);
        pushButton_2->setObjectName(QStringLiteral("pushButton_2"));

        gridLayout->addWidget(pushButton_2, 2, 1, 1, 1);

        pushButton = new QPushButton(SubMenu);
        pushButton->setObjectName(QStringLiteral("pushButton"));

        gridLayout->addWidget(pushButton, 1, 1, 1, 1);

        pushButton_6 = new QPushButton(SubMenu);
        pushButton_6->setObjectName(QStringLiteral("pushButton_6"));

        gridLayout->addWidget(pushButton_6, 6, 1, 1, 1);

        pushButton_5 = new QPushButton(SubMenu);
        pushButton_5->setObjectName(QStringLiteral("pushButton_5"));

        gridLayout->addWidget(pushButton_5, 5, 1, 1, 1);

        pushButton_4 = new QPushButton(SubMenu);
        pushButton_4->setObjectName(QStringLiteral("pushButton_4"));

        gridLayout->addWidget(pushButton_4, 4, 1, 1, 1);

        pushButton_3 = new QPushButton(SubMenu);
        pushButton_3->setObjectName(QStringLiteral("pushButton_3"));

        gridLayout->addWidget(pushButton_3, 3, 1, 1, 1);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout->addItem(horizontalSpacer, 4, 0, 1, 1);

        verticalSpacer_2 = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout->addItem(verticalSpacer_2, 7, 1, 1, 1);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout->addItem(horizontalSpacer_2, 4, 2, 1, 1);


        retranslateUi(SubMenu);

        QMetaObject::connectSlotsByName(SubMenu);
    } // setupUi

    void retranslateUi(QWidget *SubMenu)
    {
        SubMenu->setWindowTitle(QApplication::translate("SubMenu", "Form", Q_NULLPTR));
        pushButton_2->setText(QApplication::translate("SubMenu", "\344\270\212\344\274\240\346\226\207\344\273\266", Q_NULLPTR));
        pushButton->setText(QApplication::translate("SubMenu", "\347\273\210\347\253\257\345\221\275\344\273\244", Q_NULLPTR));
        pushButton_6->setText(QApplication::translate("SubMenu", "\350\216\267\345\217\226\346\233\264\345\244\232\346\235\203\351\231\220", Q_NULLPTR));
        pushButton_5->setText(QApplication::translate("SubMenu", "\351\200\200\345\207\272", Q_NULLPTR));
        pushButton_4->setText(QApplication::translate("SubMenu", "\346\263\250\351\224\200", Q_NULLPTR));
        pushButton_3->setText(QApplication::translate("SubMenu", "\344\270\213\350\275\275\346\226\207\344\273\266", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class SubMenu: public Ui_SubMenu {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_SUBMENU_H
