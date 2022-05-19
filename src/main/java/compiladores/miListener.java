package compiladores;

import javax.swing.text.TabableView;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;

import compiladores.compiladoresParser.BloqueContext;
import compiladores.compiladoresParser.Declaracion_simpleContext;
import compiladores.compiladoresParser.ProgramaContext;
import tablaSimbolos.TablaSimbolos;

public class miListener extends compiladoresBaseListener {
    private Integer count = 0;
    private Integer bloque = 1;
    private TablaSimbolos tablaSimbolos = new TablaSimbolos();

    @Override
    public void enterBloque(BloqueContext ctx) {
        System.out.println("TEXTO: AL ENTRAT AL BLOQUE " + ctx.getText());
        bloque++;
        tablaSimbolos.addContexto();
    }

    @Override
    public void exitBloque(BloqueContext ctx) {
        System.out.println("TEXTO AL SALIR DEL BLOQUE: " + ctx.getText());
        tablaSimbolos.getSimbolos().size();
        System.out.println("Cantidad de contextos: " + tablaSimbolos.getSimbolos().size());
        tablaSimbolos.delContexto();
    }

    @Override
    public void enterDeclaracion_simple(Declaracion_simpleContext ctx) {
    }

    @Override
    public void exitDeclaracion_simple(Declaracion_simpleContext ctx) {
        System.out.println(ctx.getText());
    }

    @Override
    public void enterEveryRule(ParserRuleContext ctx) {
        count++;
    }

    @Override
    public void enterPrograma(ProgramaContext ctx) {
        System.out.println("INICIO DEL PARSEO");
    }

    @Override
    public void visitTerminal(TerminalNode node) {
        System.out.println("TEXTO DEL NODO: " + node.getSymbol().getText());
    }

    @Override
    public void exitPrograma(ProgramaContext ctx) {
        System.out.println("FIN DEL PARSEO");
        System.out.println("Visitamos " + bloque + " bloques");
        System.out.println("Visitamos " + count + " nodos");
    }
}
