



#include "server/server.h"
//////////////////////////守护进程///////////////////
void make_daemon()
{
	pid_t pid;

	if(pid=fork()!=0)
	{
		exit(0);
	}
	
	setsid();
	
//	signal(SIGHUP,SIG_IGN);
//	signal(SIGCHLD,SIG_IGN);
	if(pid=fork()!=0)
		exit(0);

	int daemon_flag=1;
	
//	chdir("/");
	umask(0);
	
	//	close(0);
	//
	//		//	close(1);
}



/////////////////////发送数据///////////////


int record_mysql(int cfd,struct pack p)
{

	printf("show_mysql\n");

	int ret;
	
	struct pack *pa=NULL;
	
	char name[32];
	
	if(NULL==mysql_init(&mysql))
	{
		printf("初始化失败！\n");
		return 0;
	}
	
	if(NULL==mysql_real_connect(&mysql,"localhost","root","123456","message",0,NULL,0))
	{
		printf("%s\n",mysql_error(&mysql));
		return 0;
	}

	printf("连接成功！\n");

	mysql_set_character_set(&mysql,"utf8");
	// 4 执行数据库语句 sql
	const char *sql = "select * from record";

	int res = mysql_query(&mysql,sql);	

	// 成功返回0  失败 非0
	if(res != 0)
	{
		printf("查询错误,error info:%s",mysql_error(&mysql));
		return -1;
	}
	
	printf("连接成功！\n");
	
	MYSQL_RES * result;

	result = mysql_store_result(&mysql);

	// 一些插入/更新 操作 不需要结果集合  一般返回NULL
	if(result==NULL)
	{
		printf("没有结果\n");
		return 0;
	}

	// 根据结果集 获取列数 
	int num_fields = mysql_num_fields(result);

	//int num_fields = mysql_field_count(mysql);
	// 获取行数   mysql_use_result() 不能使用
	int num_rows = mysql_num_rows(result);

	printf("共有%d列 %d行\n",num_fields,num_rows);
	// 输出所有字段
	MYSQL_FIELD *field;

	char a;
	ret=read(cfd,&a,p.lenth);
	
	printf("a:%c\n",a);
	if(a=='y'){
		while((field=mysql_fetch_field(result)) !=NULL)
		{
			
			pa=malloc(sizeof(struct pack)+sizeof(name[32]));
		
			if(pa==NULL)
			{
				printf("malloc error\n");
				return -1;
			}
	
			pa->type=RECORD_NAME;
			
			strcpy(name,field->name);
			
			pa->lenth=strlen(name);
			
			memcpy(pa->data,name,strlen(name));
			
			ret =write(cfd,pa,sizeof(struct pack)+strlen(name));
			
			if(ret <=0)
			{
				perror("write");
				return -1;
			}else
				printf("name:%s\t",field->name);
			
			free(pa);
		}
		
		printf("\n");

		// 输出每行的结果
		MYSQL_ROW row;    // typedef char ** MYSQL_ROW
		
		char buff[1024];	
		int i;
		
		pa=malloc(sizeof(struct pack)+sizeof(struct mysql_msg));
		
		if(pa==NULL)
		{
			printf("malloc error\n");
			return -1;
		}
		
		pa->type=RECORD_ROW;
		
		struct mysql_msg  my;
		
		struct buff_msg my_buff;
		
		my.row=num_rows;
		
		my.fields=num_fields;

		printf("共有%d列 %d行\n",num_fields,num_rows);
		
		pa->lenth=sizeof(struct mysql_msg);
		
		memcpy(pa->data,&my,sizeof(struct mysql_msg));
		
		ret =write(cfd,pa,sizeof(struct pack)+sizeof(struct mysql_msg));
		
		printf("ret :%d\tline:%d\n",ret,__LINE__);
		
		free(pa);
		
		while(row=mysql_fetch_row(result))
		{
			printf("row:%d\tnum_fields:%d\n",num_rows,num_fields);
		
			for(i=0;i<num_fields;i++)
			{
				pa=malloc(sizeof(struct pack)+sizeof(struct buff_msg));
			
				if(pa==NULL)
				{
					printf("malloc error\n");
					return -1;
				}
				
				pa->type=RECORD_BUFF;
				
				strcpy(my_buff.buff,row[i]);
				
				my_buff.lenth=strlen(buff);
				
				pa->lenth=sizeof(struct buff_msg);
				
				memcpy(pa->data,&my_buff,sizeof(struct buff_msg));
				
				ret =write(cfd,pa,sizeof(struct pack)+sizeof(struct buff_msg));
				
				printf("ret :%d\tline:%d\n",ret,__LINE__);
				
				printf("buff:%s ",my_buff.buff);
				
				free(pa);			
			}
		
			printf("\n");
		}
	}

	pa=malloc(sizeof(struct pack));
	
	if(pa==NULL)
	{
		printf("malloc error\n");
		return -1;
	}
	
	pa->type=RECORD_END;
	
	ret =write(cfd,pa,sizeof(struct pack));
	
	free(pa);			
	// 6 用完后 释放结果集
	mysql_free_result(result);
	
	// 7 关闭数据库
	mysql_close(&mysql);
}

