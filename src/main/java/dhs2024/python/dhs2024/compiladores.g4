grammar compiladores;

fragment LETRA : [A-Za-z] ;
fragment DIGITO : [0-9] ;

//INST : (LETRA | DIGITO | [- ,;{}()+=>]) + '\n';

PA : '(' ;
PC : ')' ;
PYC : ';' ;
LLA : '{' ;
LLC : '}' ;

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
INT : 'int' ;
WHILE : 'while' ;
FOR : 'for' ;
IF : 'if' ;
ELSE : 'else' ;

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

instruccion : declaracion 
            | iwhile
            | ifor
            | iif
            | bloque
            | asignacion
 //           | asignacion PYC
            ;

declaracion : INT ID PYC;

asignacion : ID ASIG opal PYC;

opal : exp ; //completar
// terminar for, if, operaciones logicas

exp : log a ;

op : term e ;
e : SUMA op e
  | RESTA op e
  | op e
  |
  ; 

term : factor t ;
t : MULT factor t 
  | DIV factor t
  | MOD factor t
  |
  ;

comp : op c ;
c : MAYOR comp c
  | MENOR comp c
  | MAI comp c
  | MEI comp c
  |
  ;

inot : comp n ;
n : NOT inot n
  |
  ;

logic : inot l ;
l : AND logic l
  |
  ;

log: logic a ;
a : OR log a
  |
  ;

factor : NUMERO 
       | ID
       | PA exp PC
       ;


iwhile : WHILE PA ID PC instruccion;

bloque : LLA instrucciones LLC;

// ifor : FOR PA init PYC cond PYC iter PC instruccion ;
// init : ;
// cond : ;
// iter : ;
// estructura for
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

