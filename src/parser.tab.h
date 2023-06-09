/* A Bison parser, made by GNU Bison 3.7.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_HOME_LOATHINGKERNEL_PROJECTS_CEID_PROJECTS_ARXES_GLOSSON_BUILD_PARSER_TAB_H_INCLUDED
# define YY_YY_HOME_LOATHINGKERNEL_PROJECTS_CEID_PROJECTS_ARXES_GLOSSON_BUILD_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    KEY_IMPORT = 258,              /* KEY_IMPORT  */
    KEY_FROM = 259,                /* KEY_FROM  */
    KEY_AS = 260,                  /* KEY_AS  */
    KEY_CLASS = 261,               /* KEY_CLASS  */
    KEY_DEF = 262,                 /* KEY_DEF  */
    KEY_PRINT = 263,               /* KEY_PRINT  */
    KEY_IF = 264,                  /* KEY_IF  */
    KEY_FOR = 265,                 /* KEY_FOR  */
    KEY_IN = 266,                  /* KEY_IN  */
    KEY_RANGE = 267,               /* KEY_RANGE  */
    KEY_RETURN = 268,              /* KEY_RETURN  */
    KEY_LAMBDA = 269,              /* KEY_LAMBDA  */
    KEY_SETDEFAULT = 270,          /* KEY_SETDEFAULT  */
    KEY_ITEMS = 271,               /* KEY_ITEMS  */
    KEY_OR = 272,                  /* KEY_OR  */
    KEY_AND = 273,                 /* KEY_AND  */
    STR = 274,                     /* STR  */
    INTEGER = 275,                 /* INTEGER  */
    DOUBLE = 276,                  /* DOUBLE  */
    CHARS = 277,                   /* CHARS  */
    ID = 278,                      /* ID  */
    AND = 279,                     /* AND  */
    OR = 280,                      /* OR  */
    NOTEQUAL = 281,                /* NOTEQUAL  */
    LT = 282,                      /* LT  */
    GT = 283,                      /* GT  */
    DQT = 284,                     /* DQT  */
    SQT = 285,                     /* SQT  */
    EQUAL = 286                    /* EQUAL  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_HOME_LOATHINGKERNEL_PROJECTS_CEID_PROJECTS_ARXES_GLOSSON_BUILD_PARSER_TAB_H_INCLUDED  */
