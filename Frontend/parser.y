%{
#include <stdlib.h>
#include <stdio.h>

void yyerror(char* s);
extern int yylex();
extern int yyparse();
extern FILE* yyin;
%}

%union{
    int integer;
    int boolean;
    char* character_token;
    double double_val;
    float float_val;
    long long long_long_val;
}

%token <integer> _integer
%token <boolean> _boolean
%token <character_token> _datatype
%token <character_token> _binary_operators
%token <character_token> _relational_operators
%token <character_token> _assignment_operator
%token <character_token> _identifier
%token <character_token> _terminate
%token <double_val> _double
%token <float_val> _float 
%token <long_long_val> _long_long 

%type <integer> line expression term
%type <character_token> assignment

%%
line: 
    assignment ';' {
        ;
    }
   
    ;
    
assignment:
    _identifier ':''=' expression {
        printf("expression: ");
    }
    
    ;


    expression
    : term {
        printf("term: ");
    }
    
    | expression _binary_operators term{
        printf("expression + term: ");
    }

    | expression '+' term {
        printf("expression + term: ");
    }
    | expression '-' term {
        printf("expression - term: ");
    }
    | expression '*' term {
        printf("expression * term: ");
    }
    | expression '/' term {
        printf("expression / term: ");
    }
    | expression '>' term {
        printf("expression > term: ");
    }
    | expression '>''=' term {
        printf("expression >= term: ");
    }
    | expression '<' term {
        printf("expression < term: ");
    }
    | expression '<''=' term {
        printf("expression <= term: ");
    }
    | expression '=' term {
        printf("expression = term: ");
    }
    | expression '!''=' term {
        printf("expression != term: ");
    }
    ;
    
    term
    : _integer {
        printf("number: %d\n", $1);
    }
    | _identifier {
        printf("identifier: %s\n", $1);
    }
    | _double {
        printf("double: %f\n", $1);
    }
    | _float {
        printf("float: %f\n", $1);
    }
    | _long_long {
        printf("long long: %lld\n", $1);
    }
    ;

    %%

int main()
{
   

    while(yyparse());
}

void yyerror (char *s) 
{
    fprintf (stderr, "error: %s\n", s);
} 


