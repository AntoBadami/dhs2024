from ID import ID

class Variable(ID):
    def __init__(self,tipoDato,nombre,inicializado = False,usado = False):
        self.nombre = nombre
        self.tipoDato = tipoDato
        self.inicializado = inicializado
        self.usado = usado

    def __str__(self):
            return" \tNombre:{}\n\tTipo:{}\n\tinicializado:{}\n\tUsado:{}".format(self.nombre,self.tipoDato,self.inicializado,self.usado)