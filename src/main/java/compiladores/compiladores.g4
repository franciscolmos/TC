grammar compiladores;

@header {
package compiladores;
}

fragment DIGITO : [0-9] ;
fragment LETRA : [A-Za-z] ;

// DEFINIMOS LAS EXPRESIONES REGULARES QUE VAMOS A UTILIZAR EN LAS DISTINTAS REGLAS SINTÁCTICAS
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
IF : 'if';
FOR : 'for';
ENTERO : DIGITO+;
ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;
WS : [ \t\n\r] -> skip;

// REGLA INICIAL
si: programa EOF;

programa : instrucciones;

// UNA INSTRUCCIÓN PUEDE SER UNA ins_simple, iwhile, funcion O UN bloque DE intrucciones
instrucciones : instruccion instrucciones
              | bloque instrucciones
              |
              ;

instruccion : ins_simple
            | esructura_control
            | funcion
            ;

ins_simple : asignacion PUNTOYCOMA
           | declaraciones PUNTOYCOMA
           ;

bloque : LA instrucciones LC ;

/* ------------------------------ ASIGNACIONES Y DEFINICIONES --------------------------------------- */

asignacion : ID ASIGN (opal | invocacion);

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

// ------------------------------- ESTRUCTURAS DE CONTROL    ------------------------------ */

iwhile: WHILE PA opal PC (bloque|ins_simple);

iif: IF PA opal PC (bloque|ins_simple);

ifor : FOR PA condicion_for PC (bloque|ins_simple);

condicion_for : (ID | asignacion+) PUNTOYCOMA opal PUNTOYCOMA asignacion+;

esructura_control : iwhile
                  | iif
                  | ifor
                  ;

/* ------------------------------- OPERACIONES ARITMÉTICAS O LÓGICAS ----------------------- */

opal : term or;

term : factor t;

factor : ENTERO | ID
       | PA opal PC
       |
       ;

//  MULTIPLICACION, DIVISION, MODULO
t : MULT factor t
  | DIV factor t
  | MOD factor t
  |
  ;

// SUMA o RESTA
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

comparador : IGUALDAD | DESIGUALDAD | MENOR | MAYOR | MENOR_IGUAL | MAYOR_IGUAL;


// &&
and : comp a
    |
    ;

a : AND term and
  |
  ;

// ||
or : and o
   |
   ;

o : OR term or
  |
  ;

/* ----------------------------------- FUNCIONES ----------------------------------------------- */ 

// DECLARACION

declaracion_funcion : tipo ID PA lista_params_opcionales PC;

lista_params_opcionales : (param_opt COMA)* param_opt;

param_opt : tipo ID?;

// DEFINICION

definicion_funcion : tipo ID PA lista_params_obligatorios PC bloque;

lista_params_obligatorios : (param_obl COMA)* param_obl;

param_obl : tipo ID;

// INVOCACION

invocacion : ID PA lista_args PC;

lista_args: ((ID | ENTERO | invocacion) COMA)* (ID || ENTERO);


// UNA funcion PUEDE SER UNA invocacion, declaracion_funcion, O definicion_funcion
funcion : invocacion PUNTOYCOMA
        | declaracion_funcion PUNTOYCOMA
        | definicion_funcion // NO LE PONEMOS ; YA QUE definicion_funcion ya tiene PUNTOYCOMA
        ;