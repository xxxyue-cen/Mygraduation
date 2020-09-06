#include "client/client.h"



/////////////////////一级菜单///////////////////////////////////

 int UserNum  = 0;  //用户账号  登录以后获取

int menu(int sockfd)
{
	int i;

	system("clear");
	while(1)
	{

		printf("\033[33m%s\033[0m",MENU);

		scanf("%d",&i);
		switch(i)
		{
			case 1:
				write_msg(sockfd);
				break;
			case 2:
				log_in(sockfd);
				break;
			case 3:
				exit(0);  
				break;
		}
	}
}




//////////////////////////获取更多权限
int flag = 0;

int menu3(int sockfd)
{
	int i;

	while(1)
	{

		printf("\033[33m%s\033[0m",MENU3);

		printf("请输入选择:\n");

		scanf("%d",&i);

		switch(i)
		{
			case 1:

				choose(sockfd);
				break;

			case 2:

				record_mysql(sockfd);
				break;

			case 3:

				show_mysql(sockfd);
				break;

			case 4:

				exit(0);
				break;
		}
	}
}
int get_right(int sockfd)			
{
	char passWord[32];

	char passwd[32] = "admin";

	while(getchar() != '\n');

	printf("请输入密码:\n");

	getpasswd(passWord, 32);

	//	printf("你输入的密码是:%s\n", passWord);

	if(0 == strcmp(passWord,passwd))
	{
		printf("\n密码正确\n");
		menu3(sockfd);

	}else
	{

		printf("\n密码错误\n");
		exit(0);

	}
}

////////////////////记录/////////////////////
int record_mysql(int sockfd)
{
	int ret;

	int buff;

	char name[32];

	struct pack *pa = NULL;

	char a;	

	struct pack pag;

	pa = malloc(sizeof(struct pack)+sizeof(char));

	pa->lenth = sizeof(char);

	pa->type = RECORD;

	pa->type=pa->type ^KEY;

//	printf("type : %d %d\n",pa->type,__LINE__);

	while(getchar() != '\n');

	printf("是否查看用户操作\n");

	scanf("%c",&a);

	if(a == 'y')
	{

		memcpy(pa->data,&a,sizeof(char));

		ret = write(sockfd,pa,sizeof(struct pack)+sizeof(char));
		//		printf("a:%c\n",a);
		if( ret < 0)
		{
			perror("write");
		}

		struct mysql_msg  my;

		int i = 1;

		struct buff_msg   my_buff;

		while(1)
		{

			ret = read(sockfd,&pag,sizeof(struct pack));

			if(ret < 0)
			{
				perror("read");
			}
			//			printf("type:%d\n",pag.type);
			if(pag.type == RECORD_NAME)
			{


				read(sockfd,name,pag.lenth);

				if(strcmp(name,"时间") == 0)

					printf("\t");

				else if(strcmp(name,"操作") == 0)

					printf("\t");

				printf("%s\t",name);					

			}
			else if(pag.type == RECORD_ROW)
			{

				ret = read(sockfd,&my,sizeof(struct mysql_msg));

				printf("\n");				
				//				printf("my:%d\t%d\t%d\n",my.row,my.fields,__LINE__);
			}else if(pag.type == RECORD_BUFF)
			{

				ret = read(sockfd,&my_buff,sizeof(struct buff_msg));

				printf("%s\t",my_buff.buff);

				if(i%my.fields == 0)
				{
					printf("\n");
				}

				i++;

			}else if(pag.type == RECORD_END)
			{
				break;
			}
		}
	}
	return 0;
}




////////////////////////////////////查看用户数据/////////////////////////////////
int show_mysql(int sockfd)
{
	int ret;

	int buff;

	char name[32];

	struct pack *pa = NULL;

	char a;	

	struct pack pag;

	pa = malloc(sizeof(struct pack)+sizeof(char));

	pa->lenth = sizeof(char);

	pa->type = SHOW;

	pa->type=pa->type ^KEY;

	//printf("type : %d %d\n",pa->type,__LINE__);

	while(getchar() != '\n');

	printf("是否查看用户数据\n");

	scanf("%c",&a);

	if(a == 'y')
	{
		memcpy(pa->data,&a,sizeof(char));

		ret = write(sockfd,pa,sizeof(struct pack)+sizeof(char));
		//		printf("a:%c\n",a);

		if(ret < 0)
		{
			perror("write");
		}

		struct mysql_msg  my;

		int i = 1;

		struct buff_msg   my_buff;

		while(1)
		{
			ret = read(sockfd,&pag,sizeof(struct pack));

			if(ret < 0)
			{
				perror("read");
			}
			//			printf("type:%d\n",pag.type);

			if(pag.type == SHOW_NAME)
			{

				read(sockfd,name,pag.lenth);

				printf("%s\t",name);					
			}
			else if(pag.type == SHOW_ROW)
			{
				ret = read(sockfd,&my,sizeof(struct mysql_msg));

				printf("\n");				
				//				printf("my:%d\t%d\t%d\n",my.row,my.fields,__LINE__);
			}else if(pag.type == SHOW_BUFF)
			{

				ret = read(sockfd,&my_buff,sizeof(struct buff_msg));

				printf("%s\t",my_buff.buff);

				if(i%my.fields == 0)
				{
					printf("\n");
				}

				i++;

			}else if(pag.type == SHOW_END)
			{
				break;
			}
		}
	}
	return 0;
}

