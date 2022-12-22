%{
#include "y.tab.h"
#include "stdio.h"
#include "stdlib.h"
#include "tree.h"
#include <cstring>
#define YYTYPE char*
#pragma warning (disable : 4996)

%}
%option yylineno
VOID            void
MAIN            main
INT             int
CHAR            char
FLOAT           float
DOUBLE          double
ASSIGN          =
IF              if
ELSE            else
WHILE           while
FOR             for
BREAK           break
CONTINUE        continue
PLUS            \+
DPLUS           \+\+
MINUS           \-
DMINUS          \-\-
MUL             \*
DIV             \/
MOD             \%
BITOR           \|
BITAND          \&
BITXOR          \^
EG              \>=
EL              \<=
EQ              ==
EN              !=
BITLEFT         \<\<
BITRIGHT        \>\>
GT              \>
LT              \<
AND             \&\&
OR              \|\|
NOT             !
LP              \(
RP              \)
LC              \{
RC              \}
RETURN          return
COMMA           ,
SQM             ;
COMMENT         \/\/(.*){DELIM}*$
COMMENTS        "/*"(([^\*]*(\*[^\/])?)*)"*/"
DELIM           [ \t\r]
NEWLINE         \n
WHITESPACE      {DELIM}+
LETTER          [a-zA-Z]
DIGIT           [0-9]
INTEGER_VALUE   ([1-9]{DIGIT}*|0)
FLOAT_VALUE     {DOUBLE_VALUE}(f|F)
DOUBLE_VALUE    ({DIGIT}*\.{DIGIT}*)|({INTEGER_VALUE}(e|E)-?{INTEGER_VALUE})
CHAR_VALUE      \'.\'
STRING_VALUE    \"(.*)\"
READ            read
WRITE           write
ID              (_|{LETTER})(_|{LETTER}|{DIGIT})*
%%


{MAIN}          {printf("[MAIN]%s\n",yytext); return MAIN;       }
{INT}           {printf("[INT]%s\n",yytext); return INT;        }
{VOID}          {printf("[VOID]%s\n",yytext); return VOID;       }
{FLOAT}         {printf("[FLOAT]%s\n",yytext); return FLOAT;      }
{DOUBLE}        {printf("[DOUBLE]%s\n",yytext); return DOUBLE;     }
{CHAR}          {printf("[CHAR]%s\n",yytext); return CHAR;       }
{ASSIGN}        {printf("[ASSIGN]%s\n",yytext); return ASSIGN;     }
{IF}            {printf("[IF]%s\n",yytext); return IF;         }
{ELSE}          {printf("[ELSE]%s\n",yytext); return ELSE;       }
{WHILE}         {printf("[WHILE]%s\n",yytext); return WHILE;      }
{PLUS}          {printf("[PLUS]%s\n",yytext); return PLUS;       }
{MINUS}         {printf("[MINUS]%s\n",yytext); return MINUS;      }
{FOR}           {printf("[FOR]%s\n",yytext); return FOR;        }
{MUL}           {printf("[MUL]%s\n",yytext); return MUL;        }
{DIV}           {printf("[DIV]%s\n",yytext); return DIV;        }
{EG}            {printf("[EG]%s\n",yytext); return EG;         }
{EL}            {printf("[EL]%s\n",yytext); return EL;         }
{EQ}            {printf("[EQ]%s\n",yytext); return EQ;         }
{BITLEFT}       {printf("[BITLEFT]%s\n",yytext); return BITLEFT;    }
{BITRIGHT}      {printf("[BITRIGHT]%s\n",yytext); return BITRIGHT;   }
{GT}            {printf("[GT]%s\n",yytext); return GT;         }
{LT}            {printf("[LT]%s\n",yytext); return LT;         }
{AND}           {printf("[AND]%s\n",yytext); return AND;        }
{OR}            {printf("[OR]%s\n",yytext); return OR;         }
{NOT}           {printf("[NOT]%s\n",yytext); return NOT;        }
{LP}            {printf("[LP]%s\n",yytext); return LP;         }
{RP}            {printf("[RP]%s\n",yytext); return RP;         }
{LC}            {printf("[LC]%s\n",yytext); return LC;         }
{RC}            {printf("[RC]%s\n",yytext); return RC;         }
{RETURN}        {printf("[RETURN]%s\n",yytext); return RETURN;     }
{COMMA}         {printf("[COMMA]%s\n",yytext); return COMMA;      }
{SQM}           {printf("[SQM]%s\n",yytext); return SQM;        }
{MOD}           {printf("[MOD]%s\n",yytext); return MOD;        }
{BITAND}        {printf("[BITAND]%s\n",yytext); return BITAND;     }
{BITOR}         {printf("[BITOR]%s\n",yytext); return BITOR;      }
{BITXOR}        {printf("[BITXOR]%s\n",yytext); return BITXOR;     }
{READ}          {printf("[READ]%s\n",yytext); return READ;       }
{WRITE}         {printf("[WRITE]%s\n",yytext); return WRITE;      }
{EN}            {printf("[EN]%s\n",yytext); return EN;         }
{DPLUS}         {printf("[DPLUS]%s\n",yytext); return DPLUS;      }
{DMINUS}        {printf("[DMINUS]%s\n",yytext); return DMINUS;     }
{ID}            { yylval.str = new char[strlen(yytext)]; strcpy(yylval.str, yytext);printf("[ID]%s\n",yytext); return ID;              }
{INTEGER_VALUE} { yylval.str = new char[strlen(yytext)]; strcpy(yylval.str, yytext);printf("[INTEGER_VALUE]%s\n",yytext); return INTEGER_VALUE;   }
{FLOAT_VALUE}   { yylval.str = new char[strlen(yytext)]; strcpy(yylval.str, yytext);printf("[FLOAT_VALUE]%s\n",yytext); return FLOAT_VALUE;     }    
{CHAR_VALUE}    { yylval.str = new char[strlen(yytext)]; strcpy(yylval.str, yytext);printf("[CHAR_VALUE]%s\n",yytext);return CHAR_VALUE;      }
{DOUBLE_VALUE}  { yylval.str = new char[strlen(yytext)]; strcpy(yylval.str, yytext);printf("[DOUBLE_VALUE]%s\n",yytext); return DOUBLE_VALUE;    }
{COMMENT}       { yylval.str = new char[strlen(yytext)]; strcpy(yylval.str, yytext); return COMMENT;         }
{COMMENTS}      { yylval.str = new char[strlen(yytext)]; strcpy(yylval.str, yytext);printf("[COMMENTS]%s\n",yytext); return COMMENTS;        }

%%
int yywrap(void)
{
 return 1;
}
