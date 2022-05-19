package tablaSimbolos;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class TablaSimbolos {

    List<Map<String, ID>>  simbolos;

    

    public List<Map<String, ID>> getSimbolos() {
        return simbolos;
    }

    public void setSimbolos(List<Map<String, ID>> simbolos) {
        this.simbolos = simbolos;
    }

    public TablaSimbolos() {
        this.simbolos = new LinkedList<>();
    }

    public void addContexto(){
        simbolos.add(new TreeMap<String, ID>());
    };

    public void delContexto(){
        simbolos.remove(simbolos.size() - 1);
    };

    ID searchID (String id){
        return new Variable(id, new TipoDato("int"), '=');
    };

    ID searchIDLocal (String id){
        return new Variable(id, new TipoDato("double"), ';');
    };

    void addId(ID id){};
}