////////////////////////////用户注销////////////////////

int exit_msg(int sockfd)
{
	int ret;

	int buff;

	struct pack *pa = NULL;

	char a;	

	pa = malloc(sizeof(struct pack)+sizeof(char));

	pa->lenth = sizeof(char);

	pa->type = EXIT;


	pa->type=pa->type ^KEY;

//	printf("type : %d %d\n",pa->type,__LINE__);

	while(getchar() != '\n');

	printf("是否注销用户\n");

	scanf("%c",&a);

	if(a == 'y')
	{
		memcpy(pa->data,&a,sizeof(char));

		ret = write(sockfd,pa,sizeof(struct pack)+sizeof(char));
		//		printf("a:%c\n",a);

		if(ret < 0)
		{
			perror("write");
		}

		ret = read(sockfd,&buff,sizeof(buff));

		if(ret < 0)
		{
			perror("read");
		}else
		{
			//			printf("%d,%d\n",buff,__LINE__);					
			if(buff == EXIT_OK)
			{
				printf("注销成功!\n");
				menu(sockfd);
			}
			else
			{
				printf("注销失败!\n");
			}
		}
	}else
	{
		return 0;
	}

	return 0;
}
///////////////////////////打印用户链表///////////////////////////////////////////

int show_cli(int sockfd,struct pack pa)
{

	struct cli_info  *q = NULL, *p = NULL,*head = NULL;

	int ret;

	while(1)
	{
		p = malloc(sizeof(struct cli_info));

		ret = read(sockfd,p,sizeof(struct cli_info));

		if(ret < 0)
		{
			perror("read");
			break;
		}else if(ret == 0)
		{
			printf("tcp broken\n");
			break;
		}else
		{
			if(p->next == NULL)	
			{

				p->next = head;

				head = p;

				break;
			}

			p->next = head;

			head = p;
		}
	}
	q = head;
	while(q != NULL)
	{
		printf("id:%d\t端口:%d\tip:%s\tcfd:%d\n",q->num,q->port,q->ip,q->cfd);
		q = q->next;
	}
	return 0;
}

int choose(int sockfd)
{
	int ret;

	int buff;

	struct pack *pa = NULL;

	pa = malloc(sizeof(struct pack));

	pa->type = CHO;

	pa->type=pa->type ^KEY;

//	printf("type : %d %d\n",pa->type,__LINE__);

	ret = write(sockfd,pa,sizeof(struct pack));

	if(ret < 0)
	{
		perror("write");
		return -1;
	}

	rec_link(sockfd);

	return 0;
}


void rec_link(int cfd)
{
	int ret;

	struct pack pa;

	while(1)
	{
		ret = read(cfd,&pa,sizeof(struct pack));

		if(ret < 0)
		{
			perror("read");
			break;
		}	
		else if(ret == 0)
		{
			//			printf("tcp  broken%d\n",__LINE__);
			printf("断开成功!\n");

			break;
		}
		if(pa.type == HEAD)
		{
			show_cli(cfd,pa);
		}
		break;
	}

}


/////////////////////////////////二级菜单////////////////////////////////////




