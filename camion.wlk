import cosas.*.
object camion {
    const carga = []
    method carga() = carga

    method peso() = 1000+carga.sum({c=>c.peso()})

    method cargar(unaCosa){
        carga.add(unaCosa)
        unaCosa.consecuencia()
    }
    method descargar(unaCosa){carga.descargar(unaCosa)}
//
    method cargasImpares() = carga.all({c=>c.peso().odd()})
//
    method algunoPesa(unPeso) = carga.any({c=>c.peso()==unPeso})
//
    method controlPeligro(nivelPeligro) = carga.find({c=>c.peligrosidad()==nivelPeligro})//findOrElse y no hacer nada cuando no encuentra 
//
    method cosasMasPeligrosas(unPeligro) = carga.filter({c=>c.peligrosidad()>unPeligro})
//
    method cosasMasPeligrosasQue(unaCosa) = self.cosasMasPeligrosas(unaCosa.peligrosidad())
//
    method estaExcedido() = self.peso()>2500
//
    method ningunaCargaSupera(unLimite) = carga.all({c=>c.peligrosidad()<unLimite})

    method puedeCircularConimite(unLimite) = not self.estaExcedido() and self.ningunaCargaSupera(unLimite)
//
    method algunaCosaPesaEntre(valorMinimo,valorMaximo) = carga.any({c=>c.peso().between(valorMinimo,valorMaximo)})
//
    method cargaMasPesada() = carga.max({c=>c.peso()})
//
    method bultosTotales() = carga.sum({c=>c.bultos()})

}