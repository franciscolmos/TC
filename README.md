# TC

## Compiladores

### Notas

### Análisis Sintáctico

Verifica que la secuencia de tokens sea correcta.
Estructura gramaticalmente del lenguajes.

Lo vamos a implementar utilizando reglas gramaticales.
La reglas sintacticas tienen implecaitiones RECURSIVA.

Se puede realizar en forma:

- Dependiente: TOP-Down parsing -> de la raiz a las hojas.
- Ascendente: Bottom-Up parsing -> de las hojas a la raiz.

#### Ascendente:

In: (())()

    Regla:
    s : ( s ) s
      |
      ;

    $ s                    (())() $ derivar
    $ s ) s (              (())() $ match
    $ s ) s                 ())() $ derivar
    $ s ) s ) s (           ())() $ match
    $ s ) s ) s              ))() $ derivar (vacio)
    $ s ) s )                ))() $ match
    $ s ) s                   )() $ derivar (vacio)
    $ s )                     )() $ match
    $ s                        () $ derivar
    $ s ) s (                  () $ match
    $ s ) s                     ) $ derivar (vacio)
    $ s )                       ) $ match
    $ s                           $ derivar (vacio)
    $                             $ OK