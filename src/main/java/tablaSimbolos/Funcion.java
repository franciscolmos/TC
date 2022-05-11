package tablaSimbolos;

import java.util.List;

public class Funcion extends ID {
    List<TipoDato> args;

    public Funcion(List<TipoDato> args, String id, TipoDato tipo, char inicializado) {
        super.id = id;
        super.TipoDato = tipo;
        super.inicializado = inicializado == ';';
        this.args = args;
    }
    
}
