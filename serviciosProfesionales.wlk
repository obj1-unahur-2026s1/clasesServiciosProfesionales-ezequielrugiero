import solicitantes.*
class Universidad{
  var property provincia 
  var property onorariosRecomedados
  var property donaciones = 0

  method recibirDonaciones(unMonto){
    donaciones = donaciones + unMonto
  }

}
// Esta bien hacer todas las clase en un solo archivo
class ProfesionalesViculados{
   var property universidad 
   var property provinciaHabilitadas = [universidad.provincia()]
   var property importeCobrado = 0

   method honorariosPorHora() = universidad.onorariosRecomedados()
   method habilitarEstaProvincia(unaProvinicia){
    provinciaHabilitadas.add(unaProvinicia)
  }
  method Cobrar(unImporte){
   const donacion =unImporte.div(2)
   universidad.recibirDonaciones(donacion)
   
  }

}

class ProfesionalesAsociados{
  var property universidad
  var property provinciaHabilitadas = ["Entre Rios", "Santa Fe", "corriente"]
  var property importeCobrado = 0
  method honorariosPorHora() = 3000
  
  method habilitarEstaProvincia(unaProvinicia){
    provinciaHabilitadas.add(unaProvinicia)
  }

  method Cobrar(unImporte){
    asociaciónProfesionalesLitoral.recibirRecaudacion(unImporte)
  }

}

class ProfesioanlesLibre{
  var property universidad 
  var property provinciaHabilitadas 
  var property honorariosPorHora
  var property importeCobrado = 0
  method habilitarEstaProvincia(unaProvinicia){
    provinciaHabilitadas.add(unaProvinicia)
  }

  method Cobrar(unImporte){
    importeCobrado = importeCobrado + unImporte

  }

  method pasarImporteAUnCompañero(unImporte, unCompañero){
      unCompañero.Cobrar(unImporte)
      importeCobrado = importeCobrado - unImporte
  }
}

class EmpresaDeServicios{
  const property profesionales = []
  var property onorarios
  const property LisCliente =[]

  method contratarA(unProfesiona){
    profesionales.add(unProfesiona)
  }

  method estudiaronEnEstaUniversidad(universidad){
    return profesionales.filter({p=>p.universidad() == universidad}).size()
  } 

  method profesionalesMasCaro(){
    return profesionales.filter({p=>p.honorariosPorHora()> self.onorarios()})
  }

  method universidadesFormadoras(){
    return profesionales.map({p=>p.universidad()}).asSet().asList()
  }

  method elProfesionalMasBarato(){
    return profesionales.min({p=>p.honorariosPorHora()})
  }

  method genteAcotada(){
    return profesionales.all({p=> !(p.provinciaHabilitadas().size()>3)})
  }

  method satisfacerAlSolicitante(unSolicitante){
      return profesionales.any({p=>unSolicitante.puedeSeratendido(p)})
  }
  // metodo 1, para mi es el correcto, pero se me ocurrio otro.
  method darServicio(unSolicitante){
    if(self.satisfacerAlSolicitante(unSolicitante)){
       const profesionalAsignado = profesionales.find(self.satisfacerAlSolicitante(unSolicitante))
          profesionalAsignado.cobra(profesionalAsignado.honorariosPorHora()+ 4000)
          LisCliente.add(unSolicitante)
    }
  }
// esto para mi funciona pero tengo una reduncia, 
  method darServicio2(unSolicitante){
    if(unSolicitante.puedeSerAtendido(self.satisfacerAlSolicitante(unSolicitante))){
      const profesionalAsignado = profesionales.find(self.satisfacerAlSolicitante(unSolicitante))
          profesionalAsignado.cobra(profesionalAsignado.honorariosPorHora()+ 4000)
          LisCliente.add(unSolicitante)
    
    }
  }

  method cunatosClienteTiene(){
    return LisCliente.size()
  }

  method esEste(unCliente){
    return LisCliente.contains(unCliente)

  }
// Las dos esta bien o una sola ? 
  method profesionalPocoActrativo(unProfesional){
    return profesionales.any({p=>p.provinciaHabilitadas()==unProfesional.provinciaHabilitadas() 
           and p.onorarios()< unProfesional.onorarios()})
  }

  method profesionalPocoActrivo2(unProfesional){
    return profesionales.any({p=>p.provinciaHabilitadas().any({p=>unProfesional.provinciaHabilitadas(p)}) 
    and p.onorarios()< unProfesional.onorarios()})
  }
// con contein no se puede hacer la comparacion.
  
}


object asociaciónProfesionalesLitoral {
  var recaudado = 0
  method recibirRecaudacion(unMonto){
    recaudado = recaudado + unMonto
      }
}

