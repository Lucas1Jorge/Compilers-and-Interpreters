%{
#define	ACEITA	1
#define 	OUTRA 	2
%}
delim		[ \t\n\r]
ws			{delim}+
not_impar_0		1*(01*01*)*
not_par_1		0*1(0*10*1)*0*
rejeita		{not_impar_0}|{not_par_1}
string	[^ \t\n\r]+
%%
{ws}		{ ;}
{rejeita}   	{return OUTRA;}
{string}	{return ACEITA;}
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
