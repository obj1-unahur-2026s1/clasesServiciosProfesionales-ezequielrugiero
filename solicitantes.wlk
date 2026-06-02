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
    var property listaProvinicias =[]
    
   
    
    method puedeSeratendido(unProfesional){
        return listaProvinicias.any({p=>unProfesional.proviciaHabilitadas().contains(p)})
    }

}