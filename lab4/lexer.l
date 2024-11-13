%{
// Reconhecedor de uma linguagem simplificada
#include <iostream>
#include "tokens.h"
using std::cout;
%}

%option noyywrap
delim	[ \t\n]
brancos {delim}+  
letra	[A-Za-z]
digito	[0-9]
id      [A-Za-z_]([A-Za-z0-9_])*
num	    {digito}+(\.{digito}+)?(E[+-]?{digito}+)?

%%
{brancos}	; // nenhuma ação e nenhum retorno
while       return WHILE;
if		    return IF; 
then		return THEN; 
else		return ELSE; 
{num}	    return NUM; 
"<"		    return RELOP; 
"<="		return RELOP; 
"=="		return RELOP; 
"!="		return RELOP; 
">"		    return RELOP;
">="		return RELOP; 
{id}		return ID;  
\"(\\.|[^\"])*\"  return STRING;

.           cout << YYText() << " é um token inválido!\n"; 
%%

// nenhuma função auxiliar é necessária
