%{
  #include <iostream>
  #include <vector>
  using namespace std ;


  int line = 1;  // Initialize line number to 1
  extern int yylex();
  
%}

%option noyywrap
%x comment

whitespace           (" ")
newline              ("\n") 
integer              ([+-]?[0-9]+)
float                ([+-]?[0-9]*\.[0-9]+)
long_long            ([+-]?[0-9]+[lL]{2})
double               ([+-]?[0-9]*\.[0-9]+[dD])
bool                 ("true"|"false")
datatype             ("int"|"bool"|"float"|"long long"|"double")
binary_operators     ("+"|"-"|"*"|"/")
relational_operators (">"|">="|"<"|"<="|"="|"!=")
assignment_operator  ([:][=])
identifier           ([a-zA-Z_][a-zA-Z0-9_]*)
terminate            (";")

%%


{whitespace}            {;}  
{newline}               {line++; }  

{integer}               {/*printf("%s\n", yytext);*/ yylval.integer = atoi(yytext); return _integer;                        }
{bool}                  {/*printf("%s\n", yytext);*/ yylval.boolean = atoi(yytext); return _boolean;                       }
{float}                 {/*printf("%s\n", yytext);*/ yylval.float_val = atof(yytext); return _float;                        }
{double}                 {/*printf("%s\n", yytext);*/ yylval.double_val = atof(yytext); return _double;                        }
{long_long}              {/*printf("%s\n", yytext);*/ yylval.long_long_val = atoll(yytext); return _long_long ;                        }
{datatype}              {/*printf("%s\n", yytext);*/ yylval.character_token = strdup(yytext); return _datatype;             }
{binary_operators}      {/*printf("%s\n", yytext);*/ yylval.character_token = strdup(yytext); return _binary_operators;     }
{relational_operators}  {/*printf("%s\n", yytext);*/ yylval.character_token = strdup(yytext); return _relational_operators; }
{assignment_operator}   {/*printf("%s\n", yytext);*/ yylval.character_token = strdup(yytext); return _relational_operators; }
{identifier}            {/*printf("%s\n", yytext);*/ yylval.character_token = strdup(yytext); return _identifier;           }
{terminal}              {/*printf("%s\n", yytext);*/ yylval.character_token = strdup(yytext); return _terminal;             }




"/*"            {BEGIN(comment); }  
<comment>"*/"   {BEGIN(INITIAL); }  
<comment>\n     {line++;}  
<comment>.      ;  

