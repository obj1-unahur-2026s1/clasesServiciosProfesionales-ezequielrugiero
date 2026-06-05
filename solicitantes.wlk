import serviciosProfesionales.*
class Personas {
    var property provincia
    method puedeSerAtendido(unProfesional){
        return unProfesional.provinciaHabilitadas().contains(provincia)
    }
}

class Instituciones{
    var property listaUniversidades =[]
      method puedeSerAtendido(unProfesional){
        return listaUniversidades.contains(unProfesional.universidad())
    }
}

class Clubes{
    var property listaProvinicias =[]
    
   
    
    method puedeSerAtendido(unProfesional){
        return listaProvinicias.any({p=>unProfesional.provinciaHabilitadas().contains(p)})
    }

}