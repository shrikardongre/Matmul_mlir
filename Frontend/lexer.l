%{
#include <iostream>
#include <vector>

int line = 0;
extern int yylex();
%}

%option noyywrap
%x comment

whitespace           (" ")
newline              ("nl")
double               (-?[0-9]*\.[0-9]+)
float                (-?[0-9]*\.[0-9]+([eE][-+]?[0-9]+)?)
ll                   (-?[0-9]+[lL]{2})
integer              (-?[0-9]+)
bool                 ("true"|"false")
datatype             ("int"|"bool"|"double"|"float"|"ll")
binary_operators     ("+"|"-"|"*"|"/")
relational_operators (">"|">="|"<"|"<="|"="|"!=")
assignment_operator  ([:][=])
identifier           ([a-zA-Z_][a-zA-Z0-9_]*)
terminal             (";")