int menu2(int sockfd)
{
	int i;

	while(1)
	{
		printf("\033[33m%s\033[0m",MENU2);
		printf("请输入选择:\n");
		scanf("%d",&i);

		switch(i)
		{
			case 1:  

				system("clear");

				order(sockfd);

				break;
			case 2:

				send_order(sockfd);

				break;
			case 3:

				rec_order(sockfd);

				break;
			case 4:
				exit_msg(sockfd);

				break;
			case 5:

				exit(0);

				break;
			case 6:

				get_right(sockfd);			

				break;

			default:
				break;
		}
	}
}
////////////////////////登录/////////////////////////////////////
int  log_in(int sockfd)
{
	int ret;

	int buff;

	struct pack *pa = NULL;

	struct msg  ma;

	char passWord[32];

	char ch = 'y';

	while(ch == 'y')
	{	

		pa = malloc(sizeof(struct pack)+sizeof(struct msg));

		pa->lenth = sizeof(struct msg);

		pa->type = LOG;

		pa->type=pa->type ^KEY;

//		printf("type : %d %d\n",pa->type,__LINE__);


		printf("请输入帐号：\n");

		scanf("%d",&ma.num);

		while(getchar() != '\n');

		printf("请输入密码：\n");

		getpasswd(passWord, 32);

		strcpy(ma.passwd,passWord);
		//		printf("你输入的密码是:%s\n", ma.passwd);	

		memcpy(pa->data,&ma,sizeof(struct msg));

		ret = write(sockfd,pa,sizeof(struct msg)+sizeof(struct pack));

		if(ret < 0)
		{
			perror("write");
			break;
		}
		ret = read(sockfd,&buff,sizeof(buff));
		if(ret < 0)
		{
			perror("read");
			break;
		}else
		{
			if(buff == LOG_OK)
			{	
				printf("\n登录成功!\n");
				UserNum = ma.num; //账号唯一  
				menu2(sockfd);
				break;
			}
			else
			{
				printf("\n登录失败!\n");
				break;
			}
		}
	}
}

/////////////////////下载文件///////////////////////////////////////////////

int rec_order(int sockfd)
{
	struct pack *p = NULL;

	struct pack pa;

	char buff[1024];

	char buff1[1024];

	int length;

	int sum=0;

	int ret,ret1;

	int  fd_write;

	int bytes_write,bytes_read;

	printf("输入需要下载的文件：\n");

	scanf("%s",buff);

	p = malloc(sizeof(struct pack)+strlen(buff));

	p->type = REC_O;


	p->type=p->type ^KEY;

//	printf("type : %d %d\n",p->type,__LINE__);

	memcpy(p->data,buff,strlen(buff));

	p->lenth = strlen(buff);

	ret = write(sockfd,p,sizeof(struct pack)+strlen(buff));

	if(ret < 0)
	{	
		printf("write error%d\n",__LINE__);
		return -1;	
	}
	//	printf("open  %s,%d\n",buff,__LINE__);		
	fd_write = open(buff,O_CREAT|O_WRONLY|O_TRUNC,0644);
	if(fd_write == -1)
	{		
		perror("open");
		return -1;
	}
	//	printf("\n open over %s,%d\n",buff,fd_write);
	ret = read(sockfd,&pa,sizeof(struct pack));
	if(ret < 0)
	{
		perror("read");
		return -1;
	}else if(ret == 0)
	{
		printf("TCP  broken\n");
		return -1;

	}
	if(pa.type == REC_FILE)
	{
		length = pa.lenth;
//		printf("pa.lenth:%d",pa.lenth);
		while(1)
		{

			bytes_read = read(sockfd,buff1,sizeof(buff1));

//			printf("bytes_read:%d\n",bytes_read);

//			printf("length:%d,%d`\n",length,__LINE__);

			if(bytes_read>0)
			{
				sum += bytes_read;

				if(length < 1024)
				{

					bytes_write = write(fd_write,buff1,bytes_read);
					break;
				}
				bytes_write = write(fd_write,buff1,bytes_read);
				if(bytes_write == -1)
				{
					perror("write");
					return -1;
				}else if(bytes_write == 0)
				{
					break;
				}
				//				printf("sum:%d,%d\n",sum,__LINE__);
				if(sum >= length)
				{
					break;
				}
			}


		}
	}
	printf("下载完毕！\n");
	return 0;
}

