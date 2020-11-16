/********************************************************************************
** Form generated from reading UI file 'LogDlg.ui'
**
** Created by: Qt User Interface Compiler version 5.9.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_LOGDLG_H
#define UI_LOGDLG_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_LogDlg
{
public:
    QGridLayout *gridLayout;
    QSpacerItem *verticalSpacer_2;
    QSpacerItem *verticalSpacer;
    QSpacerItem *horizontalSpacer;
    QLabel *label;
    QLineEdit *lineEdit_num;
    QLabel *label_2;
    QLineEdit *lineEdit_passwd;
    QPushButton *pushButton_log;
    QSpacerItem *horizontalSpacer_2;

    void setupUi(QWidget *LogDlg)
    {
        if (LogDlg->objectName().isEmpty())
            LogDlg->setObjectName(QStringLiteral("LogDlg"));
        LogDlg->resize(362, 393);
        gridLayout = new QGridLayout(LogDlg);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        verticalSpacer_2 = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout->addItem(verticalSpacer_2, 4, 1, 1, 1);

        verticalSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout->addItem(verticalSpacer, 0, 2, 1, 1);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout->addItem(horizontalSpacer, 2, 0, 1, 1);

        label = new QLabel(LogDlg);
        label->setObjectName(QStringLiteral("label"));

        gridLayout->addWidget(label, 1, 1, 1, 1);

        lineEdit_num = new QLineEdit(LogDlg);
        lineEdit_num->setObjectName(QStringLiteral("lineEdit_num"));

        gridLayout->addWidget(lineEdit_num, 1, 2, 1, 1);

        label_2 = new QLabel(LogDlg);
        label_2->setObjectName(QStringLiteral("label_2"));

        gridLayout->addWidget(label_2, 2, 1, 1, 1);

        lineEdit_passwd = new QLineEdit(LogDlg);
        lineEdit_passwd->setObjectName(QStringLiteral("lineEdit_passwd"));

        gridLayout->addWidget(lineEdit_passwd, 2, 2, 1, 1);

        pushButton_log = new QPushButton(LogDlg);
        pushButton_log->setObjectName(QStringLiteral("pushButton_log"));

        gridLayout->addWidget(pushButton_log, 3, 1, 1, 2);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout->addItem(horizontalSpacer_2, 2, 3, 1, 1);


        retranslateUi(LogDlg);

        QMetaObject::connectSlotsByName(LogDlg);
    } // setupUi

    void retranslateUi(QWidget *LogDlg)
    {
        LogDlg->setWindowTitle(QApplication::translate("LogDlg", "Form", Q_NULLPTR));
        label->setText(QApplication::translate("LogDlg", "\345\270\220\345\217\267:", Q_NULLPTR));
        label_2->setText(QApplication::translate("LogDlg", "\345\257\206\347\240\201:", Q_NULLPTR));
        pushButton_log->setText(QApplication::translate("LogDlg", "\347\231\273\351\231\206", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class LogDlg: public Ui_LogDlg {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_LOGDLG_H