//////////////////////保存  数据库 
int mysql_record(int cfd,char buff[64],struct cli_info *head)
{

	//	printf("show");
	//	printf("%s",buff);	
	
	int ret;
	
	char sql[128];
	
	char buf1[1024];
	
	char buf2[1024];
	
	if(NULL==mysql_init(&mysql))
	{
		printf("初始化失败！\n");
		return 0;
	}
	
	if(NULL==mysql_real_connect(&mysql,"localhost","root","123456","message",0,NULL,0))
	{
		printf("%s\n",mysql_error(&mysql));
		return 0;
	}
	
	printf("连接成功！\n");
	
	struct cli_info *q=NULL;
	
	q=head;
	
	while(q!=NULL)
	{
		if(q->cfd==cfd)
			break;
		q=q->next;
	}
	//	show(head);
	
	time_t t;
	
	struct tm *lt;
	
	time(&t);
	
	lt=localtime(&t);
	
	sprintf(buf1,"%04d-%02d-%02d\n",lt->tm_year+1900,lt->tm_mon+1,lt->tm_mday);	
	
	sprintf(buf2,"%02d:%02d:%02d\n",lt->tm_hour,lt->tm_min,lt->tm_sec);	
	
	printf("%s %s",buf1,buf2);
	
	sprintf(sql,"insert into record  values (%d,'%s','%s','%s','%s');",q->num,q->passwd,buf1,buf2,buff);	
	//	printf("%s\n",sql);
	if(0!=mysql_query(&mysql,sql))
	{
		printf("%s,%d\n",mysql_error(&mysql),__LINE__);
		return -1;
	}

	mysql_close(&mysql);

	return 0;
}




/////////////////////////查询数据/////

