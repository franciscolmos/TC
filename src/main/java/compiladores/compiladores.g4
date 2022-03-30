grammar compiladores;

@header {
package compiladores;
}

// DIGITO : '0' | '1' | '2' | ... | '9'  Así se debería escribir si no exiestiera el operador [] -->  DIGITO : [0-9] (No hay metacaracteres dentro de  [], salvo el  - (ion))
/* fragment LETRA : [A-Za-z] ; 
fragment DIGITO : [0-9] ; */

// SIGNOS : [-+*/]; // Para convertir el - en metacaracter dentro de los [] hay que ponerlo al principio
// SEQ : '3'[4-9] | '4'[0-5] // del 34 al 45

/* NUMERO : DIGITO+ ; */



FECHAPAR : (('0'[1-9]|[12][0-9]|'3'[0])'/'('0'[246])|('0'[1-9]|[12][0-9]|'3'[0-1])'/'('0'[8]|'1'[02]))'/'[0-9][0-9][0-9][0-9];
HORA1 : ('0'[8-9]|'1'[0-2])':'([012345][0-9]);
HORA2 : ([1][8]':'[345][0-9])|(([1][9]|[2][0])':'[012345][0-9])|([2][1]':'([012][0-9]|[3][0]));

OTRO : . ;
WS : [\t\n\r] -> skip; // Saltea los saltos de linea, espacios en blanco, y retornos de carro

/* ID : (LETRA | '_')(LETRA | DIGITO | '_')* ; */

/* s : ID     { System.out.println("ID ->" + $ID.getText() + "<--"); }         s
  | NUMERO { System.out.println("NUMERO ->" + $NUMERO.getText() + "<--"); } s
  | OTRO   { System.out.println("Otro ->" + $OTRO.getText() + "<--"); }     s
  | EOF
  ; */
s : FECHAPAR { System.out.println("FECHAPAR ->" + $FECHAPAR.getText() + "<--"); } s
  | HORA1 { System.out.println("HORA1 ->" + $HORA1.getText() + "<--"); }s
  | HORA2 { System.out.println("HORA2 ->" + $HORA2.getText() + "<--"); }s
  | OTRO { System.out.println("Otro ->" + $OTRO.getText() + "<--"); }s
  | EOF;