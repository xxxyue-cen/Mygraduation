/********************************************************************************
** Form generated from reading UI file 'RegDlg.ui'
**
** Created by: Qt User Interface Compiler version 5.9.2
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_REGDLG_H
#define UI_REGDLG_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QFormLayout>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_RegDlg
{
public:
    QVBoxLayout *verticalLayout;
    QSpacerItem *verticalSpacer_2;
    QFormLayout *formLayout;
    QLabel *label;
    QLineEdit *lineEdit_num;
    QLabel *label_2;
    QLineEdit *lineEdit_name;
    QLabel *label_3;
    QLineEdit *lineEdit_passwd;
    QGridLayout *gridLayout;
    QPushButton *pushButton_RegOk;
    QPushButton *pushButton_2;
    QSpacerItem *verticalSpacer;

    void setupUi(QWidget *RegDlg)
    {
        if (RegDlg->objectName().isEmpty())
            RegDlg->setObjectName(QStringLiteral("RegDlg"));
        RegDlg->resize(326, 322);
        verticalLayout = new QVBoxLayout(RegDlg);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        verticalSpacer_2 = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout->addItem(verticalSpacer_2);

        formLayout = new QFormLayout();
        formLayout->setObjectName(QStringLiteral("formLayout"));
        label = new QLabel(RegDlg);
        label->setObjectName(QStringLiteral("label"));

        formLayout->setWidget(0, QFormLayout::LabelRole, label);

        lineEdit_num = new QLineEdit(RegDlg);
        lineEdit_num->setObjectName(QStringLiteral("lineEdit_num"));

        formLayout->setWidget(0, QFormLayout::FieldRole, lineEdit_num);

        label_2 = new QLabel(RegDlg);
        label_2->setObjectName(QStringLiteral("label_2"));

        formLayout->setWidget(1, QFormLayout::LabelRole, label_2);

        lineEdit_name = new QLineEdit(RegDlg);
        lineEdit_name->setObjectName(QStringLiteral("lineEdit_name"));

        formLayout->setWidget(1, QFormLayout::FieldRole, lineEdit_name);

        label_3 = new QLabel(RegDlg);
        label_3->setObjectName(QStringLiteral("label_3"));

        formLayout->setWidget(2, QFormLayout::LabelRole, label_3);

        lineEdit_passwd = new QLineEdit(RegDlg);
        lineEdit_passwd->setObjectName(QStringLiteral("lineEdit_passwd"));

        formLayout->setWidget(2, QFormLayout::FieldRole, lineEdit_passwd);


        verticalLayout->addLayout(formLayout);

        gridLayout = new QGridLayout();
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        pushButton_RegOk = new QPushButton(RegDlg);
        pushButton_RegOk->setObjectName(QStringLiteral("pushButton_RegOk"));

        gridLayout->addWidget(pushButton_RegOk, 0, 0, 1, 1);

        pushButton_2 = new QPushButton(RegDlg);
        pushButton_2->setObjectName(QStringLiteral("pushButton_2"));

        gridLayout->addWidget(pushButton_2, 0, 1, 1, 1);


        verticalLayout->addLayout(gridLayout);

        verticalSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout->addItem(verticalSpacer);


        retranslateUi(RegDlg);

        QMetaObject::connectSlotsByName(RegDlg);
    } // setupUi

    void retranslateUi(QWidget *RegDlg)
    {
        RegDlg->setWindowTitle(QApplication::translate("RegDlg", "Form", Q_NULLPTR));
        label->setText(QApplication::translate("RegDlg", "\345\270\220\345\217\267:", Q_NULLPTR));
        label_2->setText(QApplication::translate("RegDlg", "\347\224\250\346\210\267:", Q_NULLPTR));
        label_3->setText(QApplication::translate("RegDlg", "\345\257\206\347\240\201:", Q_NULLPTR));
        pushButton_RegOk->setText(QApplication::translate("RegDlg", "\346\263\250\345\206\214", Q_NULLPTR));
        pushButton_2->setText(QApplication::translate("RegDlg", "\345\217\226\346\266\210", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class RegDlg: public Ui_RegDlg {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_REGDLG_H
