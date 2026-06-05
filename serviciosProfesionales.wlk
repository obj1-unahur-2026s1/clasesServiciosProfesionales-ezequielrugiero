import solicitantes.*
class Universidad{
  var  provincia 
  var  honorariosRecomedados
  var  donaciones = 0

  method provincia ()= provincia
  method honorariosRecomedados()= honorariosRecomedados
  method donaciones()= donaciones

  method recibirDonaciones(unMonto){
    donaciones = donaciones + unMonto
  }

}
// Esta bien hacer todas las clase en un solo archivo
class ProfesionalesViculados{
   var universidad 
   const provinciaHabilitadas = [universidad.provincia()]
   var importeCobrado = 0
   method honorariosPorHora() = universidad.honorariosRecomedados() 


   method universidad ()= universidad
   method provinciaHabilitadas()=provinciaHabilitadas
   method importeCobrado()=importeCobrado

   
   method habilitarEstaProvincia(unaProvinicia){
    provinciaHabilitadas.add(unaProvinicia)
  }
  method cobrar(unImporte){
   const donacion =unImporte.div(2)
   universidad.recibirDonaciones(donacion)
   
  }

}

class ProfesionalesAsociados{
  var  universidad
  const  provinciaHabilitadas = ["Entre Rios", "Santa Fe", "corriente"]
  var  importeCobrado = 0
  method honorariosPorHora() = 3000

  method universida ()= universidad
  method provinciaHabilitadas()=provinciaHabilitadas
  method importeCobrado()=importeCobrado
  
  method habilitarEstaProvincia(unaProvinicia){
    provinciaHabilitadas.add(unaProvinicia)
  }

  method cobrar(unImporte){
    asociaciónProfesionalesLitoral.recibirRecaudacion(unImporte)
  }

}

class ProfesioanlesLibre{
  var universidad 
  var provinciaHabilitadas 
  var honorariosPorHora
  var importeCobrado = 0

  method universida ()= universidad
  method provinciaHabilitadas()=provinciaHabilitadas
  method importeCobrado()=importeCobrado
  method honorariosPorHora()=honorariosPorHora

  method habilitarEstaProvincia(unaProvinicia){
    provinciaHabilitadas.add(unaProvinicia)
  }

  method cobrar(unImporte){
    importeCobrado = importeCobrado + unImporte

  }

  method pasarImporteAUnCompañero(unImporte, unCompañero){
      unCompañero.cobrar(unImporte)
      importeCobrado = importeCobrado - unImporte
  }
}

class EmpresaDeServicios{
  const  profesionales = []
  var  honorarios
  const  LisCliente =[]


  method honorarios()= honorarios

  method contratarA(unProfesiona){
    profesionales.add(unProfesiona)
  }

  method estudiaronEnEstaUniversidad(universidad){
    return profesionales.filter({p=>p.universidad() == universidad}).size()
  } 

  method profesionalesMasCaro(){
    return profesionales.filter({p=>p.honorariosPorHora()> self.honorarios()})
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
      return profesionales.any({p=>unSolicitante.puedeSerAtendido(p)})
  }
  // metodo 1, para mi es el correcto, pero se me ocurrio otro.
  method darServicio(unSolicitante){
    if(self.satisfacerAlSolicitante(unSolicitante)){
       var profesionalAsignado = profesionales.find({p=>unSolicitante.puedeSerAtendido(p)})
          profesionalAsignado.cobrar(profesionalAsignado.honorariosPorHora()+ 4000)
          LisCliente.add(unSolicitante)
    }
  }
// esto para mi funciona pero tengo una reduncia, 
  method darServicio2(unSolicitante){
    if(unSolicitante.puedeSerAtendido(self.satisfacerAlSolicitante(unSolicitante))){
      const profesionalAsignado = profesionales.find({p=>p.satisfacerAlSolicitante(unSolicitante)})
          profesionalAsignado.cobrar(profesionalAsignado.honorariosPorHora() + 4000)
          LisCliente.add(unSolicitante)
    
    }
  }

  method cuantosClientesTiene(){
    return LisCliente.size()
  }

  method esEste(unCliente){
    return LisCliente.contains(unCliente)

  }
// Las dos esta bien o una sola ? 
  method profesionalPocoActrativo(unProfesional){
    return profesionales.any({p=>p.provinciaHabilitadas()==unProfesional.provinciaHabilitadas() 
           and p.honorariosPorHora()< unProfesional.honorariosPorHora()})
  }

  method profesionalPocoActrivo2(unProfesional){
    return unProfesional.provinciaHabilitadas().all({prov=>profesionales.any({p=>p.provinciaHabilitadas().contains(prov) 
            and p.honorariosPorHora() < unProfesional.honorariosPorHora()})}) 
    
  }
// con contein no se puede hacer la comparacion.
  
}


object asociaciónProfesionalesLitoral {
  var recaudado = 0

  method recaudado()=recaudado
  method recibirRecaudacion(unMonto){
    recaudado = recaudado + unMonto
      }
}