int show_mysql(int cfd,struct pack p)
{

	printf("show_mysql\n");
	
	int ret;
	
	struct pack *pa=NULL;
	
	char name[32];
	
	if(NULL==mysql_init(&mysql))
	{
		printf("初始化失败！\n");
		return 0;
	}

	if(NULL==mysql_real_connect(&mysql,"localhost","root","123456","message",0,NULL,0))
	{
		printf("%s\n",mysql_error(&mysql));
		return 0;
	}

	printf("连接成功！\n");

	mysql_set_character_set(&mysql,"utf8");
	// 4 执行数据库语句 sql
	const char *sql = "select num,passwd  from msg";

	int res = mysql_query(&mysql,sql);	

	// 成功返回0  失败 非0
	if(res != 0)
	{
		printf("查询错误,error info:%s",mysql_error(&mysql));
		return -1;
	}
	printf("连接成功！\n");

	MYSQL_RES * result;

	result = mysql_store_result(&mysql);

	// 一些插入/更新 操作 不需要结果集合  一般返回NULL
	if(result==NULL)
	{
		printf("没有结果\n");
		return 0;
	}

	// 根据结果集 获取列数 
	int num_fields = mysql_num_fields(result);
	
	//int num_fields = mysql_field_count(mysql);

	// 获取行数   mysql_use_result() 不能使用
	int num_rows = mysql_num_rows(result);

	printf("共有%d列 %d行\n",num_fields,num_rows);
	// 输出所有字段
	
	MYSQL_FIELD *field;
	
	char a;
	
	ret=read(cfd,&a,p.lenth);
	
	printf("a:%c\n",a);
	
	if(a=='y'){
		while((field=mysql_fetch_field(result)) !=NULL)
		{
			pa=malloc(sizeof(struct pack)+sizeof(name[32]));
			if(pa==NULL)
			{
				printf("malloc error\n");
				return -1;
			}
			
			pa->type=SHOW_NAME;
		
			strcpy(name,field->name);
			
			pa->lenth=strlen(name);
			
			memcpy(pa->data,name,strlen(name));
			
			ret =write(cfd,pa,sizeof(struct pack)+strlen(name));
			
			if(ret <=0)
			{
				perror("write");
				return -1;
			}else
				printf("name:%s\t",field->name);
			
			free(pa);
		}
		
		printf("\n");

		// 输出每行的结果
		MYSQL_ROW row;    // typedef char ** MYSQL_ROW
		
		char buff[1024];	
		
		int i;
		
		pa=malloc(sizeof(struct pack)+sizeof(struct mysql_msg));
		
		if(pa==NULL)
		{
			printf("malloc error\n");
			return -1;
		}
		
		pa->type=SHOW_ROW;
		
		struct mysql_msg  my;
		
		struct buff_msg my_buff;
		
		my.row=num_rows;
		
		my.fields=num_fields;

		printf("共有%d列 %d行\n",num_fields,num_rows);

		pa->lenth=sizeof(struct mysql_msg);
		
		memcpy(pa->data,&my,sizeof(struct mysql_msg));
		
		ret =write(cfd,pa,sizeof(struct pack)+sizeof(struct mysql_msg));
		
		printf("ret :%d\tline:%d\n",ret,__LINE__);
		
		free(pa);
		
		while(row=mysql_fetch_row(result))
		{
		
			printf("row:%d\tnum_fields:%d\n",num_rows,num_fields);
			
			for(i=0;i<num_fields;i++)
			{
			
				pa=malloc(sizeof(struct pack)+sizeof(struct buff_msg));
				
				if(pa==NULL)
				{
					printf("malloc error\n");
					return -1;
				}
				
				pa->type=SHOW_BUFF;
				
				strcpy(my_buff.buff,row[i]);
				
				my_buff.lenth=strlen(buff);
				
				pa->lenth=sizeof(struct buff_msg);
				
				memcpy(pa->data,&my_buff,sizeof(struct buff_msg));
				
				ret =write(cfd,pa,sizeof(struct pack)+sizeof(struct buff_msg));
				
				printf("ret :%d\tline:%d\n",ret,__LINE__);
				
				printf("buff:%s ",my_buff.buff);
				
				free(pa);			
			}

			printf("\n");
		
		}
	}

	pa=malloc(sizeof(struct pack));

	if(pa==NULL)
	{
		printf("malloc error\n");
		return -1;
	}
	
	pa->type=SHOW_END;
	
	ret =write(cfd,pa,sizeof(struct pack));
	
	free(pa);			

	// 6 用完后 释放结果集
	mysql_free_result(result);
	// 7 关闭数据库
	mysql_close(&mysql);
}

////////////////////////////////////////////////////////////////////////////////////
int send_link(struct cli_info *head,int cfd)
{

	int ret;
	
	struct cli_info  *p=NULL;
	
	p=head;
	
	struct pack *pa=NULL;

	pa=malloc(sizeof(struct pack));
	
	pa->type=HEAD;
	
	ret=write(cfd,pa,sizeof(struct pack));
	
	while(p!=NULL)
	{
	
		ret=write(cfd,p,sizeof(struct cli_info));
		
		if(ret<0)
		{
			perror("write");
			break;
		}
		else
		{
			printf("write sucess\n");
		}
		
		p=p->next;
	
	}
	
	struct pack judge;
	
	judge.type=CHO_OK;
	
	write(cfd,&judge,sizeof(struct pack));

	return 0;
}


/////////////////////////////////////////////////////////////////////////////////////

int show(struct cli_info  *phead)
{

	struct cli_info  *p=NULL;
	
	p=phead;
	
	while(p!=NULL)
	{
		
		printf("%d\t%s\t%d\t%s\t%d\n",p->num,p->passwd,p->port,p->ip,p->cfd);
	
		p=p->next;
	}
	return 0;
}

