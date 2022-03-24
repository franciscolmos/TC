grammar compiladores;

@header {
package compiladores;
}

// DIGITO = '0' | '1' | '2' | ... | '9'  Así se debería escribir si no exiestiera el operador [] -->  DIGITO : [0-9] (No hay metacaracteres dentro de  [], salvo el  - (ion))
fragment LETRA : [A-Za-z] ;
fragment DIGITO : [0-9] ;

// SIGNOS : [-+*/]; // Para convertir el - en metacaracter dentro de los [] hay que ponerlo al principio
// SEQ : '3'[4-9] | '4'[0-5] // del 34 al 45
WS : [ \t\n\r] -> skip; // Saltea los saltos de linea, espacios en blanco, y retornos de carro

NUMERO : DIGITO+ ;
OTRO : . ;

/* FECHASPARES : ; */



ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;

s : ID     { System.out.println("ID ->" + $ID.getText() + "<--"); }         s
  | NUMERO { System.out.println("NUMERO ->" + $NUMERO.getText() + "<--"); } s
  | OTRO   { System.out.println("Otro ->" + $OTRO.getText() + "<--"); }     s
  | EOF
  ;
