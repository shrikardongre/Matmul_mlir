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

{integer}               {printf("Integer: %s\n", yytext);}  
{float}                 {printf("Float: %s\n", yytext);}
{long_long}             {printf("Long Long: %s\n", yytext);}  
{double}                {printf("Double: %s\n", yytext);} 
{bool}                  {printf("Boolean: %s\n", yytext);}  
{datatype}              {printf("Datatype: %s\n", yytext);}  
{binary_operators}      {printf("Binary Operator: %s\n", yytext);} 
{relational_operators}  {printf("Relational Operator: %s\n", yytext);}  
{assignment_operator}   {printf("Assignment Operator: %s\n", yytext);}  
{identifier}            {printf("Identifier: %s\n", yytext);} 
{terminate}              {printf("Terminal: %s\n", yytext);} 


"/*"            {BEGIN(comment); }  
<comment>"*/"   {BEGIN(INITIAL); }  
<comment>\n     {line++;}  
<comment>.      ;  

%%
int main(){
 FILE* fhandle = fopen("test.mat", "r");
    if(fhandle == NULL)
    {
        std::cout << "not a valid file type \n";
    }

    yyin = fhandle;
  
    while(yylex());
    
    fclose(fhandle);  
        std::cout << "Total lines processed: " << line << std::endl;
    
    return 0;
}
