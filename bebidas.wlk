object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

object licuadoDeFrutas {
  const frutas = #{}

  method agregarFruta(fruta) {
    frutas.add(fruta)
  }
  method removerFruta(fruta) {
    frutas.remove(fruta)
  }
  method rendimientoQueOtorga(dosisConsumida) =
    frutas.sum { fruta => fruta.nutrientes() } * dosisConsumida / 1000
}

object banana {
  method nutrientes() = 3
}

object frutilla {
  method nutrientes() = 5
}

object aguaSaborizada {
  const bebidas = #{}
  method agregarBebida(bebida) {
    bebidas.add(bebida)
  }
  method removerBebida(bebida) {
    bebidas.remove(bebida)
  }
  method rendimientoQueOtorga(dosisConsumida) =
    1 + bebidas.first().rendimientoQueOtorga(dosisConsumida / 4)
}

object coctel {
  const bebidas = #{}
  method agregarBebida(bebida) {
    bebidas.add(bebida)
  }
  method removerBebida(bebida) {
    bebidas.remove(bebida)
  }
  method rendimientoQueOtorga(dosisConsumida){
    var resultado = 1
    bebidas.forEach { bebida => resultado *= bebida.rendimientoQueOtorga(dosisConsumida / bebidas.size()) }
    return resultado
  }
}