grammar compiladores;

@header {
package compiladores;
}

fragment DIGITO : [0-9] ;
fragment LETRA : [A-Za-z] ;

SUMA : '+';
RESTA : '-';
MULT : '*';
DIV : '/';
MOD : '%';
AND : '&&';
OR : '||';
PA: '(';
PC: ')';
CA: '[';
CC: ']';
LA: '{';
LC: '}';
IGUALDAD : '==';
DESIGUALDAD : '!=';
MENOR : '<';
MAYOR : '>';
MENOR_IGUAL : '<=';
MAYOR_IGUAL : '>=';
ASIGN : '=';
PUNTOYCOMA : ';';
INT : 'int';
DOUBLE : 'double';
COMA : ',';
WHILE : 'while';
ENTERO : DIGITO+;
ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;
WS : [ \t\n\r] -> skip;

si: programa EOF;

programa : instrucciones;

instrucciones : instruccion instrucciones
              | bloque instrucciones
              |
              ;

instruccion : ins_simple
            | iwhile
            ;

ins_simple : asignacion PUNTOYCOMA
           | declaraciones PUNTOYCOMA
           ;

asignacion : ID ASIGN opal;

declaraciones : definicion
              | declaracion_simple
              | declaracion_lista
              | declaracion_lista_asignacion
              ;

definicion : tipo ID; // int x;

tipo : INT | DOUBLE;

declaracion_simple : tipo asignacion; // int x = 1;

declaracion_lista : tipo lista; // int x, y, x;

declaracion_lista_asignacion : declaracion_simple COMA lista asignacion; // int x = 10, y, z = 20;

lista: ID COMA? lista |; // a, b, c

iwhile: WHILE PA opal PC (bloque|ins_simple);

comparacion: (ID | ENTERO) operadores (ID | ENTERO);

operadores: '==' | '!=' | '<=' | '>=' | '<' | '>';

bloque : LA instrucciones LC ;

comparador : IGUALDAD | DESIGUALDAD | MENOR | MAYOR | MENOR_IGUAL | MAYOR_IGUAL;

opal : term or;

term : factor t;

factor : ENTERO || ID
       | PA opal PC
       |
       ;

t : MULT factor t
  | DIV factor t
  | MOD factor t
  |
  ;

exp : SUMA term exp
    | RESTA term exp
    | 
    ;

comp : exp c
     |
     ;

c : comparador term exp
  |
  ;

and : comp a
    |
    ;

a : AND term and
  |
  ;

or : and o
   |
   ;

o : OR term or
  |
  ;