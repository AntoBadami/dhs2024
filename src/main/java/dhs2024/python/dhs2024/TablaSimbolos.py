from Contexto import Contexto
from ID import ID

class TablaSimbolos:
    
    def __init__(self):
        self.contextos = []

    def addContexto(self):
        contexto = Contexto()
        self.contextos.append(contexto)
        return contexto

    def delContexto(self,contexto):
        if contexto in self.contextos:
            self.contextos.remove(contexto)
            return True
        else:
            return False
    
    def addIdentificador(self,id : ID):
        if not id.nombre in self.contextos[-1].tabla:
            self.contextos[-1].tabla[id.nombre] = id
            return True
        else:
            return False

    def buscarLocal(self,strid):
        if strid in self.contextos[-1].tabla:
            return self.contextos[-1].tabla[strid]
        else:
            return None

    def buscarGlobal(self,strid):
        for contexto in self.contextos:
            if strid in contexto.tabla:
                return contexto.tabla[strid]
        return None
    