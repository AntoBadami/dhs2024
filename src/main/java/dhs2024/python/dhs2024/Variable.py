from ID import ID

class Variable(ID):
    def __init__(self,nombre,tipoDato,inicializado,usado):
        self.nombre = nombre
        self.tipoDato = tipoDato
        self.inicializado = inicializado
        self.usado = usado