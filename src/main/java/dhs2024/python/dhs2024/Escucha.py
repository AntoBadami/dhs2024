from antlr4 import ErrorNode, TerminalNode
from compiladoresListener import compiladoresListener
from compiladoresParser import compiladoresParser
from TablaSimbolos import TablaSimbolos
from Variable import Variable
from Funcion import Funcion
from TipoDato import TipoDato

class Escucha (compiladoresListener) : 
    
    def __init__(self):
        self.numTokens = 0
        self.numNodos = 0
        self.tabla = TablaSimbolos()
    
    def enterPrograma(self, ctx:compiladoresParser.ProgramaContext):
        print("Comienza la compilacion")
        mainfunc = Funcion("main",0,True,True,[])
        maincontext = self.tabla.addContexto()
        self.tabla.addIdentificador(mainfunc)

    # Exit a parse tree produced by compiladoresParser#programa.
    def exitPrograma(self, ctx:compiladoresParser.ProgramaContext):
        print("Fin de la compilacion")
        print("Se encontraron:")
        print("\tNodos: " + str(self.numNodos))
        print("\tTokens: " + str(self.numTokens))
        
    
    # Enter a parse tree produced by compiladoresParser#iwhile.
    def enterIwhile(self, ctx:compiladoresParser.IwhileContext):
        print("Encontre while")
        print("\tCantidad hijos: " + str(ctx.getChildCount()))
        print("\tTokens: " + ctx.getText())

    # Exit a parse tree produced by compiladoresParser#iwhile.
    def exitIwhile(self, ctx:compiladoresParser.IwhileContext):
        print("Fin del while")
        print("\tCantidad hijos: " + str(ctx.getChildCount()))
        print("\tTokens: " + ctx.getText())

    # Enter a parse tree produced by compiladoresParser#declaracion.
    def enterDeclaracion(self, ctx:compiladoresParser.DeclaracionContext):
        print("### Declaracion")
        
    # Exit a parse tree produced by compiladoresParser#declaracion.
    def exitDeclaracion(self, ctx:compiladoresParser.DeclaracionContext):
        print("\tNombre variable: " + ctx.getChild(1).getText())

        #declaracion de variables
        #tip de dato
        tipodato = None
        if ctx.getChild(0).getText() == "int" :
            tipodato = TipoDato.INT

        variable = Variable(ctx.getChild(1).getText(),tipodato,False,False)

        #aniadir al ultimo contexto 
        self.tabla.addIndentificador(variable)
        print("Variable: ")
        print(variable)

    def visitTerminal(self, node: TerminalNode):
        print("---> Token " + node.getText())
        self.numTokens += 1
    
    def visitErrorNode(self, node: ErrorNode):
        print("---> ERROR")

    def enterEveryRule(self, ctx):
        self.numNodos += 1



