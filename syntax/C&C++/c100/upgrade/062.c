#include<stdio.h>
#include<stdlib.h>

#define MAX 100

struct 	addr{
	char	name[20];
	char	street[40];
	char	city[20];
	char	state[40];
	unsigned long	zip;
} addr_list[MAX];

void init_list(void);
void enter(void);
void del(void);
void list(void);
void save(void);
void load(void);
int menu_select(void);
int find_free(void);

int main(void){
	char choice;
	init_list();

	while(1){
		choice = menu_select();
		switch(choice){
			case 1:
				enter();
				break;
			case 2:
				del();
				break;
			case 3:
				list();
				break;
			case 4:
				save();
				break;
			case 5:
				load();
				break;
			case 6:
				exit(0);
				break;
		}
	}

}

void init_list(void){
	register int t;
	for(t = 0; t < MAX; t++){
		addr_list[t].name[0] = '\0';
	}
}

void enter(void){
	int slot;
	char str[80];
	slot = find_free();
	if(slot == -1){
		printf("\nList Full\n");
	}

	printf("Enter name: ");
	gets(addr_list[slot].name);

	printf("Enter street: ");
	gets(addr_list[slot].street);

	printf("Enter city: ");
	gets(addr_list[slot].city);
	
	printf("Enter state: ");
	gets(addr_list[slot].state);

	printf("Enter zip: ");
	gets(str);
	addr_list[slot].zip = strtoul(str, '\0', 10);

}


void del(void){
	register int slot;
	char str[80];

	printf("Enter record #: ");
	gets(str);
	slot = atoi(str);
	
	if(slot >= 0 && slot < MAX){
		addr_list[slot].name[0] = '\0';
	}
}

void list(void){
	register int t;
	for(t = 0; t < MAX; t++){
		if(addr_list[t].name[0]){
			printf("%s\n", addr_list[t].name);
			printf("%s\n", addr_list[t].street);
			printf("%s\n", addr_list[t].city);
			printf("%s\n", addr_list[t].state);
			printf("%ld\n\n", addr_list[t].zip);
		}
	}
	printf("\n\n");
}

void save(void){
	FILE* fp;
	register int i;
	
	if((fp = fopen("maillist", "wb")) == NULL){
		printf("Cannot open file. \n");
	}
	
	for(i = 0; i < MAX; i++){
		if(*addr_list[i].name){
			if(fwrite(&addr_list[i], sizeof(struct addr), 1, fp) != 1){
				printf("File write error.\n");
			}
		}
	}
	
	fclose(fp);
}


void load(void){
	FILE* fp;
	register int i;
	
	if((fp = fopen("maillist", "rb")) == NULL){
		printf("Cannot open file. \n");
	}
	
	init_list();

	for(i = 0; i < MAX; i++){
		if(fread(&addr_list[i], sizeof(struct addr), 1, fp) != 1){
			if(feof(fp)){
				break;
			}
			printf("File read error.\n");
		}
	}
	
	fclose(fp);
	
}



int menu_select(void){
	char str[80];
	int c;

	printf("1. Enter a name\n");
	printf("2. Delete a name\n");
	printf("3. List the file\n");
	printf("4. Save the file\n");
	printf("5. Load the file\n");
	printf("6. Quit\n");
	do{
		printf("\nEnter your choice: ");
		gets(str);
		c = atoi(str);		
	}while(c < 0 || c > 6);
	
	return c;
}

int find_free(void){
	register int t;
	for(t = 0; addr_list[t].name[0] && t < MAX; t++);

	if(t == MAX){
		return -1;
	}
	return t;
}
