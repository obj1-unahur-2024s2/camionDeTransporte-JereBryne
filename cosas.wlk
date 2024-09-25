object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bultos() = 1
    method consecuencia(){}
}

object bumblebee {
    method peso() = 800
    var estado = auto
    method transformar(unEstado){
        estado = unEstado
    }
    method peligrosidad() = estado.peligrosidad()
    method bultos() = 2
    method consecuencia(){}
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
    method bultos(){
        if(cantidadLadrillos.between(0,100)) return 1
        if(cantidadLadrillos.between(101,300)) return 2
        return 3
    }
    method consecuencia() {cantidadLadrillos += 12}
}

object arenaAGranel {
    var property peso = 0
    method peligrosidad() = 2 
    method bultos() = 1
    method consecuencia() { peso = 0.max(peso-10) }
}

object bateriaAntiaerea {
    var estaConMisiles =false
    //method cambiarMisiles(){estaConMisiles = not estaConMisiles}
    method cargarMisiles(){estaConMisiles = true}
    method descargarMisiles(){estaConMisiles = false}
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
    method bultos() { 
        if(estaConMisiles) return 2
        return 1
    }
    method consecuencia() { estaConMisiles = true }
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
    method bultos() = 1 + carga.sum({c=>c.bultos()})
    method consecuencia() {carga.forEach({c => c.consecuencia()})}
}

object residuosRadioactivos {
    var property peso = 0
    method peligrosidad() = 200
    method bultos() = 1
    method consecuencia() { peso += 15}
}

object embalajeDeSeguridad{
    var property cosa = cosaNulleable
    method peligrosidad() = cosa.peligrosidad()*0.5
    method peso() = cosa.peso()
    method bultos() = 2
    method consecuencia() {}
}

object cosaNulleable{
    method peso() = 0
    method peligrsidad() = 0
    method bultos() = 0
    method consecuencia(){}
}