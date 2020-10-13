import dependencias.*
import wollok.game.*
		///////################  ETAPA 1  #################////////

class Corsa {
	var property color
	var property position = new Position(x=0, y=0)
	var property image = "autitorojo.png"
	var property recorrido = #{}
	
	method capacidad() { return 4 }
	method velocidadMax() { return 150 }
	method peso() { return 1300 }
	
	/////////######## GAME ########/////////////
	method moverDerecha(){
		self.position(self.position().right(1))
		recorrido.add(self.position())
	}
	
	method moverIzquierda(){
		self.position(self.position().left(1))
		recorrido.add(self.position())
	}
	
	method moverArriba(){
		self.position(self.position().up(1))
		recorrido.add(self.position())
	}
	
	method moverAbajo(){
		self.position(self.position().down(1))
		recorrido.add(self.position())
	}
	
	method moverA(unaPosicion){
		self.position(unaPosicion)
		recorrido.add(unaPosicion)
	}
	method pasoPor(unaPosicion) { return recorrido.contains(unaPosicion) }
	
	method filasRecorridas() {
		return recorrido.map({posicion => posicion.x()}).asSet()
	}
	method pasoPorFila(numeroDeFila) {
		return self.filasRecorridas().contains(numeroDeFila)
	}
	method recorrioFilas(listaDeFilas) {
		return listaDeFilas.all({fila=> self.pasoPorFila(fila)})
	}
}

class Kwid {
	var property tieneTanque
	
	method capacidad() { return if (tieneTanque) {3} else {4} }
	method velocidadMax() { return if (tieneTanque) {120} else {110} }
	method peso() { return if (tieneTanque) {1350} else {1200} }
	method color() { return azul }
}

object traffic {
	var property interior
	var property motor
	
	method capacidad() { return interior.capacidad() }
	method velocidadMax() { return motor.velocidadMax() }
	method peso() { return 4000 + interior.peso() + motor.peso() }
	method color() { return blanco }
}

class AutoEspecial {
	var property capacidad
	var property velocidadMax
	var property peso
	var property color
}

//interiores
object comodo {
	method capacidad() { return 5 }
	method peso() { return 700}
}
object popular {
	method capacidad() { return 12 }
	method peso() { return 1000}
}
//motores
object pulenta {
	method peso() { return 800 }
	method velocidadMax() { return 130 }
}
object bataton {
	method peso() { return 500 }
	method velocidadMax() { return 80 }
}
//colores
object rojo { }
object blanco { }
object azul { }
object violeta { }
object verde { }
object negro { }
object beige { }

//Direcciones
object norte {}
object sur {}
object oeste {}
object este {}

