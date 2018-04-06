%{
#include <stdio.h>
#define yycode printf

char *gen_label()
{
    static int i = 1000;
    char *temp = malloc(5);
    char *temp1 = malloc(5);
    temp1[1] = '\0';
    sprintf(temp,"%04d",i++);
    strcat(temp1, temp);
    temp1[0] = 'L';
    return temp1;
}

%}

%token BEGIN
%token END
%token ASGN
%token SC
%token MPY
%token DIV
%token MOD
%token ADD
%token LP
%token RP
%token SUB
%token NEQ
%token LT
%token GT
%token LE
%token GE
%token EQ
%token IF
%token THEN
%token ELSE
%token WHILE
%token DO
%token PROGRAM
%token VAR
%token AS
%token INT
%token WRITEINT
%token READINT
%token NUM
%token ID


%left EQ
%left LT
%left GT
%left LE
%left GE
%left NEQ
%left SUB
%left ADD
%left MOD
%left DIV
%left MPY


%%

prog:	PROGRAM
	{yycode("Section	.data\n");}
	dec BEGIN
	{yycode("Section	.code\n");}
	statementSequence END
	{yycode("HALT\n");}
    ;
    
dec:	VAR ID AS type SC
	{yycode("%s:	word", $2); yycode("\n");}
	dec
   |
   ;
    
type:	INT
    ;
    
statementSequence:	statement SC statementSequence
		|
		;
		
statement:	assignment
	 |	ifStatement
	 |	whileStatement
	 |	writeInt 
	 |
	 ;

assignment:	ID 
		{yycode("LVALUE %s", $1); yycode("\n");} 
		ASGN assignEnd
          ;

assignEnd: 	expression 
		{yycode("STO\n");}
	 |	READINT 
	 	{yycode("READ\n"); yycode("STO\n");}
	 ;
	 
ifStatement:	IF expression 
		{$$ = strdup(gen_label()); yycode("GOFALSE %s", $$); yycode("\n");}
		THEN statementSequence 
		{yycode("LABEL %s", $3); yycode("\n");}
		elseClause
		END
	   ;
	 
elseClause:	ELSE
		{$$ = strdup(gen_label()); yycode("GOTO %s", $$); yycode("\n");}
		statementSequence
		{yycode("LABEL %s", $2); yycode("\n");}
          |
          ;
          
whileStatement:	WHILE 
		{$$ = strdup(gen_label()); yycode("LABEL %s", $$); yycode("\n");}
		expression 
		{$$ = strdup(gen_label()); yycode("GOFALSE %s", $$); yycode("\n");}
		DO statementSequence 
		{yycode("GOTO %s", $2); yycode("\n");}
		{yycode("LABEL %s", $4); yycode("\n");}
		END
	      ;

writeInt:	WRITEINT expression
		{yycode("PRINT\n");}
        ;
        
expression:	simpleExpression
          |	simpleExpression EQ expression
          	{yycode("EQ\n");}
          |	simpleExpression NEQ expression
          	{yycode("NEQ\n");}
          |	simpleExpression LT expression
          	{yycode("LT\n");}
          |	simpleExpression GT expression
          	{yycode("GT\n");}
          |	simpleExpression LE expression
          	{yycode("LE\n");}
          |	simpleExpression GE expression
          	{yycode("GE\n");}
          ;

simpleExpression:	term ADD simpleExpression
			{yycode("ADD\n");}
		|	term SUB simpleExpression
			{yycode("SUB\n");}
		|	term
		;

term:	factor MPY term
	{yycode("MPY\n");}
    |	factor DIV term
    	{yycode("DIV\n");}
    |	factor MOD term
    	{yycode("MOD\n");}
    |   factor
    ;

factor:	ID
	{yycode("RVALUE %s", $1); yycode("\n");}
      | NUM
      	{yycode("PUSH %s", $1); yycode("\n");}
      | LP expression RP
      ;
      
%%
#include "lex.yy.c"

main() 
{
yyparse();
}

yyerror(char *s)
{
    printf("%s\n", s);
}



