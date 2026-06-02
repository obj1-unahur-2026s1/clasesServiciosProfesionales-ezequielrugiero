import serviciosProfesionales.*
class Personas {
    var property provincia
    method puedeSeratendido(unProfesional){
        return unProfesional.proviciahabilitadas().contains(provincia)
    }
}

class Instituciones{
    var property listaUniversidades =[]
      method puedeSeratendido(unProfesional){
        return listaUniversidades.contains(unProfesional.universidad())
    }
}

class Clubes{
    var property listaProvinicia =[]
    var property provinciaActual
   
    
    method puedeSeratendido(unProfesional){
        return listaProvinicia.any({p=>unProfesional.proviciaHabilitadas().contains(p)})
    }

}