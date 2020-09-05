#include<stdio.h>
#include<fcntl.h>
#include<arpa/inet.h>
#include<sys/socket.h>
#include<unistd.h>
#include<sys/types.h>
#include<string.h>
#include<stdlib.h>
#include<sys/epoll.h>
#include<mysql/mysql.h>
#include<time.h>
#include<sys/stat.h>
#include <pthread.h>

#define SEND 10
#define RED  20
#define  ENDL 30
#define  REG       11
#define  REG_OK    12
#define  REG_FAIL  13
#define  SEND_O   21
#define  SEND_O_OK  22
#define  SEND_O_FAIL  23
#define  SEND_FILE   24

#define  REC_O   31
#define  REC_O_OK   32
#define  REC_O_FAIL    33
#define REC_FILE   34

#define  LOG  41
#define  LOG_OK  42
#define  LOG_FAIL  43

#define  CHO       61
#define  CHO_OK    62
#define   CHO_FAIL  63
#define  HEAD  100

#define EXIT  51
#define EXIT_OK  52
#define  EXIT_FAIL  53

#define SHOW   71
#define  SHOW_OK   72
#define  SHOW_FAIL  73
#define SHOW_NAME    74
#define SHOW_ROW   75
#define  SHOW_BUFF  76
#define  SHOW_END   77






#define RECORD   81
#define  RECORD_OK   82
#define  RECORD_FAIL  83
#define RECORD_NAME    84
#define RECORD_ROW   85
#define  RECORD_BUFF  86
#define  RECORD_END   87


#define KEY  0x86


//心跳包
#define  HERART  91  


MYSQL mysql;
#define IP  "192.168.199.214"


struct  message
{
	char name[32];
	int  num;
	char passwd[32];
};


struct cli_info
{	
	int  num;
	char passwd[32];	
	int  cfd;
	int  port;
	char ip[64];
	int  time; //定时器  心跳
	struct cli_info *next;
};

struct pack
{
	int type;
	int lenth;
	char data[0];

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



int show(struct cli_info  *phead);
int rec_o(struct cli_info *head,int cfd,struct pack p);
int name(struct cli_info **head,struct pack p,int temp,int efd);
int order(struct cli_info *head,struct pack p,int cfd);		