//////////////////////////////////////连接断开保存文件///////////////////////////////
int close_file(struct cli_info  *head,int cfd)
{

	char buff[1024];
	
	struct cli_info *p=NULL;
	
	p=head;
	
	while(p!=NULL)
	{
		if(p->cfd==cfd)
			break;
		
		p=p->next;
	}	
	
	time_t t;
	
	struct tm *lt;
	
	time(&t);
	
	lt=localtime(&t);
	
	int fd;
	
	fd=open("./log",O_WRONLY|O_APPEND);
	
	if(fd<0)
	{
		perror("open");
		return -1;
	}
	
	char buf[255];
	
	strcpy(buf,"break");
	
	mysql_record(cfd,buf,head);
	
	printf("buf:%s",buf);
	
	printf("open sucess\n");
	
	//	printf("时间:%02d-%02d-%04d %02d:%02d:%02d\tid:%d\tip:%s\tport:%d\t断开\n",lt->tm_mon+1,lt->tm_mday,lt->tm_year+1900,lt->tm_hour,lt->tm_min,lt->tm_sec,p->num,p->ip,p->port);
	
	sprintf(buff,"时间:%02d-%02d-%04d %02d:%02d:%02d\tid:%d\tip:%s\tport:%d\t断开\n",lt->tm_mon+1,lt->tm_mday,lt->tm_year+1900,lt->tm_hour,lt->tm_min,lt->tm_sec,p->num,p->ip,p->port);
	
	write(fd,&buff,strlen(buff));
	
	close(fd);
}


///////////////////////////////////////////////////用户登录保存文件/////////////////////
int open_file(struct cli_info  *q)
{
	char buff[1024];
	
	time_t t;
	
	struct tm *lt;
	
	time(&t);
	
	lt=localtime(&t);
	
	int fd;
	
	fd=open("./log",O_WRONLY|O_APPEND);
	
	if(fd<0)
	{
		perror("open");
		return -1;
	}
	
	char buf[255];
	
	int cfd=q->cfd;
	
	strcpy(buf,"connect");
	
	mysql_record(cfd,buf,q);

	printf("open sucess\n");
	
	//	printf("时间:%02d-%02d-%04d %02d:%02d:%02d\tid:%d\tip:%s\tport:%d\t登录\n",lt->tm_mon+1,lt->tm_mday,lt->tm_year+1900,lt->tm_hour,lt->tm_min,lt->tm_sec,q->num,q->ip,q->port);
	
	sprintf(buff,"时间:%02d-%02d-%04d %02d:%02d:%02d\tid:%d\tip:%s\tport:%d\t登录\n",lt->tm_mon+1,lt->tm_mday,lt->tm_year+1900,lt->tm_hour,lt->tm_min,lt->tm_sec,q->num,q->ip,q->port);
	
	write(fd,&buff,strlen(buff));
	
	close(fd);
}

///////////////////////////////////////////解包得到宏值/////////////////////////////

int mysql_read(struct cli_info **head,int cfd,struct pack pa)//连接的链表   cfd   客户端传的数据(二次解包)
{
	//	show(&head);
	struct message  ma;
	
	int ret;
	
	struct sockaddr_in cliaddr;
	
	struct cli_info   *p=NULL,*q=NULL;
	
	p=*head;
	
	q=*head;
	
	char sql[128];
	
	if(NULL==mysql_init(&mysql))
	{
		printf("初始化失败！\n");
		return 0;
	}
	
	if(NULL==mysql_real_connect(&mysql,"localhost","root","123456","message",0,NULL,0))
	{
		printf("%s\n",mysql_error(&mysql));
		return 0;
	}
	
	printf("连接成功！\n");

	ret=read(cfd,&ma,pa.lenth);
	
	if(read<0)
	{
		perror("read");
		return -1;
	}else if(ret==0)
	{
		printf("tcp broken\n");
		return -1;
	}else
	{	
		
		printf("%d\t%s\n",ma.num,ma.passwd);
		
		sprintf(sql,"select * from msg where num= %d and passwd='%s'",ma.num,ma.passwd);	
		
		if(0!=mysql_query(&mysql,sql))
		{
			printf("%s\n",mysql_error(&mysql));
			return -1;
		}

		MYSQL_RES *result =NULL;
		
		int num_row=0;
		
		result=mysql_store_result(&mysql);
		
		MYSQL_ROW row;
		
		if(result!=NULL)
		{
		
			num_row=mysql_num_rows(result);
			
			if(num_row==1)
			{

				while(p!=NULL)
				{	
					if(p->num==ma.num)
					{
						num_row=2;
						return num_row;
					}else
					{
						p=p->next;
					}

				}
				while(q!=NULL)//(把客户端ip  port   cfd  写入链表)
				{
					if(q->cfd==cfd)
					{
						q->num=ma.num;
				
						strcpy(q->passwd,ma.passwd);
						
						open_file(q);
						
						break;	
					}else
					{
						q=q->next;
					}
				}

			}

			mysql_close(&mysql);
		
			return num_row;
		}
	}
}



