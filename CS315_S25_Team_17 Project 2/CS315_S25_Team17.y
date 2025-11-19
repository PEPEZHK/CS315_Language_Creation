%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yyparse();
extern FILE *yyin;

void yyerror(char *s);
%}

%union {
    int intVal;
    double doubleVal;
    char* stringVal;
    int boolVal;
}

%token BEGIN_TOK END_TOK
%token IF_TOK ELSE_TOK WHILE_TOK FOR_TOK DISPLAY_TOK READ_TOK VOID_TOK RETURN_TOK NEW_TOK NULL_TOK
%token INTEGER_CONST FLOAT_CONST BOOLEAN_CONST INT_TOK FLOAT_TOK BOOL_TOK IDENTIFIER_TOK STRING
%token AND_TOK OR_TOK ASSIGN_TOK ADD_OP SUB_OP MUL_OP DIV_OP MOD_OP EXP_OP NOT_OP
%token LESS_EQ_OP GREAT_EQ_OP LESS_OP GREAT_OP EQUAL_OP NOT_EQ_OP
%token LP RP LCB RCB LSP RSP SC COMMA
%token COMMENT_ONE_LINE_TOK COMMENT_BLOCK_TOK

%type <intVal> INTEGER_CONST
%type <doubleVal> FLOAT_CONST
%type <boolVal> BOOLEAN_CONST
%type <stringVal> STRING IDENTIFIER_TOK

// Operator Precedence  - nonassoc
%left OR_TOK
%left AND_TOK
%left EQUAL_OP NOT_EQ_OP
%left LESS_OP GREAT_OP LESS_EQ_OP GREAT_EQ_OP
%left ADD_OP SUB_OP
%left MUL_OP DIV_OP MOD_OP
%right EXP_OP
%right NOT_OP
%%
program: BEGIN_TOK stmt_list END_TOK {
    printf("Input program is valid\n");
    return 0;  // bu olabilir yeni 
};
stmt_list: stmt | stmt_list stmt;
stmt: while_stmt | if_stmt | for_stmt | declaration_stmt | function_declaration | display_stmt | no_statement
    | return_stmt | comment_block | comment_line | exp_statement | block;
declaration_stmt: declaration_with_assign_stmt | declaration_without_assign_stmt;
declaration_with_assign_stmt: type identifier_list ASSIGN_TOK assignment_exp SC
    | arr_normal_decl ASSIGN_TOK arr_normal_init SC
    | arr_decl_with_size ASSIGN_TOK arr_init_with_elements SC
    | arr_normal_decl ASSIGN_TOK NULL_TOK SC;
declaration_without_assign_stmt: type identifier_list SC | arr_decl_with_size SC;
return_stmt: RETURN_TOK expression SC | RETURN_TOK SC;
arr_decl_with_size: type IDENTIFIER_TOK LSP INTEGER_CONST RSP;
arr_normal_decl: type IDENTIFIER_TOK LSP RSP;
arr_normal_init: NEW_TOK type LSP INTEGER_CONST RSP;
arr_init_with_elements: LCB exp_list RCB;
exp_list: assignment_exp COMMA exp_list | assignment_exp;
arr_access: IDENTIFIER_TOK LSP expression RSP;
no_statement: SC;
display_stmt: DISPLAY_TOK LP STRING RP SC | DISPLAY_TOK LP expression RP SC;
read_func: READ_TOK LP IDENTIFIER_TOK RP | READ_TOK LP RP;
comment_block: COMMENT_BLOCK_TOK;
comment_line: COMMENT_ONE_LINE_TOK;
if_stmt: IF_TOK LP logic_exp RP block else_stmt;
else_stmt: ELSE_TOK IF_TOK LP logic_exp RP block else_stmt | ELSE_TOK block | /* empty */;
block: LCB stmt_list RCB | LCB RCB;
for_stmt: FOR_TOK LP declaration_with_assign_stmt logic_exp SC statement_exp RP block;
while_stmt: WHILE_TOK LP logic_exp RP block;
function_declaration: func_header block;
func_header: type method_declarator| VOID_TOK method_declarator | type LSP RSP method_declarator;
type: INT_TOK | FLOAT_TOK | BOOL_TOK;
method_declarator: IDENTIFIER_TOK LP parameter_list RP | IDENTIFIER_TOK LP RP;
parameter_list: parameter_list COMMA parameter | parameter;
parameter: type IDENTIFIER_TOK | type IDENTIFIER_TOK LSP RSP;
expression: assignment_exp;
exp_statement: statement_exp SC;
statement_exp: assignment | function_call | read_func;
assignment_exp: logic_exp | assignment;
assignment: left_side ASSIGN_TOK assignment_exp;
left_side: arr_access | IDENTIFIER_TOK;
logic_exp: logic_or_exp;
logic_or_exp: logic_and_exp | logic_or_exp OR_TOK logic_and_exp;
logic_and_exp: eq_exp | logic_and_exp AND_TOK eq_exp;
eq_exp: rel_exp | eq_exp EQUAL_OP rel_exp | eq_exp NOT_EQ_OP rel_exp;
rel_exp: add_exp | rel_exp LESS_OP add_exp | rel_exp GREAT_OP add_exp
    | rel_exp LESS_EQ_OP add_exp | rel_exp GREAT_EQ_OP add_exp;
add_exp: mul_div_mod_exp | add_exp ADD_OP mul_div_mod_exp | add_exp SUB_OP mul_div_mod_exp;
mul_div_mod_exp: factor | mul_div_mod_exp MUL_OP factor | mul_div_mod_exp DIV_OP factor
    | mul_div_mod_exp MOD_OP factor;
factor: u_exp | factor EXP_OP u_exp;
u_exp: ADD_OP u_exp | SUB_OP u_exp | u_exp_unsigned;
u_exp_unsigned: primary_exp | NOT_OP u_exp;
primary_exp: IDENTIFIER_TOK | const | LP expression RP | function_call | arr_access | read_func;
const: INTEGER_CONST | FLOAT_CONST | BOOLEAN_CONST;
function_call: function_name LP argument_list RP | function_name LP RP;
function_name: IDENTIFIER_TOK;
argument_list: argument | argument COMMA argument_list;
argument: expression;
identifier_list: IDENTIFIER_TOK | identifier_list COMMA IDENTIFIER_TOK;
%%

#include "lex.yy.c"

int main() {
    yyparse();
    return 0;
}

void yyerror(char *s) { 
    fprintf(stderr, "Syntax error at line %d: %s\n", yylineno, s); 
}
