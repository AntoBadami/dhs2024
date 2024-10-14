from ID import ID

class Funcion(ID):
    
    def __init__(self,nombre,tipoDato,inicializado,usado,argumentos : list):
        self.nombre = nombre
        self.tipoDato = tipoDato
        self.inicializado = inicializado
        self.usado = usado
        self.args = argumentos