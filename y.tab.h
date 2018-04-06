
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     BEGIN = 258,
     END = 259,
     ASGN = 260,
     SC = 261,
     MPY = 262,
     DIV = 263,
     MOD = 264,
     ADD = 265,
     LP = 266,
     RP = 267,
     SUB = 268,
     NEQ = 269,
     LT = 270,
     GT = 271,
     LE = 272,
     GE = 273,
     EQ = 274,
     IF = 275,
     THEN = 276,
     ELSE = 277,
     WHILE = 278,
     DO = 279,
     PROGRAM = 280,
     VAR = 281,
     AS = 282,
     INT = 283,
     WRITEINT = 284,
     READINT = 285,
     NUM = 286,
     ID = 287
   };
#endif
/* Tokens.  */
#define BEGIN 258
#define END 259
#define ASGN 260
#define SC 261
#define MPY 262
#define DIV 263
#define MOD 264
#define ADD 265
#define LP 266
#define RP 267
#define SUB 268
#define NEQ 269
#define LT 270
#define GT 271
#define LE 272
#define GE 273
#define EQ 274
#define IF 275
#define THEN 276
#define ELSE 277
#define WHILE 278
#define DO 279
#define PROGRAM 280
#define VAR 281
#define AS 282
#define INT 283
#define WRITEINT 284
#define READINT 285
#define NUM 286
#define ID 287




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


