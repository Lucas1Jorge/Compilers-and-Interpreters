%{
#define	ACEITA	1
#define 	OUTRA 	2
%}
delim		[ \t\n\r]
ws			{delim}+
par_1	0*(10*10*)*
impar_0	1*0(1*01*0)*1*
aceita	{par_1}|{impar_0}
string	[^ \t\n\r]+
%%
{ws}		{ ;}
{aceita}   	{return ACEITA;}
{string}	{return OUTRA;}
%%
main () {
	int i;
	while (i = yylex ())
		switch (i) {
			case ACEITA:
				printf ("%-20s: Aceita\n", yytext); 
				break;
			case OUTRA:
				printf ("%-20s: Rejeitada\n", yytext); 
				break;
		}
} 
