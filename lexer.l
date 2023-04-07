%{
#include <stdio.h>
#include "parser.tab.h"

int NLines=1;

%}
%option noyywrap

%%
    /* symbols */
[ \t] ;
"#"(.)*[\n] {NLines++;}; 

"+"|"-"|"*"|"/"|":"|";"|"["|"]"|"("|")"|"{"|"}"|"="|","|"." { return yytext[0]; }

">="        return GT;
"<="        return LT;
"=="        return EQUAL;
"!="        return NOTEQUAL;
"\""        return DQT;
"\'"        return SQT;
[\n]        {NLines++; };

    /* keywords */
"import"        return KEY_IMPORT;
"from"          return KEY_FROM;
"as"            return KEY_AS;
"class"         return KEY_CLASS;
"def"           return KEY_DEF;
"return"        return KEY_RETURN;
"print"         return KEY_PRINT;
"if"            return KEY_IF;
"and"           return KEY_AND;
"or"            return KEY_OR;
"for"           return KEY_FOR;
"in"            return KEY_IN;
"range"         return KEY_RANGE;
"items"         return KEY_ITEMS;
"setdefault"    return KEY_SETDEFAULT;
"lambda"        return KEY_LAMBDA;

    /* data types */
[a-zA-Z_][a-zA-Z0-9_]*          { return ID; }
[-|+]*[0-9][0-9]*               { return INTEGER; }
[-|+]*[0-9][0-9]*"."[0-9][0-9]* { return DOUBLE; }
[0-9a-zA-Z_]*                   { return CHARS; }
\"[^"\n]*\"|\'[^'\n]*\'         { return STR; }
%%
