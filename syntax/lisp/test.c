/* Processed by ecpg (4.9.0) */
/* These include files are added by the preprocessor */
#include <ecpglib.h>
#include <ecpgerrno.h>
#include <sqlca.h>
/* End of automatic include section */

#line 1 "test.pgc"
#include <stdio.h>int main(){   
	/* Setup database connection -- replace postgres/password w/ the      
	username/password on your system*/   
	{ ECPGconnect(__LINE__, 0, "unix:postgresql://localhost/test" , "postgres" , "password" , NULL, 0); }
#line 4 "test.pgc"
   
	/* These variables are going to be used for temporary storage w/ the database */   
	/* exec sql begin declare section */   
	        
	
#line 7 "test.pgc"
 int my_id ;
 
#line 7 "test.pgc"
  struct varchar_1  { int len; char arr[ 200 ]; }  my_name ;
/* exec sql end declare section */
#line 8 "test.pgc"
   
	/* This is the statement we are going to execute */   
	/* declare test_cursor cursor for select id , name from people order by name */
#line 11 "test.pgc"
   
	/* Run the statement */   
	{ ECPGdo(__LINE__, 0, 1, NULL, 0, ECPGst_normal, "declare test_cursor cursor for select id , name from people order by name", ECPGt_EOIT, ECPGt_EORT);}
#line 13 "test.pgc"
   
	/* exec sql whenever not found  goto  close_test_cursor ; */
#line 14 "test.pgc"
   
	while(1) /* our previous statement will handle exitting the loop */   
	{      
		/* Fetch the next value */      
		{ ECPGdo(__LINE__, 0, 1, NULL, 0, ECPGst_normal, "fetch test_cursor", ECPGt_EOIT, 
	ECPGt_int,&(my_id),(long)1,(long)1,sizeof(int), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, 
	ECPGt_varchar,&(my_name),(long)200,(long)1,sizeof(struct varchar_1), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, ECPGt_EORT);
#line 18 "test.pgc"

if (sqlca.sqlcode == ECPG_NOT_FOUND) goto close_test_cursor;}
#line 18 "test.pgc"
      
		printf("Fetched ID is %d and fetched name is %s\n", my_id, my_name.arr);   
	}   
	/* Cleanup */   
	close_test_cursor:   
	{ ECPGdo(__LINE__, 0, 1, NULL, 0, ECPGst_normal, "close test_cursor", ECPGt_EOIT, ECPGt_EORT);}
#line 23 "test.pgc"
   
	{ ECPGdisconnect(__LINE__, "CURRENT");}
#line 24 "test.pgc"
   
	return 0;
}