//////////////////////////上传文件///////////////////////////////////
int send_order(int sockfd)
{
	struct pack *p = NULL;

	char buff[1024];

	char buff1[1024];

	int ret,ret1;

	printf("输入需要上传的文件：\n");

	scanf("%s",buff);

	p = malloc(sizeof(struct pack)+strlen(buff));

	p->type = SEND_O;

	p->type=p->type ^ KEY;

	//printf("type : %d %d\n",p->type,__LINE__);


	memcpy(p->data,buff,strlen(buff));

	p->lenth = strlen(buff);

	ret = write(sockfd,p,sizeof(struct pack)+strlen(buff));

	if(ret < 0)
	{	

		printf("write error%d\n",__LINE__);

		return -1;	

	}
	//	printf("%s,%d\n",buff,__LINE__);		

	FILE *fp = NULL;

	long length;

	//以二进制读文件方式打开文件
	fp = fopen(buff,"rb");

	if(fp == NULL)

		printf("file not found!\n");
	else
	{
		//把文件的位置指针移到文件尾
		fseek(fp,0L,SEEK_END);

		//获取文件长度;
		length = ftell(fp);

		printf("该文件的长度为%ld字节\n",length);

		fclose(fp);

	} 
	//	printf("%ld\n",length);

	int fd = open(buff,O_RDONLY);

	if(ret < 0)
	{
		perror("open");

		return -1;
	}	
	//	printf("fd:%d\n",fd);		

	struct pack pa;

	pa.type = SEND_FILE;

	pa.lenth = length;

	ret = write(sockfd,&pa,sizeof(struct pack));

	if(ret <= 0)
	{
		perror("write");
		return -1;
	}else
	{
		while(length > 0)
		{

			ret = read(fd,buff1,sizeof(buff1));

			//			printf("length:%ld,%d\n",length,__LINE__);
			//			printf("ret:%d,%d,buff:%s\n",ret,__LINE__,buff1);
			if(ret < 0)
			{

				printf("read error\n");
				return -1;

			}
			else if(ret == 0)				
			{

				printf("read over\n");
				break;

			}
			else if(ret == 1024)
			{

				ret1 = write(sockfd,buff1,ret);
				//				printf("ret1 ==1024  :%d\n",ret1);

			}
			else if(ret == length)
			{

				ret1 = write(sockfd,buff1,ret);
				//			printf("==ret1:%d\n",ret1);	

			}

			length -= ret;
		}
	}

	printf("上传完毕！\n");

	return 0;
}


////////////////////////////////发送终端命令/////////////////////////
int order(int sockfd)
{

	char buff[1024];

	char ptr[1024];

	struct pack *p = NULL;	

	struct pack pa;

	printf("请输入终端命令:\n");

	while(getchar() != '\n');

	scanf("%[^%\n]",ptr);
	//fflush(stdin);
	//	fgets(ptr,sizeof(ptr),stdin);
	//		printf("ptr:%s",ptr);		
	//fflush(stdin);
	//		while(getchar()!='\n');

	//ptr[strlen(ptr)-1]='\0';
	//	printf("ptr:%s",ptr);		

	p = malloc(sizeof(struct pack)+strlen(ptr));

	p->type = SEND;

	p->type=p->type ^KEY;

	//printf("type : %d %d\n",p->type,__LINE__);

	int ret,fd;

	memcpy(p -> data,ptr,strlen(ptr));

	p->lenth = strlen(ptr);
	//		printf("lenth:%d\n",p->lenth);	
	fd = write(sockfd,p,sizeof(struct pack)+strlen(ptr));
	//		printf("....\n");
	//		printf("fd:%d\n",fd);
	if(fd < 0)
	{
		perror("open");
		return -1;
	}

	printf("\n显示结果：\n");

	while(1)
	{

		ret = read(sockfd,&pa,sizeof(struct pack));

		if(ret == 0)
		{
			printf("TCP Broken%d\n",__LINE__);
			return -1;
		}else if(ret < 0)
		{
			printf("read error%d\n",__LINE__);
			return -1;
		}
		if(pa.type == RED)
		{
			ret =read(sockfd,buff,pa.lenth);

			if(ret < 0)
			{

				printf("read error\n");
				return -1;

			}else if(ret == 0)
			{

				printf("TCP broken\n");
				return -1;

			}else if(ret > 0)
			{
				//	printf("read ret:%d\n",ret);

			buff[ret] = '\0';		

				printf("%s\n",buff);			

			}
		}
		else if(pa.type == ENDL)
		{

			printf("执行成功！ \n");

			break;
		}
	}

	return 0;
}

////////////////////////socket初始化/////////////////////
int socket_init()
{
	int sockfd,ret;

	struct sockaddr_in cliaddr;

	int addrlen = sizeof(struct sockaddr_in);

	int port;

	char ip[128];

	char temp[128];

	FILE *fp = NULL;

	//fp=fopen("/home/yisheng/pro3/server.conf","r");

	fp = fopen("./server.conf","r");

	if(fp == NULL)
	{
		printf("fopen failed.\n");
		return -1;
	}

	int i;

	while(fgets(temp,sizeof(temp),fp) != NULL)
	{

		if((strncmp(temp,"port",4)) == 0)

		{
			for(i = 0;i < strlen(temp);i++)

			{
				if(temp[i] >= '0' && temp[i] <= '9')
					break;
			}

			strcpy(temp,&temp[i]);

			temp[strlen(temp) - 1] = '\0';

			port = atoi(temp);
		}
		else if((strncmp(temp,"ip",2)) == 0)
		{

			for(int i=0;i<strlen(temp);i++)
			{
				if(temp[i] >= '0' && temp[i] <= '9')

					break;
			}

			strcpy(temp,&temp[i]);

			temp[strlen(temp) - 1] = '\0';

			strcpy(ip,temp);
		}

	}


	if((sockfd = socket(AF_INET,SOCK_STREAM,0))<0)
	{
		perror("socket");
		return -1;
	}

	cliaddr.sin_family = AF_INET;

	cliaddr.sin_port = htons(port);

	inet_pton(AF_INET,ip,&cliaddr.sin_addr.s_addr);

	ret = connect(sockfd,(struct sockaddr*)&cliaddr,sizeof(struct sockaddr_in));

	printf("connect \n");

	if(ret<0)
	{
		perror("connect");
		return -1;	
	}

	return sockfd;
}

