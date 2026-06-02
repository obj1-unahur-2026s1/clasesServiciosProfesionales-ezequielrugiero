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


object asociaciónProfesionalesLitoral {
  var recaudado = 0
  method recibirRecaudacion(unMonto){
    recaudado = recaudado + unMonto
  }
}

