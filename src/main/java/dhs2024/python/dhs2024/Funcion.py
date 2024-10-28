from ID import ID

class Funcion(ID):
    
    def __init__(self,nombre,tipoDato,inicializado,usado,argumentos : list):
        self.nombre = nombre
        self.tipoDato = tipoDato
        self.inicializado = inicializado
        self.usado = usado
        self.args = argumentos
    def __str__(self):
        cad = """Funcion:{} Tipo:{}""".format(self.nombre,
                                        self.tipoDato)
        for arg in self.args:
            cad = cad + "Argumento: " + arg.nombre
        return cad