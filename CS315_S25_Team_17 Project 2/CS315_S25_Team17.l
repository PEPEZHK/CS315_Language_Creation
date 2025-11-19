%option yylineno
%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern FILE *yyin;
extern int yyparse();  // Explicit declaration
%}
letter       [a-zA-Z_$]
digit        [0-9]
float        {digit}*(\.)?{digit}+
alphanumeric ({letter}|{digit})
int          {digit}+          
identifier   {letter}({alphanumeric}|_)*
bool         (true)|(false)
string       \"[^\"]*\"
%x COMMENT
%%
begin        { return BEGIN_TOK; }
end          { return END_TOK; }
if           { return IF_TOK; }
else         { return ELSE_TOK; }
while        { return WHILE_TOK; }
for          { return FOR_TOK; }
display      { return DISPLAY_TOK; }
read         { return READ_TOK; }
void         { return VOID_TOK; }
return       { return RETURN_TOK; }
new          { return NEW_TOK; }
null         { return NULL_TOK; }
{int}        { sscanf(yytext, "%d", &yylval.intVal); return INTEGER_CONST; }
{float}      { sscanf(yytext, "%lf", &yylval.doubleVal); return FLOAT_CONST; }
{bool}       { yylval.boolVal = (strcmp(yytext, "true") == 0) ? 1 : 0; return BOOLEAN_CONST; }
"int"        { return INT_TOK; }
"float"      { return FLOAT_TOK; }
"bool"       { return BOOL_TOK; }
{identifier} { yylval.stringVal = strdup(yytext); return IDENTIFIER_TOK; }
\&\&         { return AND_TOK; }
\|\|         { return OR_TOK; }
\=           { return ASSIGN_TOK; }
\+           { return ADD_OP; }
\-           { return SUB_OP; }
\*           { return MUL_OP; }
\/           { return DIV_OP; }
\%           { return MOD_OP; }
\^           { return EXP_OP; }
\!           { return NOT_OP; }
\<\=         { return LESS_EQ_OP; }
\>\=         { return GREAT_EQ_OP; }
\<           { return LESS_OP; }
\>           { return GREAT_OP; }
\=\=         { return EQUAL_OP; }
\!\=         { return NOT_EQ_OP; }
\(           { return LP; }
\)           { return RP; }
\{           { return LCB; }
\}           { return RCB; }
\[           { return LSP; }
\]           { return RSP; }
\;           { return SC; }
\,           { return COMMA; }
{string}     { yylval.stringVal = strdup(yytext); return STRING; }
[ \t]+       ;  // Ignore whitespace
\n           ;
\/\/.*       { return COMMENT_ONE_LINE_TOK; }
\/\* { BEGIN(COMMENT);}  // Enter COMMENT mode at the start of a block comment
<COMMENT>{
    \n      ;  // Count newlines inside the comment
    \*\/   { BEGIN(INITIAL); return COMMENT_BLOCK_TOK; }  // Exit COMMENT mode at the end of the comment
[ \t]+       ;  // Ignore whitespace
.	     ;
}
.            {fprintf(stderr, "Syntax error on line: %d", yylineno); exit(1); }
%%
int yywrap() { return 1; }