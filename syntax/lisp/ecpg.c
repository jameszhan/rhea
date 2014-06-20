/* Processed by ecpg (4.9.0) */
/* These include files are added by the preprocessor */
#include <ecpglib.h>
#include <ecpgerrno.h>
#include <sqlca.h>
/* End of automatic include section */

#line 1 "ecpg.sql"
create table people (id serial primary key, name varchar(50));
insert into people (name) values ('Tony');
insert into people (name) values ('Bob');
insert into people (name) values ('Mary');
