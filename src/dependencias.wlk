import rodados.*

		///////################  ETAPA 1  #################////////
 class Dependencia {
 	var property empleados = 0
 	var flota = []
 	var pedidos = [] 
 	
 	method flota() { return flota }
 	method agregarAFlota(rodado) { flota.add(rodado) }
 	method quitarDeFlota(rodado) { flota.remove(rodado) }
 	method llenarFlota(lista) { flota.addAll(lista) }
 	method pesoTotalFlota() { return flota.sum({rod=> rod.peso()}) }
 	method capacidadTotal() { return flota.sum({rod=> rod.capacidad()}) }
 	method estaBienEquipada() { return flota.size() >= 3 and flota.all({rod=> rod.velocidadMax() >= 100}) }
 	method capacidadTotalEnColor(color) {
 		return flota.filter({rod=> rod.color() == color}).sum({rod=> rod.capacidad()})
 	}
 	method colorDelRodadoMasRapido() { return flota.max({rod=> rod.velocidadMax()}).color() }
 	method capacidadFaltante() { return self.empleados() - self.capacidadTotal() }
 	method esGrande() { return self.empleados() >= 40 and flota.size() >=5 }
 		
 		///////################  ETAPA 3  #################////////	
 	method pedidos() { return pedidos }
 	method agregarPedido(pedido) { pedidos.add(pedido) }
 	method quitarPedido(pedido) { pedidos.remove(pedido) }
 	method totalDePasajeros() { 
 		return pedidos.sum({pedido=> pedido.cantidadDePasajeros()})	
 	}

 	method pedidosImposibles() {
 		return pedidos.filter({pedido=>flota.all({auto=> not pedido.puedeSatisfacerPedido(auto)})})
 	}
 	method colorIncompatibleParaTodos(color) {
 		return pedidos.all({pedido=> pedido.coloresIncompatibles().contains(color)}) 	
 	}
 	method relajarPedidos() { pedidos.forEach({pedido=> pedido.relajar()}) }	
 }
 
 
 		///////################  ETAPA 2  #################////////
 
class Pedido {
	var property coloresIncompatibles = []
	var property distanciaARecorrer = 0
	var property tiempoMax = 0
	var property cantidadDePasajeros = 0
	
	method velocidadRequerida() { return self.distanciaARecorrer() / self.tiempoMax() }
	method puedeSatisfacerPedido(auto) { 
		return auto.velocidadMax() >= self.velocidadRequerida() + 10 
			and auto.capacidad() >= self.cantidadDePasajeros()
			and not coloresIncompatibles.contains(auto.color())
	}
	method acelerar() { tiempoMax -= 1 }
	method relajar() { tiempoMax += 1 }
}
/// creacion de objetos para probar los métodos y no tardar mil años en consola

/*const deportes = new Dependencia(empleados = 45)
const cultura = new Dependencia(empleados = 31)
const cachito = new Corsa(color = rojo)
const corsaAzul = new Corsa(color = azul)
const corsaVerde = new Corsa(color = verde)
const kwid1 = new Kwid(tieneTanque = true)
const especial = new AutoEspecial(capacidad = 5, velocidadMax = 160, peso = 1200, color = beige)
const kwid2 = new Kwid(tieneTanque = true)
const kwid3 = new Kwid(tieneTanque = true)
const kwid4 = new Kwid(tieneTanque = false)
const pedido1 = new Pedido(distanciaARecorrer = 960, tiempoMax = 8, cantidadDePasajeros = 4, coloresIncompatibles = [])
const p2 = new Pedido(distanciaARecorrer = 200, tiempoMax = 2, cantidadDePasajeros = 3, coloresIncompatibles = [negro, verde])
const p3 = new Pedido(distanciaARecorrer = 1000, tiempoMax = 10, cantidadDePasajeros = 4, coloresIncompatibles = [rojo, verde])
const p4 = new Pedido(distanciaARecorrer = 560, tiempoMax = 9, cantidadDePasajeros = 4, coloresIncompatibles = [rojo, negro])
const p5 = new Pedido(distanciaARecorrer = 800, tiempoMax = 6, cantidadDePasajeros = 2, coloresIncompatibles = [rojo, verde])
const p6 = new Pedido(distanciaARecorrer = 379, tiempoMax = 3, cantidadDePasajeros = 1, coloresIncompatibles = [rojo, azul])*/

