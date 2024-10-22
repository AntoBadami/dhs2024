from compiladoresVisitor import compiladoresVisitor
from compiladoresParser import compiladoresParser
class Walker (compiladoresVisitor):
	def visitPrograma(self,ctx : compiladoresParser.ProgramaContext):
		print("=-"*20)
		print("-- Comienza a caminar")
		return super().visitPrograma(ctx)

	
	def visitBloque(self,ctx : compiladoresParser.BloqueContext):
		print("Nuevo contexto")
		print(ctx.getText()) #obtener todo el texto del bloque
		return super().visitBloque(ctx)

	def visitDeclaracion(self,ctx : compiladoresParser.DeclaracionContext):
		print(ctx.getChild(0).getText() + "-" + ctx.getChild(1).getText())
		return None
# Indica cuando visitas hojas
	# def visitTerminal(self,node):
		# print(" ==> Token " + node.getText())
		# return super().visitTerminal(node)