//登录   调用函数从数据库查找
int log_ok(struct cli_info **head,int cfd,struct pack pa)
{

	int buff,row;
	
	struct message  ma;
	
	if(pa.type==LOG)
	{

		row=mysql_read(head,cfd,pa);//客户端所有信息链表   连接信息链表   cfd   二次解包数据
		
		if(row==1)
		{
		
			buff=LOG_OK;//登录成功     
			
			write(cfd,&buff,sizeof(buff));//  打印登录成功
			
			return 0;
		}else 
		{
			
			buff=LOG_FAIL;
			
			write(cfd,&buff,sizeof(buff));
			
			return 0;
		}
	}
}


///////////////////////////////////用户注销//////////////////////////
//注销   数据库 
int mysql_exit(int cfd,struct pack pa,struct cli_info **head)
{

	struct   cli_info *p=*head;

	struct message  ma;
	
	char buf[255];
	
	strcpy(buf,"logout");
	
	mysql_record(cfd,buf,p);

	int ret;

	char sql[128];
	
	while(p!=NULL)
	{
		if(p->cfd==cfd)
			break;
		else
			p=p->next;
	}

	printf("%d\t%s\t%d\t%s\t%d\n",p->num,p->passwd,p->port,p->ip,p->cfd);
	
	if(NULL==mysql_init(&mysql))
	{
		printf("初始化失败！\n");
		return 0;
	}
	
	if(NULL==mysql_real_connect(&mysql,"localhost","root","123456","message",0,NULL,0))
	{
		printf("%s\n",mysql_error(&mysql));
		return 0;
	}

	printf("连接成功！\n");
	{
		sprintf(sql,"delete from  msg  where  num=%d and passwd='%s'",p->num,p->passwd);	
		if(0!=mysql_query(&mysql,sql))
		{
			printf("%s,%d\n",mysql_error(&mysql),__LINE__);
			return -1;
		}
	}
	
	mysql_close(&mysql);
}

int exit_ok(int cfd,struct pack  pa,struct cli_info  **head)
{
	
	int buff,ret;
	
	char a;
	
	printf("exit\n");
	
	ret=read(cfd,&a,pa.lenth);
	
	printf("ret:%d,a:%c\t,lenth:%d\n",ret,a,pa.lenth);
	
	if(read<0)
	{
		perror("read");
		return -1;
	}else if(ret==0)
	{
		printf("tcp broken %d\n",__LINE__);
		return -1;
	}else if(ret>0)
	{
		if(a=='y')
		{
		
			ret=mysql_exit(cfd,pa,head);
	
			printf("%d,%d\n",ret,__LINE__);
			if(ret==-1)
			{
				buff=EXIT_FAIL;
			
				write(cfd,&buff,sizeof(buff));
			}
			else
			{
				buff=EXIT_OK;
				write(cfd,&buff,sizeof(buff));
			}


		}
	}
	return 0;
}
//////////////////////////////用户注册///////////////////////


//注册  数据库 
int mysql_write(int cfd,struct pack pa)
{

	struct message  ma;
	
	int ret;
	
	char sql[128];
	
	if(NULL==mysql_init(&mysql))
	{
		printf("初始化失败！\n");
		return 0;
	}
	
	if(NULL==mysql_real_connect(&mysql,"localhost","root","123456","message",0,NULL,0))
	{
		printf("%s\n",mysql_error(&mysql));
		return 0;
	}
	
	printf("连接成功！\n");

	ret=read(cfd,&ma,pa.lenth);
	
	printf("ret:%d,lenth:%d\n",ret,pa.lenth);
	
	if(read<0)
	{
		perror("read");
		return -1;
	}else if(ret==0)
	{
		printf("tcp broken %d\n",__LINE__);
		return -1;
	}else
	{
		
		sprintf(sql,"insert into msg  values (%d,'%s','%s')",ma.num,ma.name,ma.passwd);	
	
		if(0!=mysql_query(&mysql,sql))
		{
			printf("%s,%d\n",mysql_error(&mysql),__LINE__);
			return -1;
		}
	}

	mysql_close(&mysql);
}

