%option main
letter       [a-zA-Z_$]
digit        [0-9]
float         {digit}*(\.)?{digit}+
alphanumeric ({letter}|{digit})
int           {digit}+          
identifier   {letter}({alphanumeric}|_)*
bool         (true)|(false)
comment     \/\*([^*]|\*+[^\/])*\*+\/
string        \"[^\"]*\"
%%
if           { printf("IF "); }
else         { printf("ELSE "); }
while        { printf("WHILE "); }
do           { printf("DO ") ; }
for          { printf("FOR "); }
display      { printf("DISPLAY "); }
read         { printf("READ "); }
void         { printf("VOID "); }
return       { printf("RETURN "); }
new          { printf("NEW "); }
null         { printf("NULL "); }
{int}        { printf("INTEGER_CONST "); }
{float}      { printf("FLOAT_CONST "); }
{bool}       { printf("BOOLEAN ");}
"int"        { printf("INT_ID ");}
"float"      { printf("FLOAT_ID ");}
"bool"       { printf("BOOL_ID ");}
{identifier}  { printf("IDENTIFIER "); }
\&\&     { printf("AND "); }
\|\|     { printf("OR "); }
\=     { printf("ASSIGN "); }
\+       { printf("ADD_OP "); }
\-       { printf("SUB_OP "); }
\*       { printf("MUL_OP "); }
\/       { printf("DIV_OP "); }
\%       { printf("MOD_OP "); }
\^       { printf("EXP_OP "); }
\!       { printf("NOT_OP "); }
\<\=      { printf("LESS_EQ_OP "); }
\>\=      { printf("GREAT_EQ_OP "); }
\<       { printf("LESS_OP "); }
\>       { printf("GREAT_OP "); }
\=\=      { printf("EQUAL_OP "); }
\!\=     {printf("NOT_EQ_OP "); }
\(       { printf("LP "); }
\)       { printf("RP "); }
\{       { printf("LCB "); }
\}       { printf("RCB "); }
\[       { printf("LSP "); }
\]       { printf("RSP "); }
\;       { printf("SC "); }
\,       { printf("COMMA "); }
{string}      { printf("STRING "); }
[ \t]+        ;
\/\/.*      { printf("COMMENT_ONE_LINE "); }
{comment}  { printf("COMMENT_BLOCK "); }
%%
