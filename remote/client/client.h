#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <termios.h>
#include <pthread.h>


#define  MENU   "\t\t\t***********1.注册**********\n"\
				"\t\t\t***********2.登录**********\n"\
				"\t\t\t***********3.退出**********\n"\


#define MENU2   "\t\t\t**********1.终端命令*******\n"\
				"\t\t\t**********2.上传文件*******\n"\
				"\t\t\t**********3.下载文件*******\n"\
				"\t\t\t**********4.注销    *******\n"\
				"\t\t\t**********5.退出    *******\n"\
				"\t\t\t**********6.获取更多权限***\n"

#define  MENU3  "\t\t\t**********1.查看所有在线用户*********\n"\
				"\t\t\t**********2.查看所有用户操作记录*****\n"\
				"\t\t\t**********3.查看所有用户帐号信息*****\n"\
				"\t\t\t**********4.退出*********************\n"


#define  KEY   0x86

//在线用户信息
#define   CHO       61
#define   CHO_OK    62
#define   CHO_FAIL  63
#define  HEAD  100


//注册
#define  REG       11
#define  REG_OK    12
#define  REG_FAIL  13


//上传文件
#define SEND_O       21
#define SEND_O_OK    22
#define SEND_O_FAIL  23
#define SEND_FILE    24


//下载文件
#define REC_O    31
#define REC_O_OK    32
#define REC_O_FAIL    33
#define REC_FILE    34




#define SEND   10
#define RED  20
#define ENDL  30

//登录
#define LOG    41
#define LOG_OK  42
#define LOG_FAIL  43

//退出
#define EXIT   51
#define EXIT_OK  52
#define EXIT_FAIL  53

//记录用户数据信息
#define   SHOW       71   
#define   SHOW_OK    72
#define   SHOW_FAIL   73
#define   SHOW_NAME   74
#define   SHOW_ROW     75
#define   SHOW_BUFF    76
#define   SHOW_END     77

//记录用户操作信息
#define  RECORD   81
#define  RECORD_OK   82
#define  RECORD_FAIL  83
#define  RECORD_NAME    84
#define  RECORD_ROW   85
#define  RECORD_BUFF  86
#define  RECORD_END   87


//心跳包
#define  HERART  91  



struct cli_info
{	
	int   num;
	char passwd[32];	
	int cfd;
	int port;
	char ip[64];
	struct cli_info *next;
};


struct pack 
{
	int  type;
	int lenth;
	char data[0];
};

struct msg
{
	char name[32];
	int num;
	char passwd[32];
};

struct buff_msg
{
	int lenth;
	char buff[1024];
};

struct mysql_msg
{
	int row;
	int fields;
};
int getpasswd(char *passwd, int size);
int write_msg(int sockfd);
int order(int sockfd);
int send_order(int sockfd);
int rec_order(int sockfd);
int log_in(int sockfd);

int choose(int sockfd);

int show_mysql(int sockfd);
int record_mysql(int sockfd);
void rec_link(int cfd);