int reg_ok(int cfd,struct pack  pa)
{
	
	int buff,ret;
	
	printf("reg\n");
	
	ret=mysql_write(cfd,pa);
	
	printf("%d,%d\n",ret,__LINE__);
	
	if(ret!=-1)
	{
		buff=REG_OK;

		write(cfd,&buff,sizeof(buff));
	}
	else
	{
		buff=REG_FAIL;
	
		write(cfd,&buff,sizeof(buff));
	}

	return 0;

}

//////////////////////socket初始化///////////////////////
int socket_init()
{

	int sockfd,ret,addrlen;
	
	struct sockaddr_in seraddr;
	
	int  port;
	
	char ip[128];
	
	char temp[128];
	
	FILE *fp=NULL;
	
	//fp=fopen("/home/yisheng/pro3/server.conf","r");
	
	fp=fopen("./server.conf","r");
	if(fp==NULL)
	{
		printf("fopen failed.\n");
		return -1;
	}
	
	int i;
	
	while(fgets(temp,sizeof(temp),fp)!=NULL)
	{
		if((strncmp(temp,"port",4))==0)
		{
			for(i=0;i<strlen(temp);i++)
			{
				if(temp[i]>='0'&&temp[i]<='9')
					break;
			}
	
			strcpy(temp,&temp[i]);
			
			temp[strlen(temp)-1]='\0';
			
			port=atoi(temp);
		}
		else if((strncmp(temp,"ip",2))==0)
		{
			for(int i=0;i<strlen(temp);i++)
			{
				if(temp[i]>='0'&&temp[i]<='9')
					break;
			}
			
			strcpy(temp,&temp[i]);
			
			temp[strlen(temp)-1]='\0';
			
			strcpy(ip,temp);
		}
	}
	printf("%d\n",port);

	printf("%s\n",ip);

	sockfd=socket(AF_INET,SOCK_STREAM,0);
	
	if(sockfd==0)
	{
		perror("sockfd");
		return -1;
	}
	addrlen=sizeof(struct sockaddr_in);
	
	seraddr.sin_family=AF_INET;
	
	seraddr.sin_port=htons(port);
	
	inet_pton(AF_INET,ip,&seraddr.sin_addr.s_addr);
	
	ret=bind(sockfd,(struct sockaddr*)&seraddr,sizeof(struct sockaddr_in));
	if(ret<0)
	{
		perror("bind");
		return -1;
	}
 make_daemon();
	ret=listen(sockfd,20);
	if(ret<0)
	{
		perror("listen");
		return -1;
	}

	return sockfd;

}