void *send_heart(void *addr)
{

//封包 发送心跳

int sock = *((int *)addr);
struct pack *pa  = NULL;

//printf("sock = %d\n",sock);

struct msg ma;
 while(1)
 {
	 	pa = malloc(sizeof(struct pack)+sizeof(struct msg));
		pa->lenth = sizeof(struct msg);
		pa->type = HERART;
		pa->type=pa->type ^KEY;
		ma.num = UserNum; //将id写入心跳包
		memcpy(pa->data,&ma,sizeof(struct  msg));
 	 int ret  = write(sock,pa,sizeof(struct  pack) + sizeof(struct msg));	
	 //printf("发送心跳包 ret = %d \n",ret);
   free(pa);
	pa = NULL;
 	sleep(3); //定时3秒 

 }

 return NULL;
}


////////////////////////////////////////////////////////////////////////////
int main()
{

	int sockfd;

	pthread_t pid;
	//socket连接
	sockfd = socket_init();

	pthread_create(&pid,NULL,send_heart,(void *)&sockfd);
	pthread_detach(pid);

	menu(sockfd);
}

////////////////////////用户注册/////////////////////////////////

int mygetch()
{

	struct termios oldt, newt;

	int ch;

	tcgetattr(STDIN_FILENO, &oldt);

	newt = oldt;

	newt.c_lflag &= ~(ICANON | ECHO);

	tcsetattr(STDIN_FILENO, TCSANOW, &newt);

	ch = getchar();

	tcsetattr(STDIN_FILENO, TCSANOW, &oldt);

	return ch;
}

int getpasswd(char *passwd, int size)
{
	int c, n = 0;
	do
	{
		c = mygetch();

		if (c != '\n' && c != 'r' && c != 127)
		{
			passwd[n] = c;

			printf("*");

			n++;
		}
		else if ((c != '\n' | c != '\r') && c == 127)//判断是否是回车或则退格
		{
			if (n > 0)
			{
				n--;
				printf("\b \b");//输出退格
			}
		}
	}while (c != '\n' && c != '\r' && n < (size - 1));

	passwd[n] = '\0';//消除一个多余的回车

	return n;
}


int write_msg(int sockfd)
{

	int ret;

	int buff;

	struct pack *pa = NULL;

	struct msg  ma;	

	char passWord[32];

	char ch = 'y';

	while(ch == 'y')
	{
		pa = malloc(sizeof(struct pack)+sizeof(struct msg));
		pa->lenth = sizeof(struct msg);
		pa->type = REG;
		pa->type=pa->type ^KEY;

		//printf("type : %d %d\n",pa->type,__LINE__);

		printf("请输入帐号：\n");

		scanf("%d",&ma.num);	

		while(getchar() != '\n');

		printf("请输入姓名：\n");

		scanf("%s",ma.name);

		while(getchar() != '\n');

		printf("请输入密码：\n");

		getpasswd(passWord, 32);

		strcpy(ma.passwd,passWord);
		//		
		//		printf("你输入的密码是:%s\n", ma.passwd);

		memcpy(pa->data,&ma,sizeof(struct msg));

		ret = write(sockfd,pa,sizeof(struct msg)+sizeof(struct pack));

		if(ret<0)
		{
			perror("write");
			break;
		}

		ret = read(sockfd,&buff,sizeof(buff));

		if(ret<0)
		{
			perror("read");
			break;

		}else
		{
			//			printf("%d,%d\n",buff,__LINE__);					
			if(buff == REG_OK)
			{
				printf("\n注册成功!\n");
				break;
			}
			else
			{
				printf("\n注册失败!\n");
				break;
			}
		}
	}
	free(pa);
	pa = NULL;
	return 0;
}

