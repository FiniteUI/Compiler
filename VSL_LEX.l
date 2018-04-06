%{

#include "y.tab.h"
#include <stdio.h>
#include <string.h>
int wrap = 1;
int line = 0;

%}

COMMENT %.*\n
DELIM   [ \t\n]
WS      {DELIM}+|{COMMENT}+
DIGIT 	[0-9]
NUMBER	(\+|\-)?{DIGIT}+
LETTER	[A-Z]
IDENT	{LETTER}({LETTER}|{DIGIT})*

%%
"\n"		{line++;}
{WS}		{}
begin		{return(BEGIN);}
end		{return(END);}
:=		{return(ASGN);}
;		{return(SC);}
\*		{return(MPY);}
div		{return(DIV);}
mod		{return(MOD);}
\+		{return(ADD);}
"("		{return(LP);}
")"		{return(RP);}
\-		{return(SUB);}
!=		{return(NEQ);}
\<		{return(LT);}
\>		{return(GT);}
"<="		{return(LE);}
">="		{return(GE);}
\=		{return(EQ);}
if		{return(IF);}
then		{return(THEN);}
else		{return(ELSE);}
while		{return(WHILE);}
do		{return(DO);}
program		{return(PROGRAM);}
var		{return(VAR);}
as		{return(AS);}
int		{return(INT);}
writeInt	{return(WRITEINT);}
readInt		{return(READINT);}
{NUMBER}	{yylval = strdup(yytext); return(NUM);}
{IDENT}		{yylval = strdup(yytext); return(ID);}
.		{printf("Unrecognized token %s in line %d\n", yytext, line);}

%%

int yywrap() {
	return wrap;
}
