%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern FILE *yyin;

extern int NLines;
void yyerror(const char *s);
extern char* yytext();
int yylex();

%}

/* keywords */
%token KEY_IMPORT
%token KEY_FROM
%token KEY_AS
%token KEY_CLASS 
%token KEY_DEF
%token KEY_PRINT  
%token KEY_IF 
%token KEY_FOR 
%token KEY_IN 
%token KEY_RANGE 
%token KEY_RETURN 
%token KEY_LAMBDA 
%token KEY_SETDEFAULT 
%token KEY_ITEMS
%token KEY_OR
%token KEY_AND

/* special symbols, numbers and strings */
%token STR 
%token INTEGER 
%token DOUBLE
%token CHARS
%token ID
%token AND 
%token OR 
%token NOTEQUAL 
%token LT 
%token GT 
%token DQT
%token SQT
%token EQUAL

%%

/** Complete file */
main_part:
    parts | main_part parts ;

/** Distinct program blocks */
parts:
    command | modules | class_def ;

/** Different commands */
command:
    function | print | assignment | if | for | return ;

id_parts:
    ID | ID '.' ID ;

/** Module imports */
modules:
    KEY_IMPORT module_list | KEY_FROM id_parts KEY_IMPORT var_lists ;
module_list:
    module_name | module_list ',' module_name ;
module_name:
    id_parts | id_parts KEY_AS ID ;

/** Class definitions */
class_part:
    command | func_def | class_part command | class_part func_def;
class:
    KEY_CLASS ID ':' class_part;
class_def:
    class | func_def;

/** Function definitions */
func_def:
    KEY_DEF function ':' command ;

/** Expression list used as input variables in functions */
var_lists:
    expr_vals | var_lists ',' expr_vals;

/** Variable assignment */
assignment:
    id_parts '=' expr_vals | id_parts '=' lambda;

/** Print specific parser */
print:
    KEY_PRINT '(' multi_expr_vals ')' ;

/** Return keyword specific parser */
return:
    KEY_RETURN multi_expr_vals | KEY_RETURN ;

/** If keyword parser */
if:
    KEY_IF cond_vals ':' command;

/** For keyword parser */
for:
    KEY_FOR ID KEY_IN KEY_RANGE '(' expr_vals ')' ':' command
    | KEY_FOR ID KEY_IN ID ':' command
    | KEY_FOR ID KEY_IN ID ':' list ;

/** Lambda expression parser */
lambda:
    KEY_LAMBDA var_lists ':' expr_vals;

/** setdefault and items specific parser */
setdefault:
    ID '.' KEY_SETDEFAULT '(' type ')'
    | ID '.' KEY_SETDEFAULT '(' type ',' type ')' ;

items:
    ID '.' KEY_ITEMS '(' ')' ;

/** List of possible expressions in python */
expr_vals:
    expr_parts
    | list
    | dict
    | setdefault
    | items
    | expr_vals operator expr_parts
    | expr_vals operator list
    | expr_vals operator dict
    | '(' expr_vals ')' ;

/** List parser */
list:
    '[' multi_expr_vals ']';

/** Dictionary parser */
dict:
    '{' dict_parts '}' ;
dict_parts:
    dict_kvpair | dict_parts ',' dict_kvpair ;
dict_kvpair:
    expr_parts ':' expr_parts ;

/** Comma-separated expressions and function prototype*/
multi_expr_vals:
    expr_parts | multi_expr_vals ',' expr_parts ;
expr_parts:
    id_parts | function | type;
function:
    id_parts '(' ')' | id_parts '(' var_lists ')'

/** Variable types */
type:
    STR | CHARS | INTEGER | DOUBLE ;

/** Conditional expressions */
cond_vals:
    expr_vals conditional expr_vals
    | '(' cond_vals ')'
    | cond_vals KEY_AND expr_vals
    | cond_vals KEY_OR expr_vals;

/** Arithmetic operators */
operator:
    '+' | '-' | '*' | '/' | '%' ;

/** Conditional operators */
conditional:
    '>' | '<' | NOTEQUAL | EQUAL | GT | LT ;

%% 
/** Error counter */
int errors=0;

/** Error print function */
void yyerror(const char *s) {
	++errors;
    printf("Error: %03d, Line: %d, Type: %s\n", errors, NLines, s);
}

/** Program entry */
int main(int argc, char* argv[]) {

	FILE *fileinput;
	
	/** Input file, read-only */
	fileinput = fopen(argv[1], "r");
	/** Pass FILE to the syntax analyzer */
	yyin = fileinput;

	/** Do the syntax analysis */
	yyparse();

	/** Print a status message*/
	printf("Syntax check completed.\n");
	printf("Found %d errors.\n", errors);

    /** Exit with error return code if errors where found */
	if (errors > 0) exit(1);
	else exit(0);
}


