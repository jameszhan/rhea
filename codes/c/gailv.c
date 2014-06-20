int main(void)
{
  int a,b,c,d,e,p;float f=0,g=0,h=0,i=0,j;
  for(a=0;a<=5;a++)
    for(b=0;b<=5;b++)
      for(c=0;c<=5;c++)
	for(d=0;d<=5;d++)
	{
	    e=a+b+c+d;
	    p=e%4;
	    switch(p)
	      {
	      case 1: f++;break;
	      case 2: g++;break;
	      case 3: h++;break;
	      case 0: i++;break;
	      default:printf("error\n");}
	  }
  printf("f=%f\n",f);
  printf("g=%f\n",g);
  printf("h=%f\n",h);
  printf("i=%f\n",i);
  j=f+g+h+i;
  printf("sum=%f\n",j);
  f=f/j;
  g=g/j;
  h=h/j;
  i=i/j;
  printf("\n1=%f\n",f);
  printf("2=%f\n",g);
  printf("3=%f\n",h);
  printf("0=%f\n\n",i);
  return 0;
}
