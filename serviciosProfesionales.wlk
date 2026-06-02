import solicitantes.*
class Universidad{
  var property provincia 
  var property onorariosRecomedados

}
// Esta bien hacer todas las clase en un solo archivo
class ProfesionalesViculados{
   var property universidad 
   var property provinciaHabilitadas = [universidad.provincia()]
   method honorariosPorHora() = universidad.onorariosRecomedados()
   method habilitarEstaProvincia(unaProvinicia){
    provinciaHabilitadas.add(unaProvinicia)
  }
}

class ProfesionalesAsociados{
  var property universidad
  var property provinciaHabilitadas = ["Entre Rios", "Santa Fe", "corriente"]
  method honorariosPorHora() = 3000
  
  method habilitarEstaProvincia(unaProvinicia){
    provinciaHabilitadas.add(unaProvinicia)
  }

}

class ProfesioanlesLibre{
  var property universidad 
  var property provinciaHabilitadas 
  var property honorariosPorHora
  method habilitarEstaProvincia(unaProvinicia){
    provinciaHabilitadas.add(unaProvinicia)
  }
}

class EmpresaDeServicios{
  const property profesionaeles = []
  var property onorarios

  method contratarA(unProfesiona){
    profesionaeles.add(unProfesiona)
  }

  method estudiaronEnEstaUniversidad(universidad){
    return profesionaeles.filter({p=>p.universidad() == universidad}).size()
  } 

  method profesionalesMasCaro(){
    return profesionaeles.filter({p=>p.honorariosPorHora()> self.onorarios()})
  }

  method universidadesFormadoras(){
    return profesionaeles.map({p=>p.universidad()}).asSet().asList()
  }

  method elProfesionalMasBarato(){
    return profesionaeles.min({p=>p.honorariosPorHora()})
  }

  method genteAcotada(){
    return profesionaeles.all({p=> !(p.provinciaHabilitadas().size()>3)})
  }

  method satisfacerSolicito(unSolicitante){
      return profesionaeles.any({p=>unSolicitante.puedeSeratendido(p)})
  }
}