//////////////////////////////////删除链表///////////////////////////////
int del_link(struct cli_info **head,int temp)
{

	struct cli_info *p=NULL;
	
	p=*head;
	
	struct cli_info *ptr=NULL;
	
	ptr=malloc(sizeof(struct cli_info));
	
	while(p!=NULL)
	{
		if(p->cfd==temp)
		{
			ptr=p;
			if(p==*head)
			{
	
				*head=p->next;
				
				free(ptr);
				
				break;
			}
			else
			{
				struct cli_info *q=*head;
				
				while(q->next!=p)
				
					q=q->next;
				
				q->next=p->next;
				
				free(ptr);
				
				break;
			}
		}
		p=p->next;
	}

}
////////////////////////////////////////main函数///////////////////
int main()
{

	int ret;

	int sockfd=socket_init();
	
	struct cli_info *head=NULL,*pnew=NULL,*p=NULL,*del=NULL;
	
	struct sockaddr_in cliaddr;
	
	int addrlen=sizeof(struct sockaddr_in);	
	
	int efd,cfd,count,temp;
	
	struct epoll_event  ev,evs[100];
	
	efd=epoll_create(100);
	
	if(efd<0)
	{
		perror("epoll_create");
	
		close(sockfd);

		return -1;
	}

	ev.events=EPOLLIN;

	ev.data.fd=sockfd;
	
	ret=epoll_ctl(efd,EPOLL_CTL_ADD,sockfd,&ev);
	if(ret<0)
	{
		perror("epoll_ctl");
		return -1;
	}
	
	while(1)
	{
		printf("wait\n");
	
		count=epoll_wait(efd,evs,10,-1);
		if(count<0)
		{
			perror("epoll_wait");
			return -1;	
		}
		
		for(int i=0;i<count;i++)
		{
			temp=evs[i].data.fd;
			if(temp==sockfd)
			{
				pnew=malloc(sizeof(struct cli_info));	
		
				printf("accept\n");
				
				cfd =accept(sockfd,(struct sockaddr*)&cliaddr,&addrlen);	
				
				if(cfd==-1)
				{
					perror("accept");
					return -1;
				}
				
				ev.events=EPOLLIN;
				
				ev.data.fd=cfd;
				
				epoll_ctl(efd,EPOLL_CTL_ADD,cfd,&ev);
				
				pnew->num=0;
				
				strcpy(pnew->passwd,"0");
				
				pnew->cfd=cfd;
				
				pnew->port=ntohs(cliaddr.sin_port);
				
				inet_ntop(AF_INET,&cliaddr.sin_addr.s_addr,pnew->ip,sizeof(pnew->ip));
				
				pnew->next=head;
				
				head=pnew;
				
				printf("客户端[%d|%s]连接成功！\n",pnew->port,pnew->ip);	
			}else
			{
				struct pack p;
				
				ret =read(temp,&p,sizeof(struct pack));
				if(ret ==0)
				{

					printf("tcp broken %d\n",__LINE__);
				
					close_file(head,temp);
					
					epoll_ctl(efd,EPOLL_CTL_DEL,temp,NULL);	
					
					del_link(&head,temp);
					
					close(temp);				
				}else if(ret<0)
				{
					printf("read error%d\n",__LINE__);
					
					close_file(head,temp);
					
					epoll_ctl(efd,EPOLL_CTL_DEL,temp,NULL);	
					
					del_link(&head,temp);
					
					close(temp);				
				}else{
					
					name(&head,p,temp);
				}
			}
		}

	}
}
///////////////////////////上传文件//////////////////////////////////
int send_o(struct cli_info *head, int cfd,struct pack p)
{

	int ret;
	
	char buff[1024];
	
  char buff1[1024];

	int fd_write;
	
	int length;
	
	int sum=0;
	
	struct pack pa;
	
	int bytes_read,bytes_write;
	
	ret =read(cfd,buff,p.lenth);
	
	buff[ret]='\0';
	
	printf("%s\n",buff);
	
	fd_write=open(buff,O_CREAT|O_WRONLY|O_TRUNC,0644);
	
	if(fd_write==-1)
	{		
		perror("open");
		return -1;
	}
	
	char buf[255];
	
	sprintf(buf,"upload %s",buff);
	
	mysql_record(cfd,buf,head);

	printf("open over,%d\n",__LINE__);

	ret=read(cfd,&pa,sizeof(struct pack));
	
	if(ret<0)
	{
		perror("read");
		return -1;
	}else if(ret==0)
	{
		printf("TCP broken\n");
		return -1;
	}
	if(pa.type==SEND_FILE)
	{
		length=pa.lenth;
	
		printf("pa.lenth:%d,sum:%d\n",pa.lenth,sum);
	
		while(1)
		{
			bytes_read=read(cfd,buff1,sizeof(buff1));
		
			printf("bytes_read:%d\n",bytes_read);
			
			printf("length:%d,%d`\n",length,__LINE__);
			
			if(bytes_read>0)
			{
			
				sum+=bytes_read;
				
				if(length<1024)
				{
					bytes_write=write(fd_write,buff1,bytes_read);
				
					break;
				}
			
				bytes_write=write(fd_write,buff1,bytes_read);
				
				if(bytes_write==-1)
				{
					perror("write");
					return -1;
				}else if(bytes_write==0)
				{
					break;
				}
				printf("sum:%d,%d\n",sum,__LINE__);

				if(sum>=length)
				{

					break;
				}
			}
		}
	}

	printf("send over\n");
	
	return 0;
}



///////////////////////////

