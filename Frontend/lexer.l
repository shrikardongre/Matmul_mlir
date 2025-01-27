%{
  #include <iostream>
  #include <vector>
  using namespace std ;


  int line = 1;  // Initialize line number to 1
  extern int yylex();
%}

%option noyywrap
%x comment

// Token Definitions
whitespace           (" ")
newline              ("nl")  // "nl" token for newline in your language
integer              (-?[0-9]+)
float                (-?[0-9]*\.[0-9]+)
long_long            (-?[0-9]+[lL]{2})
double               (-?[0-9]*\.[0-9]+[dD])
bool                 ("true"|"false")
datatype             ("int"|"bool"|"float"|"long long"|"double")
binary_operators     ("+"|"-"|"*"|"/")
relational_operators (">"|">="|"<"|"<="|"="|"!=")
assignment_operator  ([:][=])
identifier           ([a-zA-Z_][a-zA-Z0-9_]*)
terminate            (";")

%%

// Handling different tokens
{whitespace}            {;}  // Ignore whitespaces
{newline}               {line++;}  // Increment line number when "nl" is encountered

{integer}               {printf("Integer: %s\n", yytext);}  // Print integers
{float}                 {printf("Float: %s\n", yytext);}  // Print floats
{long_long}             {printf("Long Long: %s\n", yytext);}  // Print long longs
{double}                {printf("Double: %s\n", yytext);}  // Print doubles
{bool}                  {printf("Boolean: %s\n", yytext);}  // Print booleans
{datatype}              {printf("Datatype: %s\n", yytext);}  // Print data types
{binary_operators}      {printf("Binary Operator: %s\n", yytext);}  // Print binary operators
{relational_operators}  {printf("Relational Operator: %s\n", yytext);}  // Print relational operators
{assignment_operator}   {printf("Assignment Operator: %s\n", yytext);}  // Print assignment operator
{identifier}            {printf("Identifier: %s\n", yytext);}  // Print identifiers
{terminal}              {printf("Terminal: %s\n", yytext);}  // Print terminal (semicolon)


"/*"            {BEGIN(comment); }  // Start comment state
<comment>"*/"   {BEGIN(INITIAL); }  // End comment state
<comment>\n     {line++;}  // Increment line number inside comments
<comment>.      ;  // Ignore characters inside comments

%%
int main(){
 FILE* fhandle = fopen("test.mat", "r");
    if(fhandle == NULL)
    {
        std::cout << "unable to open file\n";
    }

    yyin = fhandle;
  
    while(yylex());
}
