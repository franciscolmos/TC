package compiladores;

import org.antlr.v4.runtime.ParserRuleContext;

import compiladores.compiladoresParser.BloqueContext;
import compiladores.compiladoresParser.ProgramaContext;

public class miListener extends compiladoresBaseListener {
    private Integer count = 0;
    private Integer bloque = 1;

    @Override
    public void enterBloque(BloqueContext ctx) {
        System.out.println("TEXTO: AL ENTRAT AL BLOQUE " + ctx.getText());
        bloque++;
    }

    @Override
    public void exitBloque(BloqueContext ctx) {
        System.out.println("TEXTO AL SALIR DEL BLOQUE: " + ctx.getText());
        bloque--;
    }

    

    @Override
    public void enterEveryRule(ParserRuleContext ctx) {
        count++;
    }

    @Override
    public void exitPrograma(ProgramaContext ctx) {
        System.out.println("FIN DEL PARSEO");
        System.out.println("Visitamos " + bloque + " bloques");
        System.out.println("Visitamos " + count + " nodos");
    }
}