int name(struct cli_info **head,struct pack p,int cfd)
{
	p.type=p.type ^ KEY;

	printf("name :type :%d\n",p.type);

	if(p.type==SEND)
	{
		order(*head,p,cfd);//终端命令				

		show(*head);

	}else if(p.type==REG)
	{
		reg_ok(cfd,p);//注册
	
	}else if(p.type==SEND_O)
	{
		send_o(*head,cfd,p);//上传

		show(*head);
	
	}else if(p.type==REC_O)
	{
		rec_o(*head,cfd,p);//下载

		show(*head);

	}else if(p.type==LOG)
	{
		log_ok(head,cfd,p);//登录
	
		show(*head);
	
	}else if(p.type==CHO)
	{
		
		send_link(*head,cfd);
	
		show(*head);

	}else if(p.type==EXIT)
	{
	
		exit_ok(cfd,p,head);	

	}else if(p.type==SHOW)
	{
	
		printf("show\n");
		
		show_mysql(cfd,p);

	}else if(p.type==RECORD)
	{
	
		record_mysql(cfd,p);
	
	}


}
/////////////////下载文件//////////////////////////
int rec_o(struct cli_info *head,int cfd,struct pack p)
{

	
	int ret,ret1;

	char buff[1024];
	
	char buff1[1024];
	
	int fd_write;
	
	int bytes_read,bytes_write;
	
	ret =read(cfd,buff,p.lenth);
	
	buff[ret]='\0';
	
	printf("file:%s,%d\n",buff,p.lenth);
	
	FILE *fp=NULL;
	
	long length;
	
	//以二进制读文件方式打开文件
	fp=fopen(buff,"rb");
	
	if(fp==NULL)
		printf("file not found!\n");
	else
	{
		//把文件的位置指针移到文件尾
		fseek(fp,0L,SEEK_END);
	
		//获取文件长度;
		length=ftell(fp);
		
		printf("该文件的长度为%ld字节\n",length);
		
		fclose(fp);
	} 

	printf("length:%ld,%d\n",length,__LINE__);

	int fd =open(buff,O_RDONLY);
	
	if(ret<0)
	{
		perror("open");
		return -1;
	}	
	
	printf("fd:%d\n",fd);		

	char buf[255];
	
	sprintf(buf,"download %s",buff);
	
	mysql_record(cfd,buf,head);

	struct pack pa;

	pa.type = REC_FILE;
	
	pa.lenth = length;
	
	ret = write(cfd,&pa,sizeof(struct pack));
	
	if(ret <= 0)
	{
		perror("write");
		return -1;
	}else
	{


		while(length > 0)
		{
			ret = read(fd,buff1,sizeof(buff1));
	
			printf("length:%ld,%d\n",length,__LINE__);
			//			printf("ret:%d,%d,buff:%s\n",ret,__LINE__,buff1);
			
			if(ret<0)
			{
				printf("read error\n");
				return -1;
			}
			else if(ret ==0)				
			{
				printf("read over\n");
				break;
			}
			else if(ret==1024)
			{
			
				ret1= write(cfd,buff1,ret);
				
				printf("ret1:%d\n",ret1);
			}
			else if(ret==length)
			{
				ret1= write(cfd,buff1,ret);
				
				printf("ret1:%d\n",ret1);	
			}

			length-=ret;
		}
	}

	printf("rec over\n");
	
	return 0;
}


////////////////////////////接收命令//////////////////////////

int order(struct cli_info *head,struct pack p,int cfd)
{

	int ret;
	
	char buff[1024];
	
	char ptr[1024];
	
	char line[1024];
	
	struct pack *pa=NULL,*tr=NULL;
	
	int i=1;
	
	ret=read(cfd,&ptr,p.lenth);
	
	printf("ret:%d\n",ret);
	
	ptr[ret]='\0';
	
	printf("ptr :%s\n",ptr);	
	
	int fd;	
	
	sprintf(line,"%s>>./.file",ptr);
	
	printf("%s\n",line);	
	
	ret =system(line);
	
	if(ret<0)
	{
		perror("system");
		return -1;
	}
	
	char buf[255];
	
	sprintf(buf,"order: %s",ptr);
	
	mysql_record(cfd,buf,head);

	fd =open("./.file",O_RDONLY);
	if(ret<0)
	{
		perror("open");
		return -1;
	}	
	while(1)
	{
		
		ret =read(fd,buff,sizeof(buff));
	
		if(ret<0)
		{
			printf("read error\n");
			return -1;
		}else if(ret ==0)
		{	
			tr=malloc(sizeof(struct pack));
		
			tr->type=ENDL;	
			
			write(cfd,tr,sizeof(struct pack));
			
			break;
		}

		pa=malloc(sizeof(struct pack)+strlen(buff));
		
		pa->lenth=ret;
	
		pa->type=RED;
		
		memcpy(pa->data,buff,ret);
		
		ret=write(cfd,pa,sizeof(struct pack)+ret);
		
		if(ret==-10)
		{
			break;
		}				

		//	printf("write :ret:%d\n",ret); 
		//	buff[ret]='\0';
		//	printf("%s\n",buff);
	}	

	close(fd);

	system("rm   ./.file  -f");

	printf("order over\n");
	
	return 0;
}
