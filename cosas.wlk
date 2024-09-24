object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {
    method peso() = 800
    var estado = auto
    method transformar(unEstado){
        estado = unEstado
    }
    method peligrosidad() = estado.peligrosidad()
}
// Imaginar que se pueden tener muchos estados mas, 
//para no tener que agregar un if por cada uno
object robot {
    method peligrosidad() = 30
}
object auto {
    method peligrosidad() =15
}

object paqueteDeLadrillos {
    var property cantidadLadrillos = 0 
    method peso() = 2*cantidadLadrillos
    method peligrosidad() = 2
}

object arenaAGranel {
    var property peso = 0
    method peligrosidad() = 2 
  
}

object bateriaAntiaerea {
    var estaConMisiles =false
    //method cambiarMisiles(){estaConMisiles = not estaConMisiles}
    method cargar(){estaConMisiles = true}
    method descargar(){estaConMisiles = false}
    method peso(){
        if(estaConMisiles)
            return 300
        else
            return 200
    }
    method peligrosidad(){
        if(estaConMisiles)
            return 100
        else
            return 0
    }
}

object contenedorPortuario {
    const carga = []
    method cargar(unaCosa){
        carga.add(unaCosa)
    }
    method descargar(unaCosa){
        carga.remove(unaCosa)
    }
    method peso() = 100+carga.sum({c => c.peso()}) //carga.map({c=>peso()}).sum()
    method peligrosidad(){
        if (carga.isEmpty()) return 0 
        return carga.max({c => c.peligrosidad()}).peligrosidad()
    }
}

object residuosRadioactivos {
    var property peso = 0
    method peligrosidad() = 200
}

object embalajeDeSeguridad{
    var property cosa = cosaNulleable
    method peligrosidad() = cosa.peligrosidad()*0.5
    method peso() = cosa.peso()
}

object cosaNulleable{
    method peso() = 0
    method peligrsidad() = 0
}