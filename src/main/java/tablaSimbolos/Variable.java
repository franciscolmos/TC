package tablaSimbolos;

public class Variable extends ID{

    public Variable(String id, TipoDato tipo, int inicializado) {
        super.id = id;
        super.TipoDato = tipo;
        super.inicializado = inicializado == '=';
    }

}
