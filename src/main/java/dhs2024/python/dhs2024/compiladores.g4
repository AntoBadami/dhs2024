grammar compiladores;

fragment LETRA : [A-Za-z] ;
fragment DIGITO : [0-9] ;

//INST : (LETRA | DIGITO | [- ,;{}()+=>]) + '\n';

PA : '(' ;
PC : ')' ;
PYC : ';' ;
LLA : '{' ;
LLC : '}' ;
C: ',';

//OPERADORES ARITMETICOS
SUMA : '+' ;
RESTA : '-' ;
MULT : '*' ;
DIV : '/' ;
MOD : '%' ;
INC : '++' ;
DEC : '--' ;

//OPERADORES LOGICOS
AND : '&&' ;
OR : '||' ;
NOT : '!=' ;


NUMERO : DIGITO+ ;

ASIG : '=' ;
IGUAL : '==' ;
MENOR : '<' ;
MAYOR : '>' ;
MEI : '<=' ;
MAI : '>=' ;
WHILE : 'while' ;
FOR : 'for' ;
IF : 'if' ;
ELSE : 'else' ;

//TIPO DE DATOS
INT : 'int' ;
VOID : 'void';
CHAR : 'char';
FLOAT : 'float';

ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;

WS : [ \t\n\r] -> skip;
//OTRO : . ;
/* 
s : ID     {print("ID ->" + $ID.text + "<--") }         s
  | NUMERO {print("NUMERO ->" + $NUMERO.text + "<--") } s
  | OTRO   {print("Otro ->" + $OTRO.text + "<--") }     s
  | EOF
  ;

//raiz del arbol
si : s EOF ;
//verifica balance de parentesis
s: PA s PC s
  |
  ;
*/ 

programa : instrucciones EOF;

instrucciones : instruccion instrucciones
              |
              ;

//instruccion : INST {print($INST.text[:-1])};

instruccion : declaracion PYC
            | iwhile
            | ifor
            | iif
            | bloque
            | asignacion
 //           | asignacion PYC
            ;

declaracion : (INT | VOID | CHAR | FLOAT) ID;

asignacion : ID ASIG opal PYC;

opal : exp ; //completar

//exp : lor a ;
exp : lor ;

lor: land a ;
a : OR lor a
  |
  ;

land : inot l ;
l : AND land l
  |
  ;

inot : comp n ;
n : NOT inot n
  | IGUAL inot n
  |
  ;

comp : op c ;
/*c : MAYOR comp c
  | MENOR comp c
  | MAI comp c
  | MEI comp c
  |
  ;*/
c : (MAYOR | MENOR | MAI | MEI) comp  // Comparadores
  |                                   // Regla vacía permitiendo finalizar sin comparador
  ;

op : term e ;
/*e : SUMA op e
  | RESTA op e
//  | op e
  |
  ; */
e : (SUMA | RESTA) op 
  |                  // Regla vacía permitiendo finalizar sin SUMA o RESTA
  ;

term : factor t ;
/*t : MULT factor t 
  | DIV factor t
  | MOD factor t
  |
  ;*/
t : (MULT | DIV | MOD) factor 
  |                       // Regla vacía permitiendo finalizar sin operador
  ;

factor : NUMERO 
       | ID
       | PA exp PC
       | suf
       | pref
       ;

suf : ID (INC | DEC);

pref : (INC | DEC)  ID;

iwhile : WHILE PA ID PC instruccion;

bloque : LLA instrucciones LLC;

ifor  : FOR PA  init  PYC cond PYC iter PC  instruccion;

init  : asignacion
      |
      ;
cond : comp
     |
     ;
iter  : ID INC
      | ID DEC
      | asignacion
      |
      ;

iif:  IF PA cond PC instruccion
    | IF PA cond PC instruccion ielse;

ielse : ELSE instruccion;

ifuncion : tipo ID PA param PC instruccion;

tipo: (INT | VOID | CHAR | FLOAT);

param: declaracion
      |declaracion C param
      |
      ;