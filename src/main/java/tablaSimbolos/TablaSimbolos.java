package tablaSimbolos;

import java.util.List;
import java.util.Map;

public class TablaSimbolos {

    List<Map<String, ID>>  simbolos;

    public TablaSimbolos() {
    }

    void addConexto(){

    };

    void delContexto(){

    };

    ID searchID (String id){
        return new Variable(id, new TipoDato("int"), '=');
    };

    ID searchIDLocal (String id){
        return new Variable(id, new TipoDato("double"), ';');
    };

    void addId(ID id){};
}


